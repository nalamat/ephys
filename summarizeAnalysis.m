function summarizeAnalysis(analysis, summaryFile, group)
	%% summarize active MMR vs. passive MMR (+ passive quiet)

	fprintf('Summarizing analysis\n');

	recordingModeLabels = {
		'Active MMR'
		'Passive MMR'
		'Passive Quiet'
		};
	modeCount = length(recordingModeLabels);

	% sessions and their analyses selected for summarizing
	sessions = {};

	% summary struct
	s = struct();
	s.type = 'summary';
	s.group = group;
	s.unitCount = modeCount;
	s.units = cell(s.unitCount, 1);
	s.targetFreqs = [];
	s.targetLevels = [];
% 	s.maskerLevel = 50;
	s.animalNames = {};
	s.targetResponseThresh = .3;
	s.targetResponseThreshCount = 2;
	s.phasicThresh = .001;
	s.phasicThreshCount = 1;
	s.categories = {'Tonic', 'Phasic', 'Reject'};
	s.subCategories = {'FR+ VS+', 'FR+ VS-', 'FR- VS+', 'FR- VS-', 'Tonic'};
% 	s.subCategories2 = {'Onset Offset', 'Onset', 'Offset', 'Sustained'};
% 	s.subCategories3 = {'Enh', 'Sup'};
	s.singleUnits = 0;
	s.multiUnits  = 0;
	s.allUnits    = 0;
	s.tonicUnits  = 0;
	s.phasicUnits = 0;
	s.rejectUnits = 0;


	%% select matching active and passive sessions from analysis
	for analysisID = 1:length(analysis)
		a = analysis{analysisID};

		if isfield(a, 'experimentStart')
			a.time = a.experimentStart; end
		if isfield(a, 'experimentStartStr')
			a.timeStr = a.experimentStartStr; end

		% only compatible with EARS
		if ~strcmpi(a.version, 'ears'); continue; end

		modeID = recordingMode(a);
		if modeID == 0; continue; end

		% find matching date
		id2 = 0;
		for sessionID = 1:length(sessions)
			for mode2 = 1:length(sessions{sessionID})
				a2 = sessions{sessionID}{mode2};
				if ~isempty(a2) && isSameDay(a.time, a2.time)
					id2 = sessionID;
					break;
				end
			end % mode2
			if id2 ~= 0; break; end
		end % analysisID2

		% if no matching date found, append
		if id2 == 0
			sessions{end+1} = cell(modeCount,1);
			id2 = length(sessions);
		end

		sessions{id2}{modeID} = a;
	end % analysisID


	%% drop cells that don't have both 'Active MMR' and 'Passive MMR'
	drop = [];
	for sessionID = 1:length(sessions)
		% don't drop if only missing passive quiet
		if length(sessions{sessionID}) < 2 %modeCount
			drop = [drop, sessionID];
			disp('Drop session: mode count');
			continue;
		end

		blank = false;
		% don't use passive quiet
		for modeID = 1:2 %modeCount
			if isempty(sessions{sessionID}{modeID})
				blank = true;
			elseif any(sessions{sessionID}{modeID}.trialCountPerCond<10)
				blank = true;
			end
		end
		if blank
			drop = [drop, sessionID];
			disp('Drop session: blank');
			continue;
		end

		% TODO: match target conditions
		a1 = sessions{sessionID}{1};
		a2 = sessions{sessionID}{2};
		if ~isequal(a1.targetLevels, a2.targetLevels)
			drop = [drop, sessionID];
			disp('Drop session: target levels');
			continue;
		end
	% 	c1 = setdiff(a1.targetLevels, a2.targetLevels);
	% 	c2 = setdiff(a2.targetLevels, a1.targetLevels);
	end
	drop = unique(drop);
	if drop
		fprintf('Dropping %d sessions\n', length(drop));
		sessions(drop) = [];
	end


	%% get all target stimulus conditions, and count all units
	for sessionID = 1:length(sessions)
		s.allUnits = s.allUnits + sessions{sessionID}{1}.unitCount;
		for modeID = 1:length(sessions{sessionID})
			a = sessions{sessionID}{modeID};
			if isempty(a); continue; end      % for missing passive quiet
			s.animalNames  = [s.animalNames a.animalName];
			s.targetFreqs  = [s.targetFreqs , a.targetFreqs ];
			s.targetLevels = [s.targetLevels, a.targetLevels];
		end
	end
	s.animalNames      = unique(s.animalNames);
	s.targetFreqs      = unique(s.targetFreqs);
	s.targetLevels     = unique(s.targetLevels);
