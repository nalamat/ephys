function [spikes, lfps, analysis] = extractSpikesAndLFP(analysis, ...
	excludeNoisy, viewBounds, ...
	spikeDuration, spikeThresholdFactor, ...
	artifactDuration, artifactThresholdFactor)
% analyze raw physiology traces from data files
% in args:
%     analysis (cell array of structs)
%     viewBounds (array of 2 doubles): seconds before and after tone onset
%         to analyze
%     excludeNoisy (bool)
% out args:
%     analysis (cell array of structs)
%     spikes
%     lfps

% read data from several files using readTrialView
% select the relevant elctrode numbers you are interested in
% select the trial type - Frequency and Intensity for a given masker type
% perform spike detection using voltage thresholding
% calculate ISI inter-arrival time for the spikes
% calculate mean firing rate for each session and stores it in a .mat file
% NYU data fs: 24414.0625
% NJIT data fs: 31250.0
%
% coding of conditions:
% condID trialType targetFreq targetLevel
%   1      NOGO        -          -
%   2       GO         1          40
%   3       GO         1          50
%   4       GO         1          60
%   5       GO         2          40
%   6       GO         2          50
%   7       GO         2          60

	% scores = {'ALL', 'CR', 'FA';
	% 	'ALL', 'HIT', 'MISS'};
	
	if ~iscell(analysis)
		single = true;
		analysis = {analysis};
	else
		single = false;
	end
	
	if ~exist('excludeNoisy'           , 'var')
		excludeNoisy            = true;    end
	if ~exist('viewBounds'             , 'var')
		viewBounds              = [-1, 2]; end
	if ~exist('spikeDuration'          , 'var')
		spikeDuration           = 2e-3;    end
	if ~exist('spikeThresholdFactor'   , 'var')
		spikeThresholdFactor    = 4.8;     end
	if ~exist('artifactDuration'       , 'var')
		artifactDuration        = 10e-3;   end
	if ~exist('artifactThresholdFactor', 'var')
		artifactThresholdFactor = 30;      end
	
	spikes = cell(1, length(analysis));
	lfps = cell(1, length(analysis));

	for analysisID = 1:length(analysis)
		a = analysis{analysisID};   % unpack
		
		a.excludeNoisy            = excludeNoisy;
		a.viewBounds              = viewBounds;
		a.spikeDuration           = spikeDuration;
		a.spikeThresholdFactor    = spikeThresholdFactor;
		a.artifactDuration        = artifactDuration;
		a.artifactThresholdFactor = artifactThresholdFactor;

		fprintf('Loading data file: %s\n', a.dataFile);

		% first import data by reading .h5 file and bandpass filtering
		[trialView, lfp, a]      = readTrialView(a);
		
		a.spikeThreshold    = a.noiseFloor * a.spikeThresholdFactor;
		a.artifactThreshold = a.noiseFloor * a.artifactThresholdFactor;
		
		sp = cell(a.trialCount, length(a.channels));
		
		% this iterates through all the cut sequences (trials)
		for trialID = 1:a.trialCount
			% choose unit (channel) number
			for unitID = 1:length(a.channels)

				trace = trialView{trialID, unitID};
				if isempty(trace); continue; end

				sp{trialID, unitID} = extractSpikesFromTrace( ...
					trace, a.fs, a.spikeThreshold(unitID), ...
					a.spikeDuration, a.artifactThreshold(unitID), ...
					a.artifactDuration);

			end % unitID

		end % trialID

		analysis{analysisID} = a;
		spikes{analysisID} = sp;
		lfps{analysisID} = lfp;
	end % analysisID
	
	if single
		analysis = analysis{1};
		spikes = spikes{1};
		lfps = lfps{1};
	end
	
end % extractSpikes
