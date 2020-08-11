% Read physiology traces from an HDF5 file and split them into
% peri(pre/peri/post)-stimulus windows for each individual trial.
% Compatible with data collected at NYU and NJIT using Neurobehavior
% and EARS software.
% 
% In args:
%     arg1 = file (char array)
%         HDF5 to be read.
%     or
%     arg1 = a (struct)
%         Must have:
%         - dataPath: Relative or absolute path of data folder
%         - dataFile: Concatenated to dataPath to obtain full file path.
%         Can have: 
%         - channels (int array): Channel numbers to include in
%           preprocessing and extraction of physiology traces. Optional,
%           defaults to 'all'.
%         - excludeTrials (int array): Which trials to exclude both from
%           the returning trialView and trialLog. Defaults to 'none'.
%         - excludeNoisy (bool): Automatically exclude noisy trials in
%           addition to the explicitly specified ones. Defaults to false.
%         - viewBounds (int array): How long before and after target onset
%           to extract from the physiology traces. Defaults to [-1, 2].
%
% Out args:
%     trialView (cell array of vectors): Physiology aligned to target onset
%		{trials x channels} x [view].
%	  lfp (4-D matrix): Power of LFP bands (trials x channels x bands x 3).
%     a (struct):
%         - trialLog (array of structs): Trial by trial set of values and
%           parameters.
%         - version (char array): One of the following values:
%           'ears', 'neurobehavior@njit', 'neurobehavior@nyu'
%         - fs (double): Sampling frequency of the phyiology trace in Hz.
%         - noiseFloor (double): Noise floor of each channel.
function [trialView, lfp, a] = readTrialView(arg1)
	% set a sample file for testing
	if ~exist('arg1', 'var')
		arg1 = ['../Data/CMR05Fluffy/CMR05Fluffy-20190609-' ...
			'142823-MMR-Physiology-Passive-1kToneSupermasker.h5'];
	end
	
	% two-sided padding of view bounds in seconds to prevent window onset
	% and offset filtering artifacts
	pad = 1;
	
	% if trial log and other info are not given, get them from the file
% 	if ~(exist('trialLog', 'var') && exist('version', 'var') && ...
% 			exist('rootGroup', 'var'))
	a = readTrialLog(arg1);
% 	end

	a.spikesBand = [300, 6e3];
	a.lfpBands = {[8, 12], [12, 30], [30, 60]};
	a.lfpBandNames = {'alpha', 'beta', 'gamma'};
	a.lfpBandCount = length(a.lfpBands);
	
	% default view bounds are 1sec before tone onset and 1sec after offset
	if ~isfield(a, 'viewBounds')
		a.viewBounds = [-1, max(a.targetDuration)+1];
	end
	
	% prepare a list of trials to be excluded
	if ~isfield(a, 'excludeTrials') || strcmpi(a.excludeTrials, 'none')
		a.excludeTrials = [];
	end

	% EARS
	if strcmpi(a.version, 'ears')
		physNode = '/trace/physiology';
	% Neurobehavior@NJIT
	elseif strcmpi(a.version, 'neurobehavior@njit')
		physNode = [a.rootGroup '/data/physiology/raw'];
	elseif strcmpi(a.version, 'neurobehavior@nyu')
		physNode = [a.rootGroup '/data/physiology/raw'];
	else
		error('[plotPhysiology] Unexpected data file version');
	end

	% read raw physiology trace
	a.fs = h5readatt([a.dataPath a.dataFile], physNode, 'fs');
	phys = h5read   ([a.dataPath a.dataFile], physNode);
	phys = double(phys);
	
	% compatibility
	if strcmp(a.version, 'ears')
		% swap time and channel axes
		phys = phys';
	elseif strcmp(a.version, 'neurobehavior@njit')
		% skip the first channel, AI 0 is not connected
		phys = phys(:,2:16);
		% in Neurobehavior@NJIT raw data is scaled down for visualization
		% and consequently the down scaled data is stored
		% see neurobehavior/experiments/physiology_controller.py:122
		% here we have to scale it back up
		phys = phys * 1e3;
	elseif strcmpi(a.version, 'neurobehavior@nyu')
		% TODO: determine which channel is not connected
	end
	
	% TBSI W16 recording system has a default total gain of 800
	% returned data will be in volts as picked up at the recording site
	phys = phys / 800;
	
	% if given, select a subset of channels
	if isfield(a, 'channels') && ~strcmpi(a.channels, 'all')
		phys = phys(:, a.channels);
	else
		a.channels = 1:size(phys, 2);
	end
	
	channelCount = size(phys, 2);
	
	% extract segments of physiological trace per trial and channel
	trialView = cell(length(a.trialLog), channelCount);
	% extract LFP power per trial, channel, band and time segment
	lfp = zeros(length(a.trialLog), channelCount, a.lfpBandCount, 3);
	
	% number of samples before and after sound onset
	lb = round((a.viewBounds(1) - pad) * a.fs);
	ub = round((a.viewBounds(2) + pad) * a.fs);
	padNS = round(pad * a.fs);
	
	% iterate over trials, extract trace and filter at different bands
	for trialID = 1:length(a.trialLog)
		% exclude trials that have no target start timestamp
		if isempty(a.trialLog(trialID).targetStart)
			a.excludeTrials = [a.excludeTrials, trialID];
			continue;
		end
		
		% padded window bounds
		targetStartNS = round(a.fs * a.trialLog(trialID).targetStart) + 1;
		startNS = targetStartNS + lb;
		stopNS  = targetStartNS + ub;
		
		% exclude trials that don't have sufficient padding before or after
		if startNS < 1 || size(phys, 1) < stopNS
			a.excludeTrials = [a.excludeTrials, trialID];
			continue;
		end
		
		% extract padded time window
		physTrial = phys(startNS:stopNS, :);

		% substract the grand mean from each channel