% 	s.targetFreqs = [1];
% 	s.targetLevels = [40 50 60];
	% the `unique` function has a weird behavior that returns a 0x1 vectors
	% when acting on empty vectors, next 2 lines fix this
	if isempty(s.targetFreqs ); s.targetFreqs  = []; end
	if isempty(s.targetLevels); s.targetLevels = []; end
	s.condCount        = length(s.targetFreqs) ...
		* length(s.targetLevels) + 1;    % +1 for nogo
	s.targetDuration   = sessions{1}{1}.targetDuration;
	s.viewBounds       = sessions{1}{1}.viewBounds;
	s.lfpBands         = sessions{1}{1}.lfpBands;
	s.lfpBandNames     = sessions{1}{1}.lfpBandNames;
	s.lfpBandCount     = sessions{1}{1}.lfpBandCount;
	s.unitCountPerCond = num2cell(zeros(1,s.condCount));
	s.spikeConfig      = sessions{1}{1}.spikeConfig;


	%% setup summary units, each representing a specific recording mode
	for modeID = 1:s.unitCount
		u1 = sessions{1}{1}.units{1};

		u = struct();
		u.spikeConfig        = u1.spikeConfig;
		u.type               = 'Summary';
		u.group              = s.group;
		u.condCount          = s.condCount;
		u.targetFreqs        = s.targetFreqs;
		u.targetLevels       = s.targetLevels;
		if modeID == 3
			u.maskerLevel = 0;
		else
			u.maskerLevel = 50;
		end
		u.targetDuration     = s.targetDuration;
		u.viewBounds         = s.viewBounds;
		u.lfpBands           = s.lfpBands;
		u.lfpBandNames       = s.lfpBandNames;
		u.lfpBandCount       = s.lfpBandCount;
		u.targetResponseThresh = s.targetResponseThresh;
		u.targetResponseThreshCount = s.targetResponseThreshCount;
		u.phasicThresh       = s.phasicThresh;
		u.phasicThreshCount  = s.phasicThreshCount;

		u.psthBin            = u1.psthBin;
		u.psthWin            = u1.psthWin;
		u.psthEdges          = u1.psthEdges;
		u.psthCenters        = u1.psthCenters;
		u.dPrimeTimes        = u1.dPrimeTimes;
		u.corrWindow         = u1.corrWindow;
		u.corrTimes          = u1.corrTimes;
		u.i                  = u1.i;
		u.vsFreqs            = u1.vsFreqs;
		u.vs10Window         = u1.vs10Window;
		u.vs10Times          = u1.vs10Times;
		u.mtsFreqs           = u1.mtsFreqs;
		u.mtsFreqs10         = u1.mtsFreqs10;
		u.label              = recordingModeLabels{modeID};

		c    = cell(u.condCount, 5); % {conds x scores}
		init = @(sz)cellfun(@(c){nan(sz)}, c);
		ct   = init([s.allUnits, length(u.psthCenters)]);
		cdp  = init([s.allUnits, length(u.dPrimeTimes)]);
		cc   = init([s.allUnits, length(u.corrTimes)]);
		ci   = init([s.allUnits, u.i.count]);
		cii  = init([s.allUnits, u.i.count, u.i.count]);
		cv   = init([s.allUnits, length(u.vsFreqs), u.i.count]);
		cv2  = init([s.allUnits, length(u.vs10Times)]);
		cm   = init([s.allUnits, length(u.mtsFreqs), u.i.count]);
		cl   = init([s.allUnits, u.lfpBandCount, 3]);

		u.animalNames     = c;
		u.sessionIDs      = c;
		u.unitIDs         = c;
		u.unitTypes       = c;   % single/multi
		u.phasic          = c;
		u.tonic           = c;
		u.category        = c;   % phasic/tonic
		u.subCategory     = c;   % suppressing/enhancing
		u.subCategory2    = c;   % onset/offset/sustained
		u.subCategory3    = c;   % onset/offset/sustained
		u.psth            = ct;  % function of time
		u.corrR           = cc;  % running correlation, function of time
		u.corrP           = cc;  % p-value of correlation, function of time
		u.autocorrR       = cc;  % running auto-correlation, function of time
		u.autocorrP       = cc;  % p-value of correlation, function of time
		u.i.corrR         = ci;  % per interval
		u.i.corrP         = ci;  % per interval
		u.i.autocorrR     = cii; % interval x interval
		u.i.autocorrP     = cii; % interval x interval
		u.i.ter           = ci;  % per interval
		u.i.tep           = ci;  % per interval
		u.dPrime          = cdp; % rate d' as function of time
		u.i.dPrime        = ci;  % rate d' for each interval
		u.dPrimeBehavior  = cell(s.condCount,1);
		u.i.frMax         = ci;  % per interval
		u.i.frMean        = ci;  % per interval
		u.i.mutualInfo    = ci;  % per interval
		u.mfsl            = c;
		u.mfslPhase       = c;
		u.i.vs            = cv;  % vector strength: frequency x interval
		u.i.vsPhase       = cv;  % frequency x interval
		u.i.vsPVal        = cv;  % frequency x interval
		u.i.vs10          = ci;  % vs @ 10Hz per interval, same as above
		u.i.vs10Phase     = ci;  % per interval
		u.i.vs10PVal      = ci;  % per interval
		u.vs10            = cv2; % running vs @ 10Hz, as a function of time
		u.vs10Phase       = cv2; % as a function of time
		u.vs10PVal        = cv2; % as a function of time
		u.i.mts           = cm;  % mt spectrum: frequency x interval
		u.i.mts10         = ci;  % mt spectrum @ 10hz per interval
		u.lfp             = cl;

		s.units{modeID} = u;
	end % modeID


	%% gather unit activation metrics
	sUnitID = 0;
	
	for sessionID = 1:length(sessions)
		for unitID = 1:sessions{sessionID}{1}.unitCount
			%% check if unit responds to target and determine its category
			sUnitID = sUnitID + 1;
			% is it phasic or tonic?
