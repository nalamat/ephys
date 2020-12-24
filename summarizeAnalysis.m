function summarizeAnalysis(analysis, summaryFile, effort)
	%% summarize active MMR vs. passive MMR (+ passive quiet)

	fprintf('Summarizing analysis\n');

	recordingModeLabels = {
		['Active MMR ' effort]
		'Passive MMR'
		'Passive Quiet'
		};
	modeCount = length(recordingModeLabels);

	% sessions and their analyses selected for summarizing
	sessions = {};

	% summary struct
	s = struct();
	s.type = 'summary';
	s.effort = effort;
	s.unitCount = modeCount;
	s.units = cell(s.unitCount, 1);
	s.targetFreqs = [];
	s.targetLevels = [];
% 	s.maskerLevel = 50;
	s.animalNames = {};
	s.targetResponseThresh = .3;
	s.targetResponseThreshCount = 2;
	s.phasicThresh = .001;
	s.phasicThreshCount = 2;


	%% select matching active and passive sessions from analysis
	for analysisID = 1:length(analysis)
		a = analysis{analysisID};

		if isfield(a, 'experimentStart')
			a.time = a.experimentStart; end
		if isfield(a, 'experimentStartStr')
			a.timeStr = a.experimentStartStr; end

		% only compatible with EARS
		if ~strcmpi(a.version, 'ears'); continue; end

		mode = recordingMode(a);
		if mode == 0; continue; end

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
			sessions{end+1} = cell(2,1);
			id2 = length(sessions);
		end

		sessions{id2}{mode} = a;
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
		for mode = 1:2 %modeCount
			if isempty(sessions{sessionID}{mode})
				blank = true;
			elseif any(sessions{sessionID}{mode}.trialCountPerCond<10)
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


	%% get all target stimulus conditions
	for sessionID = 1:length(sessions)
		for mode = 1:length(sessions{sessionID})
			a = sessions{sessionID}{mode};
	% 		if isempty(a); continue; end
			s.animalNames = [s.animalNames a.animalName];
			s.targetFreqs  = [s.targetFreqs , a.targetFreqs ];
			s.targetLevels = [s.targetLevels, a.targetLevels];
		end
	end
	s.animalNames = unique(s.animalNames);
	s.targetFreqs  = unique(s.targetFreqs);
	s.targetLevels = unique(s.targetLevels);
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
		u.spikeConfig = u1.spikeConfig;
		u.type = 'Summary';
		u.effort = s.effort;
		u.condCount = s.condCount;
		u.targetFreqs = s.targetFreqs;
		u.targetLevels = s.targetLevels;
		if modeID == 3
			u.maskerLevel = 0;
		else
			u.maskerLevel = 50;
		end
		u.targetDuration = s.targetDuration;
		u.viewBounds = s.viewBounds;
		u.lfpBands          = s.lfpBands;
		u.lfpBandNames      = s.lfpBandNames;
		u.lfpBandCount      = s.lfpBandCount;
		u.targetResponseThresh = s.targetResponseThresh;
		u.targetResponseThreshCount = s.targetResponseThreshCount;
		u.phasicThresh = s.phasicThresh;
		u.phasicThreshCount = s.phasicThreshCount;

		u.psthBin = u1.psthBin;
		u.psthWin = u1.psthWin;
		u.psthEdges = u1.psthEdges;
		u.psthCenters = u1.psthCenters;
		u.gap = u1.gap;
		u.onset = u1.onset;
		u.peri = u1.peri;
		u.offset = u1.offset;
		u.periFull = u1.periFull;
		u.intervalNames = u1.intervalNames;
		u.intervals = u1.intervals;
		u.vsFreqs = u1.vsFreqs;
		u.vsBins = u1.vsBins;
		u.vsBinNames = u1.vsBinNames;
		u.vs10Centers = u1.vs10Centers;
		u.mtsFreqs = u1.mtsFreqs;
		u.label = recordingModeLabels{modeID};

		c    = cell(u.condCount, 5); % {conds x scores}
		init = @(sz)cellfun(@(c){nan(sz)}, c);
		ct   = init([0, length(u.psthCenters)]);
		ci   = init([0, length(u.intervals)]);
		cv   = init([0, length(u.vsBins), length(u.vsFreqs)]);
		cv2  = init([0, length(u.vs10Centers)]);
		cm   = init([0, length(u.mtsFreqs)]);
		cl   = init([0, u.lfpBandCount, 3]);

		u.animalNames = c;
		u.sessionIDs = c;
		u.unitIDs = c;
		u.unitTypes = c; % single/multi
		u.phasic = c;
		u.tonic = c;
		u.category = c; % phasic/tonic
		u.phasicSuppressing = c;
		u.phasicEnhancing = c;
		u.phasicNoChange = c;
		u.subCategory = c; % suppressing/enhancing/no-change
		u.psth = ct;