% 		if strcmpi(a.lfpBandNames{bandID}, 'spikes')
			for ch = 1:channelCount
				grandMean = mean(physTrial, 2) - ...
					physTrial(:, ch) / channelCount;
				physTrial(:, ch) = physTrial(:, ch) - grandMean;
			end
% 		end

		% bandpass the raw data
		[filtb, filta] = butter(6, a.spikesBand / (a.fs / 2));
		physTrialSpikes = filtfilt(filtb, filta, physTrial);
		% remove extra padding
		physTrialSpikes = physTrialSpikes(padNS+1:end-padNS, :);
		
		% TODO: do this without for loop
		for channelID = 1:channelCount
			trialView{trialID, channelID} = physTrialSpikes(:, channelID);
		end
		
		for bandID = 1:a.lfpBandCount
			% bandpass the raw data
			[filtb, filta] = butter(2, a.lfpBands{bandID} / (a.fs / 2));
			physTrialBand = filtfilt(filtb, filta, physTrial);
			% remove extra padding
			physTrialBand = physTrialBand(padNS+1:end-padNS, :);
			
			targetStartNS = -a.viewBounds * a.fs + 1;
			targetStopNS = targetStartNS + max(a.targetDuration) * a.fs;
			
			lfp1 = rms(physTrialBand(1:targetStartNS-1, :));
			lfp2 = rms(physTrialBand(targetStartNS:targetStopNS-1, :));
			lfp3 = rms(physTrialBand(targetStopNS:end, :));
			
			for channelID = 1:channelCount
				lfp(trialID, channelID, bandID, 1) = lfp1(channelID);
				lfp(trialID, channelID, bandID, 2) = lfp2(channelID);
				lfp(trialID, channelID, bandID, 3) = lfp3(channelID);
			end
		end
	end
	
	% calculate noise floor using formula by Quiroga et al. 2004
	% this is not for LFP bands, only for spikes
	allTrials = cell2mat(squeeze(trialView(:,:)));
	a.noiseFloor = median(abs(allTrials)) / 0.6745;
	
	% exclude noisy trials
	if ~isfield(a, 'excludeNoisy'); a.excludeNoisy = false; end
	if a.excludeNoisy
		for trialID = 1:length(a.trialLog)
			trial = cell2mat(squeeze(trialView(trialID, :)));
			trialNoiseFloor = median(abs(trial)) / 0.6745;
			noiseRatio = trialNoiseFloor ./ a.noiseFloor;
			if mean(noiseRatio) >= 1.2
				a.excludeTrials = [a.excludeTrials, trialID];
			end
		end
	end
	
	% drop invalid trial numbers from exclusion list
	invalid = (a.excludeTrials<1) | ...
		(length(a.trialLog)<a.excludeTrials);
	if any(invalid)
		fprintf('Invalid exclusion trial count: %d\n', ...
			sum(invalid));
		a.excludeTrials(invalid) = [];
	end
	
	% exclude designated trials from trialLog and trialView
	a.excludeTrials = unique(a.excludeTrials);
	if ~isempty(a.excludeTrials)
		fprintf('Excluding trials: %d/%d (%.2f%%)\n', ...
			length(a.excludeTrials), length(a.trialLog), ...
			100*length(a.excludeTrials)/length(a.trialLog));
% 		disp(a.excludeTrials);
		a.trialLog(a.excludeTrials) = [];
		trialView(a.excludeTrials, :) = [];
		lfp(a.excludeTrials, :, :, :) = [];
		
		% recount trials
		a.trialCount = length(a.trialLog);
		a.trialCountPerCond = zeros(1, a.condCount);
		for trialID = 1:a.trialCount
			condID = getCondID(a.trialLog(trialID), a);
			a.trialCountPerCond(condID) = a.trialCountPerCond(condID) + 1;
		end
	end

end % readTrialView