% 			targetResponse = 0;
			phasic = 0;
			% don't use passive quiet for categorizing units for now
			% only use active mmr and passive mmr
			for modeID = 1:2 %length(sessions{sessionID})
				a = sessions{sessionID}{modeID};
	% 			if isempty(a); continue; end
				u = a.units{unitID};
% 				for uCondID = 2:u.condCount
% 					sCondID = mapCondID(uCondID, u, s);
% 					if sCondID==0; continue; end % for omitted conditions
% 
% 					for intervalID = u.i.id.during  % onset/peri/offset
% 						if abs(u.i.dPrime{uCondID,1}(intervalID)) > ...
% 								s.targetResponseThresh
% 							targetResponse = targetResponse+1;
% 						end
% 					end
% 				end

				vsFreq = u.vsFreqs==10;
				for uCondID = 1:u.condCount
					sCondID = mapCondID(uCondID, u, s);
					if sCondID==0; continue; end % for omitted conditions

					for intervalID = u.i.id.all   % per/peri/post
						vs = u.i.vs{uCondID,1}(vsFreq,intervalID);
						p = u.i.vsPVal{uCondID,1}(vsFreq,intervalID);
						if isnan(vs)
							fprintf(['NAN: cond %d, interval %d, ' ...
								'channel %d, %s\n'], uCondID, intervalID, ...
								u.channel, u.dataFile);
						end
						if p < s.phasicThresh
							phasic = phasic+1;
						end
					end
				end
			end

			% does unit respond to target?
% 			if targetResponse < s.targetResponseThreshCount
% 				s.rejectUnits = s.rejectUnits + 1;
% 				continue
% 			end

			if isfield(sessions{sessionID}{1}, 'spikeConfig') && ...
					strcmpi(sessions{sessionID}{1}.spikeConfig, 'sorted')
				unitType = sessions{sessionID}{1}.units{unitID}.type;
				if strcmpi(unitType, 'single')
					s.singleUnits = s.singleUnits + 1;
				elseif strcmpi(unitType, 'multi')
					s.multiUnits = s.multiUnits + 1;
				end
			else
				s.multiUnits = s.multiUnits + 1;
			end

			% for backwards compatibility
			sorted = isfield(sessions{sessionID}{1}, 'spikeConfig') && ...
				any(strcmpi(sessions{sessionID}{1}.spikeConfig, ...
				{'sorted', 'sortedjoint'})) || ...
				isfield(sessions{sessionID}{1}.units{1},'spikeConfig')&&...
				any(strcmpi(sessions{sessionID}{1}.units{1}.spikeConfig,...
				{'sorted', 'sortedjoint'})) || ...
				strcmpi(sessions{sessionID}{1}.units{unitID}.type, ...
				'single');

			% does unit respond to masker?
			phasic = phasic >= s.phasicThreshCount;
