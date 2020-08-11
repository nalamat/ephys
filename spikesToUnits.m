function analysis = spikesToUnits(spikes, lfps, analysis, spikeConfig)

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
	scoreCount = 5;

	unitTypeMap = containers.Map( ...
		{'in process', 'good unit', 'multi-unit'}, ...
		{'In Process', 'Single', 'Multi'});

	if ~iscell(analysis)
		single = true;
		analysis = {analysis};
	else
		single = false;
	end

	if strcmpi(spikeConfig, 'unsorted')
		if single
			spikes = {spikes};
			lfps = {lfps};
		end
		
	elseif any(strcmpi(spikeConfig, {'sorted', 'sortedjoint'}))
		% read UltraMegaSort's output and separate spikes into the analysis
		% struct they belong to (different recordings of same session)
		% only in process or good units
		if ~iscell(spikes); spikes = {spikes}; end
		
		spikes2 = cell(length(analysis));
		unitNumbersAll = [];
		unitCountAll = 0;
		unitChannels = [];
		unitTypes = {};
		
		lfps = cell(length(analysis)); % empty
		
		for channelID = 1:length(spikes)
			sp = spikes{channelID};
			labelCats = sp.params.display.label_categories;
			goodUnit = find(strcmpi(labelCats, 'good unit'));
			multiUnit = find(strcmpi(labelCats, 'multi-unit'));
			inProcess = find(strcmpi(labelCats, 'in process'));
			labelsMask = sp.labels(:,2)==goodUnit | ...
				sp.labels(:,2)==multiUnit;
			if strcmpi(spikeConfig, 'sortedjoint')
				labelsMask = labelsMask | sp.labels(:,2)==inProcess;
			end
			unitNumbers = sp.labels(labelsMask, 1);
			unitCount = length(unitNumbers);
			spikeDuration = sp.params.window_size*1e-3; % ms to s

			trialsSoFar = 0;

			for analysisID = 1:length(analysis)
				a = analysis{analysisID}; % unpack
				for trialID = 1:a.trialCount
					for unitID = 1:unitCount
						msk = sp.trials==trialID+trialsSoFar & ...
							sp.assigns==unitNumbers(unitID);
						spikes2{analysisID} ...
							{trialID, unitCountAll + unitID} = ...
							double(sp.spiketimes(msk));
					end
				end
				trialsSoFar = trialsSoFar + a.trialCount;
			end
			
			unitNumbersAll = [unitNumbersAll unitNumbers'];
			unitCountAll = unitCountAll + unitCount;
			channel = analysis{1}.channels(channelID);
			unitChannels = [unitChannels repmat(channel, 1, unitCount)];
			unitTypes = [unitTypes labelCats(sp.labels(labelsMask,2))];
		end
		spikes = spikes2;
	else
		error('[spikesToUnits] invalid unit type');
	end
	
	
	for analysisID = 1:length(analysis)
		a = analysis{analysisID}; % unpack
		sp = spikes{analysisID};
		lfp = lfps{analysisID};
		
		if strcmpi(spikeConfig, 'unsorted')
			a.unitCount = length(a.channels);
		elseif any(strcmpi(spikeConfig, {'sorted', 'sortedjoint'}))
			a.unitCount = unitCountAll;
		end
		
		a.units = cell(1, a.unitCount);
		a.spikeConfig = spikeConfig;
		
		for unitID = 1:a.unitCount % choose unit number
			u                   = struct();    % unit struct
			u.animalName        = a.animalName;
			u.dataPath          = a.dataPath;
			u.dataFile          = a.dataFile;
			u.spikeConfig       = spikeConfig;
			% each unit also holds a copy of some analysis parameters
			u.fs                = a.fs;
			u.viewBounds        = a.viewBounds;
% 			u.trialCount        = a.trialCount;
			u.spikesBand        = a.spikesBand;
			u.lfpBands          = a.lfpBands;
			u.lfpBandNames      = a.lfpBandNames;
			u.lfpBandCount      = a.lfpBandCount;
			u.maskerFile        = a.maskerFile;
			u.maskerLevel       = a.maskerLevel;
			u.targetDuration    = a.targetDuration;
			u.targetFreqs       = a.targetFreqs;
			u.targetLevels      = a.targetLevels;
			u.condCount         = a.condCount;
% 			u.trialCountPerCond = a.trialCountPerCond;
			if strcmpi(spikeConfig, 'unsorted')
				u.type          = 'Channel';
				u.channel       = a.channels(unitID);
				u.number        = 0; % for sorted and sortedjoint only
				u.label         = sprintf('Ch %d', a.channels(unitID));
				u.spikeDuration = a.spikeDuration;
				u.spikeThresholdFactor    = a.spikeThresholdFactor;
				u.spikeThreshold          = a.spikeThreshold(unitID);
				u.artifactDuration        = a.artifactDuration;
				u.artifactThresholdFactor = a.artifactThresholdFactor;
				u.artifactThreshold       = a.artifactThreshold(unitID);
			elseif any(strcmpi(spikeConfig, {'sorted', 'sortedjoint'}))
				u.type          = unitTypeMap(unitTypes{unitID});
				u.number        = unitNumbersAll(unitID);
				if strcmpi(spikeConfig, 'sorted')
					u.channel   = unitChannels(unitID);
					u.label     = sprintf('#%d Ch %d %s', u.number, ...
						u.channel, u.type);
				else
					u.channel   = 0;
					u.label     = sprintf('#%d %s', u.number, u.type);
				end
				u.spikeDuration = spikeDuration;
			end

			% spike times per stimulus condition and score for each trial
			u.spikeTimes = cell(u.condCount, scoreCount);
			u.lfp = cell(u.lfpBandCount, u.condCount, scoreCount);

			for condID = 1:u.condCount
				for scoreID = 1:scoreCount
					u.spikeTimes{condID, scoreID} = {};
				end
			end

			% this iterates through all the cut sequences (trials)
			for trialID = 1:a.trialCount

				% find stimulus condition ID
				condID = getCondID(a.trialLog(trialID), a);

				% relative to tone onset
				trialSpikeTimes = sp{trialID, unitID} + u.viewBounds(1);
				
				u.spikeTimes{condID, 1}{end+1} = trialSpikeTimes;
				for bandID = 1:u.lfpBandCount
					u.lfp{bandID, condID, 1}{end+1} = ...
						lfp(trialID, unitID, bandID, :);
				end

				% look 'coding of scores' at the top
				score = a.trialLog(trialID).score;
				if any(strcmpi(score, {'HIT', 'CR'}))
					u.spikeTimes{condID, 2}{end+1} = trialSpikeTimes;
					for bandID = 1:u.lfpBandCount
						u.lfp{bandID, condID, 2}{end+1} = ...
							lfp(trialID, unitID, bandID, :);
					end
				end
				if any(strcmpi(score, {'MISS', 'FA'}))
					u.spikeTimes{condID, 3}{end+1} = trialSpikeTimes;
					for bandID = 1:u.lfpBandCount
						u.lfp{bandID, condID, 3}{end+1} = ...
							lfp(trialID, unitID, bandID, :);
					end
				end
				if any(strcmpi(score, {'HIT', 'FA'}))
					u.spikeTimes{condID, 4}{end+1} = trialSpikeTimes;
					for bandID = 1:u.lfpBandCount
						u.lfp{bandID, condID, 4}{end+1} = ...
							lfp(trialID, unitID, bandID, :);
					end
				end
				if any(strcmpi(score, {'MISS', 'CR'}))
					u.spikeTimes{condID, 5}{end+1} = trialSpikeTimes;
					for bandID = 1:u.lfpBandCount
						u.lfp{bandID, condID, 5}{end+1} = ...
							lfp(trialID, unitID, bandID, :);
					end
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