% 		u.psthMean = cc;
% 		u.psthSEM = cc;
		u.ter = ci;
		u.tep = ci;
		u.dPrimeCQMean = ct;
% 		u.dPrimeCQMeanMean = cc;
% 		u.dPrimeCQMeanSEM = cc;
		u.dPrimeCQSum = ct;
		u.dPrimeIntervals = ci;
		u.dPrimeBehavior = cell(s.condCount,1);
		u.mfsl = c;
% 		u.mfslMean = cc;
% 		u.mfslSEM = cc;
		u.mfslPhase = c;
% 		u.mfslPhaseMean = cc;
% 		u.mfslPhaseSEM = cc;
		u.firingMax = c;
% 		u.firingMaxMean = cc;
% 		u.firingMaxSEM = cc;
		u.firingMean = c;
% 		u.firingMeanMean = cc;
% 		u.firingMeanSEM = cc;
		u.vs = cv;
		u.vsPhase = cv;
% 		u.vsMean = c;
% 		u.vsSEM = c;
		u.vs10 = cv2;
		u.vs10Phase = cv2;
% 		u.vs10Mean = c;
% 		u.vs10SEM = c;
		u.mts = cm;
% 		u.mtsMean = c;
% 		u.mtsSEM = c;

		s.units{modeID} = u;
	end


	%% select target responding units and gather their activation metrics
	s.singleUnits = 0;
	s.multiUnits = 0;
	s.targetRespondingUnits = 0;
	s.targetRespondingUnits2 = [0 0]; % count single/multi-units separately
	s.tonicUnits = 0;
	s.tonicUnits2 = [0 0];            % count single/multi-units separately
	s.phasicUnits = 0;
	s.phasicUnits2 = [0 0];           % count single/multi-units separately
	s.phasicSuppressingUnits = 0;
	s.phasicEnhancingUnits = 0;
	s.phasicNoChangeUnits = 0;

	for sessionID = 1:length(sessions)
		for unitID = 1:sessions{sessionID}{1}.unitCount
			%% check if unit responds to target and determine its category
			% is it phasic or tonic?
			targetResponse = 0;
			phasic = 0;
			% don't use passive quiet for categorizing units for now
			% only use active mmr and passive mmr
			for mode = 1:2 %length(sessions{sessionID})
				a = sessions{sessionID}{mode};
	% 			if isempty(a); continue; end
				u = a.units{unitID};
				for uCondID = 2:u.condCount
					sCondID = mapCondID(uCondID, u, s);
					if sCondID==0; continue; end % for omitted conditions

					for intervalID = 1:length(u.intervals)-1
						if u.dPrimeIntervals{uCondID,1}(intervalID) > ...
								s.targetResponseThresh
							targetResponse = targetResponse+1;
						end
					end
				end

				vsFreq = u.vsFreqs==10;
				for uCondID = 1:u.condCount
					sCondID = mapCondID(uCondID, u, s);
					if sCondID==0; continue; end % for omitted conditions

					for binID = 1:size(u.vsBins,1)
						vs = u.vs{uCondID,1}(binID,vsFreq);
						p = u.vsPVal{uCondID,1}(binID,vsFreq);
						if isnan(vs)
							fprintf(['NAN: cond %d, bin %d, ' ...
								'channel %d, %s\n'], uCondID, binID, ...
								a.channels(unitID), u.dataFile);
						end
						if p < s.phasicThresh
							phasic = phasic+1;
						end
					end
				end
			end

			% does unit respond to target?
			if targetResponse < s.targetResponseThreshCount; continue; end

			if isfield(sessions{sessionID}{1}, 'spikeConfig') && ...
					strcmpi(sessions{sessionID}{1}.spikeConfig, 'sorted')
				unitType = sessions{sessionID}{1}.units{unitID}.type;
				if strcmpi(unitType, 'single')
					unitType2 = 1;
					s.singleUnits = s.singleUnits + 1;
				elseif strcmpi(unitType, 'multi')
					unitType2 = 2;
					s.multiUnits = s.multiUnits + 1;
				end
			else
				disp('Unsorted units');
				unitType2 = 2;
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

			s.targetRespondingUnits = s.targetRespondingUnits + 1;
			s.targetRespondingUnits2(unitType2) = ...
				s.targetRespondingUnits2(unitType2) + 1;

			% does unit respond to masker?
			phasic = phasic >= s.phasicThreshCount;
			if phasic
				s.phasicUnits = s.phasicUnits + 1;
				s.phasicUnits2(unitType2) = s.phasicUnits2(unitType2) + 1;
				category = 'Phasic';
			else
				s.tonicUnits = s.tonicUnits + 1;
				s.tonicUnits2(unitType2) = s.tonicUnits2(unitType2) + 1;
				category = 'Tonic';
			end

			%% determine unit sub-category
			% is it phasic suppressing, enhancing, or no-change?
			phasicSuppressing = false;
			phasicEnhancing = false;
			phasicNoChange = false;

			% compare vector strength between passive and active