% 			if targetResponse < s.targetResponseThreshCount
% 				s.rejectUnits = s.rejectUnits + 1;
% 				category = 'Reject';
% 			else
			if phasic
				s.phasicUnits = s.phasicUnits + 1;
				category = 'Phasic';
			else
				s.tonicUnits = s.tonicUnits + 1;
				category = 'Tonic';
			end

			%% determine unit sub-category
			% is it suppressing or enhancing firing rate and vector strength?
			% compare average of pre for all conditions
			% versus peri at +10 dB SNR in active mode
			if phasic
				u = sessions{sessionID}{1}.units{unitID};
				
				% categorize based on change in firing rate
				fr = squeeze(cat(3, u.i.frMean{:,1})); % interval x snr
				frPreMean = mean(fr(u.i.id.pre, :));
				frPeri10dB = fr(u.i.id.peri, end);
				frChange = (frPeri10dB - frPreMean) / frPreMean;

				% categorize based on change in vector strength @ 10hz
				vsFreq = u.vsFreqs==10;
				vs = cat(3, u.i.vs{:,1}); % freq x interval x snr
				vs = squeeze(vs(vsFreq, :, :)); % interval x snr
				vsPreMean = mean(vs(u.i.id.pre, :));
				vsPeri10dB = vs(u.i.id.peri, end);
				vsChange = (vsPeri10dB - vsPreMean) / vsPreMean;

				if frChange > 0 && vsChange > 0
					subCategory = 'FR+ VS+';
				elseif frChange < 0 && vsChange > 0
					subCategory = 'FR- VS+';
				elseif frChange > 0 && vsChange < 0
					subCategory = 'FR+ VS-';
				elseif frChange < 0 && vsChange < 0
					subCategory = 'FR- VS-';
				end
			
			else
					subCategory = 'Tonic';
			end
			
			% alternate sub-category based on quiet response
% 			u = sessions{sessionID}{3}.units{unitID};
% 			dp = vertcat(u.i.dPrime{2:end,1});
% 			fr = vertcat(u.i.frMean{:,1});
% 			fr = fr(:,u.i.id.peri);
% 			onset  = dp(:,u.i.id.onset) > .3;
% 			offset = dp(:,u.i.id.offset) > .3;
% 			
% 			if onset(end) && offset(end)
% 				subCategory2 = 'Onset Offset';
% 			elseif onset(end)
% 				subCategory2 = 'Onset';
% 			elseif offset(end)
% 				subCategory2 = 'Offset';
% 			else
% 				subCategory2 = 'Sustained';
% 			end
% 			
% 			if fr(end) > fr(1)
% 				subCategory3 = 'Enh';
% 			else
% 				subCategory3 = 'Sup';
% 			end

			if sorted
				fprintf('Selecting unit %d.%d from %s on %s as %s / %s\n', ...
					sessions{sessionID}{1}.units{unitID}.channel, ...
					sessions{sessionID}{1}.units{unitID}.number, ...
					sessions{sessionID}{1}.animalName, ...
					sessions{sessionID}{1}.timeStr, category, subCategory);
			else
				fprintf('Selecting channel %d from %s on %s as %s / %s\n', ...
					sessions{sessionID}{1}.channels(unitID), ...
					sessions{sessionID}{1}.animalName, ...
					sessions{sessionID}{1}.timeStr, category, subCategory);
			end

			%% map unit analysis to summary
			for modeID = 1:length(sessions{sessionID})
				a = sessions{sessionID}{modeID};
				if isempty(a); continue; end    % for missing passive quiet
				a = calculatePerformance(a);
				u = a.units{unitID};            % unpack original analysis unit
				su = s.units{modeID};           % unpack summary unit
				for uCondID = 1:u.condCount
					% map condition ID from unit to summary
					sCondID = mapCondID(uCondID, u, s);

					% skip if a particular condition is not included in the
					% summary analysis
					if sCondID==0; continue; end

					for scoreID = 1:5
						% keep a list of summarized animal names & unit IDs
						% (different unit numbering scheme)
						su.animalNames{sCondID,scoreID}{sUnitID} = a.animalName;
						su.sessionIDs{sCondID,scoreID}(sUnitID) = sessionID;
						su.unitIDs{sCondID,scoreID}(sUnitID) = sUnitID;
						su.unitTypes{sCondID,scoreID}{sUnitID} = u.type;

						% does unit respond to masker?
						su.tonic{sCondID,scoreID}(sUnitID) = ~phasic;
						su.phasic{sCondID,scoreID}(sUnitID) = phasic;
						su.category{sCondID,scoreID}{sUnitID} = category;
						su.subCategory{sCondID,scoreID}{sUnitID} = subCategory;
