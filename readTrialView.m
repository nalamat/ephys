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
%            to extract from the physiology traces. Defaults to [-1, 2].
%
% Out args:
%     trialView (cell array of vectors): {Trials x channels} x [view]
%     a (struct):
%         - trialLog (array of structs): Trial by trial set of values and
%           parameters
%         - version (char array): One of the following values:
%           'ears', 'neurobehavior@njit', 'neurobehavior@nyu'
%         - fs (double): Sampling frequency of the phyiology trace in Hz.
%         - noiseFloor (double): Noise floor of each channel.
function [trialView, a] = readTrialView(arg1)
	% set a sample file for testing
	if ~exist('arg1', 'var')
		arg1 = ['../Data/CMR04Tail/CMR04Tail_PositiveCMR_20180510' ...
			'_130424_Passive_0.5kTone75dB.h5'];
	end
	
	% if trial log and other info are not given, get them from the file
% 	if ~(exist('trialLog', 'var') && exist('version', 'var') && ...
% 			exist('rootGroup', 'var'))
	a = readTrialLog(arg1);
% 	end

	% EARS
	if strcmpi(a.version, 'ears')
		physNode = '/trace/physiology';
	% Neurobehavior@NJIT
	elseif strcmpi(a.version, 'neurobehavior@njit')
		physNode = [a.rootGroup '/data/physiology/raw'];
	elseif strcmpi(a.version, 'neurobehavior@nyu')
		physNode = [a.rootGroup '/data/physiology/raw'];
	else
		error('[plotPhysiology] Unexpected data version');
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
		% skip the first channel
		phys = phys(:,2:16);
		% in Neurobehavior@NJIT raw data is scaled down for visualization
		% and consequently the down scaled data is stored
		% see neurobehavior/experiments/physiology_controller.py:122
		phys = phys * 1e3;
	end
	
	% TBSI W16 recording system has a default total gain of 800
	% returned data will be in volts as picked up at the recording site
	phys = phys / 800;
	
	% if given, select a subset of channels
	if isfield(a, 'channels') && ~strcmpi(a.channels, 'all')
		phys = phys(:, a.channels);
	else
		a.channels = 1:size(phys,2);
	end

	% substract the grand mean from each channel
	for i = 1:size(phys,2)
		grandMean = mean(phys, 2) - phys(:,i)/size(phys,2);
		phys(:,i) = phys(:,i) - grandMean;
% 		phys(:,i) = phys(:,i);
	end
	
	% bandpass the raw data
	[filtb,filta] = butter(6,[300,6e3]/(a.fs/2));
	physFilt = filtfilt(filtb, filta, phys);

	% calculate noise floor using formula by Quiroga et al. 2004
	a.noiseFloor = median(abs(physFilt))/0.6745;

	if ~isfield(a, 'viewBounds'); a.viewBounds = [-1, 2]; end
	lb = round(a.viewBounds(1)*a.fs)+1; % how long before sound onset
	ub = round(a.viewBounds(2)*a.fs);   % how long after sound offset
	
	% prepare a list of trials to be excluded
	if ~isfield(a, 'excludeTrials') || strcmpi(a.excludeTrials, 'none')
		a.excludeTrials = [];
	end
	
	% remove out of bound trials
	outOfBound = (a.excludeTrials<1) | ...
		(length(a.trialLog)<a.excludeTrials);
	if any(outOfBound)
		fprintf('Out of bound exclusion trial count: %d\n', ...
			sum(outOfBound));
		a.excludeTrials(outOfBound) = [];
	end
	
	% expand trial exclusion list with more conditions
	for i=1:length(a.trialLog)
		% exclude trials that have no target start timestamp
		if isempty(a.trialLog(i).targetStart)
			a.excludeTrials = [a.excludeTrials, i];
			continue;
		end
		
		% time window bounds
		startNS = round(a.fs*(a.trialLog(i).targetStart))+lb;
		stopNS  = round(a.fs*(a.trialLog(i).targetStart))+ub;
		
		% exclude trials that don't have sufficient padding before or after
		if startNS<1 || size(phys,1)<stopNS
			a.excludeTrials = [a.excludeTrials, i];
			continue;
		end
		
		% exclude noisy trials
		if ~isfield(a, 'excludeNoisy'); a.excludeNoisy = false; end
		if a.excludeNoisy
			noiseFloor2 = median(abs(physFilt(startNS:stopNS,:)))/0.6745;
			noiseRatio = noiseFloor2 ./ a.noiseFloor;
			if mean(noiseRatio) >= 1.2
				a.excludeTrials = [a.excludeTrials, i];
				continue;
			end
		end
	end
	
	% exclude designated trials from trial log
	a.excludeTrials = unique(a.excludeTrials);
	if ~isempty(a.excludeTrials)
		fprintf('Excluding trials: %d/%d (%.2f%%)\n', ...
			length(a.excludeTrials), length(a.trialLog), ...
			100*length(a.excludeTrials)/length(a.trialLog));
% 		disp(d.excludeTrials);
		a.trialLog(a.excludeTrials) = [];
		
		% recount trials
		a.trialCount = length(a.trialLog);
		a.trialCountPerCond = zeros(1, a.condCount);
		for trialID = 1:a.trialCount
			condID = getCondID(a.trialLog(trialID), a);
			a.trialCountPerCond(condID) = a.trialCountPerCond(condID) + 1;
		end
	end

	% extract segments of physiological trace per trial
	trialView = cell(length(a.trialLog), size(physFilt,2));
	for i=1:length(a.trialLog)
		% time window bounds
		startNS = round(a.fs*(a.trialLog(i).targetStart))+lb;
		stopNS  = round(a.fs*(a.trialLog(i).targetStart))+ub;
		for j=1:size(physFilt,2)
			trialView{i,j} = physFilt(startNS:stopNS, j);
		end
	end

end % readTrialView