% 			if phasic
% 				u1 = sessions{sessionID}{1}.units{unitID};
% 				u2 = sessions{sessionID}{2}.units{unitID};
% 				vsFreq = u.vsFreqs==10;
%
% 				for binID = 1:size(u.vsBins,1)
% 					vs1 = cellfun(@(c)c{binID,vsFreq}, ...
% 						u1.vs(:,1));
% 					vs2 = cellfun(@(c)c{binID,vsFreq}, ...
% 						u2.vs(:,1));
% 					if ttest(vs1, vs2)
% 						if mean(vs1) < mean(vs2)
% 							phasicSuppressing = true;
% 						else
% 							phasicEnhancing = true;
% 						end
% 					end
% 				end
% 				phasicNoChange = ~phasicSuppressing && ~phasicEnhancing;
% 			end

			% compare VS of pre and peri in active at +10 dB SNR
			if phasic
				u = sessions{sessionID}{1}.units{unitID};
				vsFreq = u.vsFreqs==10;
				change = (u.vs{end,1}(2,vsFreq) - u.vs{end,1}(1,vsFreq)) ...
						/ u.vs{end,1}(1,vsFreq);

				if  change < -.2
					phasicSuppressing = true;
				elseif change > .2
					phasicEnhancing = true;
				else
					phasicNoChange = true;
				end
			end

			if phasicSuppressing
				s.phasicSuppressingUnits = s.phasicSuppressingUnits + 1;
				subCategory = 'Phasic Suppressing';
			elseif phasicEnhancing
				s.phasicEnhancingUnits = s.phasicEnhancingUnits + 1;
				subCategory = 'Phasic Enhancing';
			elseif phasicNoChange
				s.phasicNoChangeUnits = s.phasicNoChangeUnits + 1;
				subCategory = 'Phasic No Change';
			else
				subCategory = 'None'; % for tonics
			end

			if sorted
				fprintf('Selecting unit %d.%d from %s on %s as %s\n', ...
					sessions{sessionID}{1}.units{unitID}.channel, ...
					sessions{sessionID}{1}.units{unitID}.number, ...
					sessions{sessionID}{1}.animalName, ...
					sessions{sessionID}{1}.timeStr, category);
			else
				fprintf('Selecting channel %d from %s on %s as %s\n', ...
					sessions{sessionID}{1}.channels(unitID), ...
					sessions{sessionID}{1}.animalName, ...
					sessions{sessionID}{1}.timeStr, category);
			end
			
			%% map unit analysis to summary
			for mode = 1:length(sessions{sessionID})
				a = sessions{sessionID}{mode};
				a = calculatePerformance(a);
	% 			if isempty(a); continue; end
				u = a.units{unitID};     % unpack original analysis unit
				su = s.units{mode};      % unpack summary unit
				for uCondID = 1:u.condCount
					% map condition ID from unit to summary
					sCondID = mapCondID(uCondID, u, s);

					% skip if a particular condition is not included in the
					% summary analysis
					if sCondID==0;
						continue;
					end

					for scoreID = 1:5
						% keep a list of summarized animal names & unit IDs
						% (different unit numbering scheme)
						su.animalNames{sCondID,scoreID}{end+1} = a.animalName;
						su.sessionIDs{sCondID,scoreID}(end+1) = sessionID;
						su.unitIDs{sCondID,scoreID}(end+1) = s.targetRespondingUnits;
						su.unitTypes{sCondID,scoreID}{end+1} = u.type;

						% does unit respond to masker?
						su.tonic{sCondID,scoreID}(end+1) = ~phasic;
						su.phasic{sCondID,scoreID}(end+1) = phasic;
						su.category{sCondID,scoreID}{end+1} = category;
						su.phasicSuppressing{sCondID,scoreID}(end+1) = ...
							phasicSuppressing;
						su.phasicEnhancing{sCondID,scoreID}(end+1) = phasicEnhancing;
						su.phasicNoChange{sCondID,scoreID}(end+1) = phasicNoChange;
						su.subCategory{sCondID,scoreID}{end+1} = subCategory;

						% psth
						psth = u.psthMean{uCondID,scoreID};
						su.psth{sCondID,scoreID}(end+1,:) = psth;

						% target-evoked response and peak activation relative to nogo
						if uCondID ~= 1
							ter = nan(size(u.intervals));
							tep = nan(size(u.intervals));
							for intervalID = 1:length(u.intervals)
								interval = u.intervals{intervalID};
								nogo = u.psthMean{1,1}(interval);
								go = u.psthMean{uCondID,scoreID}(interval);