% 						su.subCategory2{sCondID,scoreID}{sUnitID} = subCategory2;
% 						su.subCategory3{sCondID,scoreID}{sUnitID} = subCategory3;

						% psth
						su.psth{sCondID,scoreID}(sUnitID,:) = ...
							u.psthMean{uCondID,scoreID};

						% running correlation, function of time
						su.corrR{sCondID,scoreID}(sUnitID,:) = ...
							u.corrR{uCondID,scoreID};
						su.corrP{sCondID,scoreID}(sUnitID,:) = ...
							u.corrP{uCondID,scoreID};
						su.autocorrR{sCondID,scoreID}(sUnitID,:) = ...
							u.autocorrR{uCondID,scoreID};
						su.autocorrP{sCondID,scoreID}(sUnitID,:) = ...
							u.corrP{uCondID,scoreID};
						
						% correlation per interval
						su.i.corrR{sCondID,scoreID}(sUnitID,:) = ...
							u.i.corrR{uCondID,scoreID};
						su.i.corrP{sCondID,scoreID}(sUnitID,:) = ...
							u.i.corrP{uCondID,scoreID};
						su.i.autocorrR{sCondID,scoreID}(sUnitID,:,:) = ...
							u.i.autocorrR{uCondID,scoreID};
						su.i.autocorrP{sCondID,scoreID}(sUnitID,:,:) = ...
							u.i.autocorrP{uCondID,scoreID};

						% calculate target-evoked response and
						% peak activation relative to nogo
						if uCondID == 1 && scoreID == 1
							ter = zeros(1, u.i.count);
							tep = zeros(1, u.i.count);
						else
							ter = nan(1, u.i.count);
							tep = nan(1, u.i.count);
							for intervalID = 1:u.i.count
								mask = u.i.masks{intervalID};
								nogo = u.psthMean{1,1}(mask);
								go = u.psthMean{uCondID,scoreID}(mask);
