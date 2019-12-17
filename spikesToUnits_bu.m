function analysis = spikesToUnits(spikes, analysis, spikeConfig)

% coding of scores:
%  scoreID   trialType    score
%    1          GO       HIT+MISS
%    2          GO         HIT
%    3          GO         MISS
%    4          GO         HIT
%    5          GO         MISS
%    1         NOGO       CA+FA
%    2         NOGO        CA
%    3         NOGO        FA
%    4         NOGO        FA
%    5         NOGO        CA

	if ~iscell(analysis)
		single = true;
		analysis = {analysis};
	else
		single = false;
	end

	if strcmpi(spikeConfig, 'unsorted')
		if single
			spikes = {spikes};
		end
		
	elseif any(strcmpi(spikeConfig, {'sorted', 'sortedjoint'}))
		% read UltraMegaSort's output and separate spikes into the analysis
		% struct they belong to (different recordings of same session)
		% only in process or good units
		if ~iscell(spikes); spikes = {spikes}; end
		
		labelCats = spikes.params.display.label_categories;
		inProcess = find(strcmpi(labelCats, 'in process'));
		goodUnit = find(strcmpi(labelCats, 'good unit'));
		labelsMask = spikes.labels(:,2)==inProcess | ...
			spikes.labels(:,2)==goodUnit;
		unitNumbers = spikes.labels(labelsMask, 1);
		unitCount = length(unitNumbers);
		spikeDuration = spikes.params.window_size*1e-3; % ms to s
		
		trialsSoFar = 0;
		spikes2 = cell(size(analysis));
		
		for analysisID = 1:length(analysis)
			a = analysis{analysisID}; % unpack
			sp = cell(a.trialCount, unitCount);
			for trialID = 1:a.trialCount
				for unitID = 1:unitCount
					msk = spikes.trials==trialID+trialsSoFar & ...
						spikes.assigns==unitNumbers(unitID);
					sp{trialID, unitID} = double(spikes.spiketimes(msk));
				end
			end
			spikes2{analysisID} = sp; % pack
			trialsSoFar = trialsSoFar + a.trialCount;
		end
		spikes = spikes2;
	else
		error('[spikesToUnits] invalid unit type');
	end
	
	
	for analysisID = 1:length(analysis)
		a = analysis{analysisID}; % unpack
		sp = spikes{analysisID};
		
		if strcmpi(spikeConfig, 'unsorted')
			a.unitCount = length(a.channels);
		elseif strcmpi(spikeConfig, 'sortedjoint')
			a.unitNumbers = unitNumbers;
			a.unitCount = unitCount;
		end
		
		a.units = cell(1, a.unitCount);
		
		for unitID = 1:a.unitCount % choose unit (channel) number
			u                   = struct();    % unit struct
			u.animalName        = a.animalName;
			u.dataPath          = a.dataPath;
			u.dataFile          = a.dataFile;
			u.type              = spikeConfig;
			if strcmpi(spikeConfig, 'unsorted')
			end
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
			if strcmpi(spikeConfig, 'unsorted')
				u.label         = sprintf('Ch %d', a.channels(unitID));
				u.spikeDuration = a.spikeDuration;
				u.spikeThresholdFactor = a.spikeThresholdFactor;
				u.spikeThreshold = a.spikeThreshold(unitID);
				u.artifactDuration = a.artifactDuration;
				u.artifactThresholdFactor = a.artifactThresholdFactor;
				u.artifactThreshold = a.artifactThreshold(unitID);
			elseif strcmpi(spikeConfig, 'sortedjoint')
				u.label         = sprintf('Unit %d', unitNumbers(unitID));
				u.spikeDuration = spikeDuration;
			end

			% spike times per stimulus condition and score for each trial
			u.spikeTimes = cell(u.condCount, 3);

			for condID = 1:u.condCount
				for scoreID = 1:5
					u.spikeTimes{condID,scoreID} = {};
				end
			end

			% this iterates through all the cut sequences (trials)
			for trialID = 1:a.trialCount

				% find stimulus condition ID
				condID = getCondID(a.trialLog(trialID), a);

				% relative to tone onset
				spikeTimes = sp{trialID, unitID} + u.viewBounds(1);
				
				u.spikeTimes{condID,1}{end+1} = spikeTimes;

				% look 'coding of scores' at the top
				score = a.trialLog(trialID).score;
				if any(strcmpi(score, {'HIT', 'CR'}))
					u.spikeTimes{condID,2}{end+1} = spikeTimes;
				end
				if any(strcmpi(score, {'MISS', 'FA'}))
					u.spikeTimes{condID,3}{end+1} = spikeTimes;
				end
				if any(strcmpi(score, {'HIT', 'FA'}))
					u.spikeTimes{condID,4}{end+1} = spikeTimes;
				end
				if any(strcmpi(score, {'MISS', 'CR'}))
					u.spikeTimes{condID,5}{end+1} = spikeTimes;
				end

			end % trialID

			% store analyzed unit in the analysis struct
			a.units{unitID} = u;

		end % unitID
		
		analysis{analysisID} = a; % pack
		
	end % analysisID
	
	
	if single
		analysis = analysis{1};
	end
end