% 								ter(intervalID) = trapz(u.psthCenters(interval), go-nogo);
% 								ter(intervalID) = ter(intervalID) / mean(nogo); % normalize
								ter(intervalID) = mean(go-nogo) / mean(nogo);
								tep(intervalID) = (max(go) - max(nogo)) / max(nogo);
							end
							ter(isinf(ter)) = nan;
							tep(isinf(tep)) = nan;
							su.ter{sCondID,scoreID}(end+1,:) = ter;
							su.tep{sCondID,scoreID}(end+1,:) = tep;
						end

						% d'
						dPrime = u.dPrimeCQMean{uCondID,scoreID};
						su.dPrimeCQMean{sCondID,scoreID}(end+1,:) = dPrime;

						dPrime = u.dPrimeCQSum{uCondID,scoreID};
						% reference dPrime to tone onset
						pre = find(u.psthCenters < 0);
						dPrime = dPrime - dPrime(pre(end));
						su.dPrimeCQSum{sCondID,scoreID}(end+1,:) = dPrime;

						% quadratic mean d' for intervals: onset/peri/offset...
						dPrime = u.dPrimeIntervals{uCondID,scoreID};
						su.dPrimeIntervals{sCondID,scoreID}(end+1,:) = dPrime;

						% vector strength
						vs = u.vs{uCondID,scoreID};
						su.vs{sCondID,scoreID}(end+1, :, :) = vs;

						% running vs at 10 Hz
						vs = u.vs10{uCondID,scoreID};
						phase = u.vs10Phase{uCondID,scoreID};
						su.vs10{sCondID,scoreID}(end+1,:) = vs;
						su.vs10Phase{sCondID,scoreID}(end+1,:) = phase;

						% multi-taper spectrum peri-stimulus
						mts = u.mts{uCondID,scoreID};
						su.mts{sCondID,scoreID}(end+1,:) = mts;

						% mfsl (minimum first spike latency)
						mfsl = u.mfsl{uCondID,scoreID};
						su.mfsl{sCondID,scoreID}(end+1,:) = mfsl;

						% mfsl phase
						phase = u.mfslPhase{uCondID,scoreID};
						su.mfslPhase{sCondID,scoreID}(end+1,:) = phase;

						% max firing rate
						firingMax = u.firingMax{uCondID,scoreID};
						su.firingMax{sCondID,scoreID}(end+1,:) = firingMax;

						% max firing rate
						firingMean = u.firingMean{uCondID,scoreID};
						su.firingMean{sCondID,scoreID}(end+1,:) = firingMean;
					end

					if any(isnan(u.psthMean{uCondID,1})); continue; end

					if mode==1
						s.unitCountPerCond{sCondID} = s.unitCountPerCond{sCondID} + 1;
					end

					su.dPrimeBehavior{sCondID}(end+1) = a.dPrimeBehavior{uCondID};
				end
				
				s.units{mode} = su;    % repack summary unit
			end
		end
	end

	fprintf(['Selected %d target responding, %d tonic, %d phasic, ' ...
		'%d phasic suppressing, %d phasic enhancing & ' ...
		'%d phasic no-change units\n'], ...
		s.targetRespondingUnits, s.tonicUnits, s.phasicUnits, ...
		s.phasicSuppressingUnits, s.phasicEnhancingUnits, ...
		s.phasicNoChangeUnits);

	% display counts for single/multi-units separately
	if sorted
		fprintf('       Single  Multi\n');
		fprintf('Total:  %3d    %3d  \n', s.targetRespondingUnits2);
		fprintf('Phasic: %3d    %3d  \n', s.phasicUnits2);
		fprintf('Tonic:  %3d    %3d  \n', s.tonicUnits2);
	end


	%% calculate mean and sem of psth, d', etc