% 								ter(intervalID) = trapz(u.psthCenters(mask), go-nogo);
% 								ter(intervalID) = ter(intervalID) / mean(nogo); % normalize
								ter(intervalID) = mean(go-nogo) / mean(nogo);
								tep(intervalID) = (max(go) - max(nogo)) / max(nogo);
							end
						end
						ter(isinf(ter)) = nan;
						tep(isinf(tep)) = nan;
						su.i.ter{sCondID,scoreID}(sUnitID,:) = ter;
						su.i.tep{sCondID,scoreID}(sUnitID,:) = tep;

						% neurometric rate d' as a function of time
						su.dPrime{sCondID,scoreID}(sUnitID,:) = ...
							u.dPrime{uCondID,scoreID};

						% neurometric rate d' for intervals
						su.i.dPrime{sCondID,scoreID}(sUnitID,:) = ...
							u.i.dPrime{uCondID,scoreID};

						% mean and max firing rate
						su.i.frMean{sCondID,scoreID}(sUnitID,:) = ...
							u.i.frMean{uCondID,scoreID};
						su.i.frMax{sCondID,scoreID}(sUnitID,:) = ...
							u.i.frMax{uCondID,scoreID};

						% mutual information
						su.i.mutualInfo{sCondID,scoreID}(sUnitID,:) = ...
							u.i.mutualInfo{uCondID,scoreID};

						% vector strength: base frequency x interval
						su.i.vs{sCondID,scoreID}(sUnitID,:,:) = ...
							u.i.vs{uCondID,scoreID};
						su.i.vsPhase{sCondID,scoreID}(sUnitID,:,:) = ...
							u.i.vsPhase{uCondID,scoreID};
						su.i.vsPVal{sCondID,scoreID}(sUnitID,:,:) = ...
							u.i.vsPVal{uCondID,scoreID};
						
						% vs @ 10hz per interval (same as above)
						su.i.vs10{sCondID,scoreID}(sUnitID,:) = ...
							u.i.vs10{uCondID,scoreID};
						su.i.vs10Phase{sCondID,scoreID}(sUnitID,:) = ...
							u.i.vs10Phase{uCondID,scoreID};
						su.i.vs10PVal{sCondID,scoreID}(sUnitID,:) = ...
							u.i.vs10PVal{uCondID,scoreID};

						% running vs @ 10hz as a function of time
						su.vs10{sCondID,scoreID}(sUnitID,:) = ...
							u.vs10{uCondID,scoreID};
						su.vs10Phase{sCondID,scoreID}(sUnitID,:) = ...
							u.vs10Phase{uCondID,scoreID};
						su.vs10PVal{sCondID,scoreID}(sUnitID,:) = ...
							u.vs10PVal{uCondID,scoreID};

						% multi-taper spectrum peri-stimulus per interval
						su.i.mts{sCondID,scoreID}(sUnitID,:,:) = ...
							u.i.mts{uCondID,scoreID};
						su.i.mts10{sCondID,scoreID}(sUnitID,:) = ...
							u.i.mts10{uCondID,scoreID};

						% mfsl (minimum first spike latency)
						su.mfsl{sCondID,scoreID}(sUnitID,:) = ...
							u.mfsl{uCondID,scoreID};
						su.mfslPhase{sCondID,scoreID}(sUnitID,:) = ...
							u.mfslPhase{uCondID,scoreID};

						% local field potential
						if isfield(u, 'lfp')
							su.lfp{sCondID,scoreID}(sUnitID,:,:) = ...
								u.lfpMean{uCondID,scoreID};
						else
							su.lfp{sCondID,scoreID}(sUnitID,:,:) = nan;
						end
					end

					if any(isnan(u.psthMean{uCondID,1})); continue; end

					if modeID==1
						s.unitCountPerCond{sCondID} = s.unitCountPerCond{sCondID} + 1;
					end

					su.dPrimeBehavior{sCondID}(sUnitID,:) = ...
						a.dPrimeBehavior{uCondID};
				end

				s.units{modeID} = su;    % repack summary unit
			end % modeID

		end % unitID

	end % sessionID

	fprintf(['Selected %d target responding, %d tonic, %d phasic\n'], ...
		s.allUnits, s.tonicUnits, s.phasicUnits);

	% display counts for single/multi-units separately
	if sorted
% 		fprintf('\n');
		fprintf('All:    %3d  \n', s.allUnits);
		fprintf('Phasic: %3d  \n', s.phasicUnits);
		fprintf('Tonic:  %3d  \n', s.tonicUnits);
		fprintf('Reject: %3d  \n', s.rejectUnits);
	end


	%% save merged analysis in a .mat file
	analysis = {s};
	fprintf('Saving summary to %s\n', summaryFile);
	save(summaryFile, 'analysis', '-v7.3');
end


%% helper functions
function res = recordingMode(a)
	res = 0;
	% poke training is for the naive gerbils (only go)
	if any(strcmpi(a.experimentMode, {'go nogo', 'poke training'})) && ...
			strcmpi(a.maskerFile, 'supermasker.wav') && ...
			a.maskerLevel == 50 && ...
			isequal(a.targetFreqs, 1)
		res = 1;
	elseif strcmpi(a.experimentMode, 'passive') && ...
			strcmpi(a.maskerFile, 'supermasker.wav') && ...
			a.maskerLevel == 50 && ...
			isequal(a.targetFreqs, 1)
		res = 2;
	elseif strcmpi(a.experimentMode, 'passive') && ...
			(strcmpi(a.maskerFile, '') || a.maskerLevel == 0) && ...
			isequal(a.targetFreqs, 1)
		res = 3;
	end
end
