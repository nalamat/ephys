function analysis = extractSpikesOld(analysis, ...
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
%   2       GO         1          50
%   3       GO         1          60
%   4       GO         1          70
%   5       GO         2          50
%   6       GO         2          60
%   7       GO         2          70
%
% coding of scores:
%  scoreID   trialType    score
%    1          GO       HIT+MISS
%    2          GO         HIT
%    3          GO         MISS
%    1         NOGO       CA+FA
%    2         NOGO        CA
%    3         NOGO        FA

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
		[trialView, a]      = readTrialView(a);
		
		a.spikeThreshold    = a.noiseFloor * a.spikeThresholdFactor;
		a.artifactThreshold = a.noiseFloor * a.artifactThresholdFactor;
		a.unitCount         = length(a.channels);
		a.units             = cell(size(a.channels));

		for unitID = 1:a.unitCount % choose unit (channel) number

			u                   = struct();    % unit analysis struct
			u.animalName        = a.animalName;
			u.dataPath          = a.dataPath;
			u.dataFile          = a.dataFile;
			u.type              = 'multiunit';
			u.label             = sprintf('Ch %d', a.channels(unitID));
			% each unit also holds a copy of some analysis parameters
			u.fs                = a.fs;
			u.viewBounds        = a.viewBounds;
% 			u.trialCount        = a.trialCount;
			u.maskerFile        = a.maskerFile;
			u.maskerLevel       = a.maskerLevel;
			u.targetDuration    = a.targetDuration;
			u.targetFreqs       = a.targetFreqs;
			u.targetLevels      = a.targetLevels;
			u.condCount         = a.condCount;
% 			u.trialCountPerCond = a.trialCountPerCond;
			u.spikeDuration     = a.spikeDuration;
			u.spikeThresholdFactor = a.spikeThresholdFactor;
			u.spikeThreshold    = a.spikeThreshold(unitID);
			u.artifactDuration  = a.artifactDuration;
			u.artifactThresholdFactor = a.artifactThresholdFactor;
			u.artifactThreshold = a.artifactThreshold(unitID);

			% spike times per stimulus condition and score for each trial
			u.spikeTimes = cell(u.condCount, 3);

			% time interval between each two consecutive spike
			% per stimulus condition and score for each trial
			u.spikeIntervals = cell(u.condCount, 3);

			for condID = 1:u.condCount
				for scoreID = 1:3
					u.spikeTimes{condID,scoreID} = {};
					u.spikeIntervals{condID,scoreID} = {};
				end
			end

			% this iterates through all the cut sequences (trials)
			for trialID = 1:u.trialCount

				% find stimulus condition ID
				condID = getCondID(a.trialLog(trialID), a);
				score = a.trialLog(trialID).score;
				if any(strcmpi(score, {'HIT', 'CR'}))
					scoreID = 2;
				elseif any(strcmpi(score, {'MISS', 'FA'}))
					scoreID = 3;
				else
					scoreID = 0;    % NONE
				end

				trace = trialView{trialID, unitID};
				if isempty(trace); continue; end

				% extract spike times
				spikeTimes = extractSpikesFromTrace(trace, a.fs, ...
					a.spikeThreshold(unitID), a.spikeDuration, ...
					a.artifactThreshold(unitID), a.artifactDuration);
				
				% relative to tone onset
				spikeTimes = spikeTimes + a.viewBounds(1);

				u.spikeTimes{condID,1}{end+1} = spikeTimes;
% 				u.spikeIntervals{condID,1}{end+1} = spikeIntervals;

				% look 'coding of scores' at the top
				if scoreID
					u.spikeTimes{condID,scoreID}{end+1} = spikeTimes;
% 					u.spikeIntervals{condID,scoreID}{end+1}=spikeIntervals;
				end

			end % trialID

			% store analyzed unit in the analysis struct
			a.units{unitID} = u;

		end % unitID

		analysis{analysisID} = a;
	end % analysisID
	
	if single
		analysis = analysis{1};
	end
	
end % extractSpikes