% 	for modeID = 1:s.unitCount
% 		for condID = 1:s.condCount
% 			for scoreID = 1:5
% 				% unpack
% 				u = s.units{modeID};
% 
% 				% psth
% 				psth = u.psth{condID,scoreID};
% 				u.psthMean{condID,scoreID} = nanmean(psth);
% 				u.psthSEM{condID,scoreID} = nansem(psth);
% 
% 				% cumulative quadratic mean of d'
% 				dPrime = u.dPrimeCQMean{condID,scoreID};
% 				u.dPrimeCQMeanMean{condID,scoreID} = nanmean(dPrime, 1);
% 				u.dPrimeCQMeanSEM{condID,scoreID} = nansem(dPrime, 1);
% 
% 				% vector strength
% 				for binID = 1:size(u.vsBins,1)
% 					for vsFreqID = 1:length(u.vsFreqs)
% 						vec = u.vs{condID,scoreID}{binID,vsFreqID};
% 						u.vectorStrengthMean{ ...
% 							condID,scoreID}{binID,vsFreqID} = ...
% 							nanmean(vec);
% 						u.vectorStrengthSEM{ ...
% 							condID,scoreID}{binID,vsFreqID} = ...
% 							nansem(vec);
% 					end
% 				end
% 
% 				% running vs at 10 hz
% 				vs = u.vs10{condID,scoreID};
% 				u.vs10Mean{condID,scoreID} = nanmean(vs);
% 				u.vs10SEM{condID,scoreID} = nansem(vs);
% 
% 				mts = u.mts{condID,scoreID};
% 				u.mtsMean{condID,scoreID} = nanmean(mts);
% 				u.mtsSEM{condID,scoreID} = nansem(mts);
% 
% 				% mfsl (minimum first spike latency)
% 				mfsl = u.mfsl{condID,scoreID};
% 				u.mfslMean{condID,scoreID} = nanmean(mfsl);
% 				u.mfslSEM{condID,scoreID} = nansem(mfsl);
% 
% 				% mfsl phase
% 				phase = u.mfslPhase{condID,scoreID};
% 				u.mfslPhaseMean{condID,scoreID} = nanmean(phase);
% 				u.mfslPhaseSEM{condID,scoreID} = nansem(phase);
% 
% 				% max firing rate
% 				firingMax = u.firingMax{condID,scoreID};
% 				u.firingMaxMean{condID,scoreID} = nanmean(firingMax);
% 				u.firingMaxSEM{condID,scoreID} = nansem(firingMax);
% 
% 				% mean firing rate
% 				firingMean = u.firingMean{condID,scoreID};
% 				u.firingMeanMean{condID,scoreID} = nanmean(firingMean);
% 				u.firingMeanSEM{condID,scoreID} = nansem(firingMean);
% 
% 				% pack
% 				s.units{modeID} = u;
% 			end
% 		end
% 	end


	%% save merged analysis in a .mat file
	analysis = {s};
	fprintf('Saving summary to %s\n', summaryFile);
	save(summaryFile, 'analysis', '-v7.3');
end


%% helper functions
function res = recordingMode(a)
	res = 0;
	% poke training is the low-effort condition
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
