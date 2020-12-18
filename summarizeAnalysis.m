function summarizeAnalysis(analysis, summaryFile, effort)
	%% summarize active MMR vs. passive MMR (+ passive quiet)
	
	fprintf('Summarizing analysis\n');
	
	effort = [' ' effort];

	recordingModeLabels = {
		['Active MMR' effort]
		'Passive MMR'
		'Passive Quiet'
		};
	modeCount = length(recordingModeLabels);

	% sessions and their analyses selected for summarizing
	sessions = {};

	% summary struct
	s = struct();
	s.type = 'summary';
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
	s.condCount = length(s.targetFreqs) ...
		* length(s.targetLevels) + 1;    % +1 for nogo
	s.targetDuration = sessions{1}{1}.targetDuration;
	s.viewBounds = sessions{1}{1}.viewBounds;
	s.unitCountPerCond = num2cell(zeros(1,s.condCount));
	s.spikeConfig = sessions{1}{1}.spikeConfig;


	%% setup summary units, each representing a specific recording mode
	for modeID = 1:s.unitCount
		u1 = sessions{1}{1}.units{1};

		u = struct();
		u.spikeConfig = u1.spikeConfig;
		u.type = 'Summary';
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
		u.targetResponseThresh = s.targetResponseThresh;
		u.targetResponseThreshCount = s.targetResponseThreshCount;
		u.phasicThresh = s.phasicThresh;
		u.phasicThreshCount = s.phasicThreshCount;

		u.psthBin = u1.psthBin;
		u.psthWin = u1.psthWin;
		u.psthEdges = u1.psthEdges;
		u.psthCenters = u1.psthCenters;
		u.baseFreqs = u1.baseFreqs;
		u.vectorBins = u1.vectorBins;
		u.vectorBinNames = u1.vectorBinNames;
		u.label = recordingModeLabels{modeID};

		cc = cell(s.condCount, 5); % 5: scores

		u.animalNames = cc;
		u.sessionIDs = cc;
		u.unitIDs = cc;
		u.unitTypes = cc; % single/multi
		u.phasic = cc;
		u.tonic = cc;
		u.category = cc; % phasic/tonic
		u.phasicSuppressing = cc;
		u.phasicEnhancing = cc;
		u.phasicNoChange = cc;
		u.subCategory = cc; % suppressing/enhancing/no-change
		u.psth = cc;
		u.psthMean = cc;
		u.psthSTD = cc;
		u.dPrimeCQMean = cc;
		u.dPrimeCQMeanMean = cc;
		u.dPrimeCQMeanErr = cc;
		u.dPrimeCQSum = cc;
		u.dPrimeOnset = cc;
		u.dPrimePeri = cc;
		u.dPrimePeriGap = cc;
		u.dPrimeOffset = cc;
		u.dPrimeBehavior = cell(s.condCount,1);
		u.mfsl = cc;
		u.mfslMean = cc;
		u.mfslErr = cc;
		u.mfslPhase = cc;
		u.mfslPhaseMean = cc;
		u.mfslPhaseErr = cc;
		u.maxFiring = cc;
		u.maxFiringMean = cc;
		u.maxFiringErr = cc;
		u.meanFiring = cc;
		u.meanFiringMean = cc;
		u.meanFiringErr = cc;
		u.vectorStrength = cc;
		u.vectorStrengthMean = cc;
		u.vectorStrengthErr = cc;
		for condID = 1:u.condCount
			for scoreID = 1:5
				u.vectorStrength{condID,scoreID} = ...
					cell(size(u.vectorBins,1), length(u.baseFreqs));
			end
		end

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
					
					if u.dPrimeOnset{uCondID,1} > s.targetResponseThresh
						targetResponse = targetResponse+1; end
					if u.dPrimePeriGap{uCondID,1} > s.targetResponseThresh
						targetResponse = targetResponse+1; end
					if u.dPrimeOffset{uCondID,1} > s.targetResponseThresh
						targetResponse = targetResponse+1; end
% 					if any(abs(u.dPrime{uCondID,1}(0<=u.psthCenters & ...
% 							u.psthCenters<u.targetDuration+50e-3)) > 1)
% 						targetResponse = targetResponse+1;
% 					end
				end
				
				baseFreq = u.baseFreqs==10;
				for uCondID = 1:u.condCount
					sCondID = mapCondID(uCondID, u, s);
					if sCondID==0; continue; end % for omitted conditions
					
					for binID = 1:size(u.vectorBins,1)
						vs = u.vectorStrength{uCondID,1}{binID,baseFreq};
						p = u.vectorPVal{uCondID,1}{binID,baseFreq};
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
% 				baseFreq = u.baseFreqs==10;
% 
% 				for binID = 1:size(u.vectorBins,1)
% 					vs1 = cellfun(@(c)c{binID,baseFreq}, ...
% 						u1.vectorStrength(:,1));
% 					vs2 = cellfun(@(c)c{binID,baseFreq}, ...
% 						u2.vectorStrength(:,1));
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
				baseFreq = u.baseFreqs==10;
				change = (u.vectorStrength{end,1}{2,baseFreq} ...
						- u.vectorStrength{end,1}{1,baseFreq}) ...
						/ u.vectorStrength{end,1}{1,baseFreq};
				
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

			for mode = 1:length(sessions{sessionID})
				a = sessions{sessionID}{mode};
				a = calculatePerformance(a);
	% 			if isempty(a); continue; end
				u = a.units{unitID};
				for uCondID = 1:u.condCount
					% map condition ID from unit to summary
					sCondID = mapCondID(uCondID, u, s);
					
					% skip if a particular condition is not included in the
					% summary analysis
					if sCondID==0; continue; end

					for scoreID = 1:5
						% check if there have been any trials for the current
						% condition and score pair
						psth = u.psthMean{uCondID,scoreID};
						if isempty(psth); psth = nan; end

						% keep a list of summarized animal names & unit IDs
						% (different unit numbering scheme) 
						s.units{mode}.animalNames{sCondID,scoreID}{end+1} ...
							= a.animalName;
						s.units{mode}.sessionIDs{sCondID,scoreID}(end+1) ...
							= sessionID;
						s.units{mode}.unitIDs{sCondID,scoreID}(end+1) ...
							= s.targetRespondingUnits;
						
						s.units{mode}.unitTypes{sCondID,scoreID}{end+1} ...
							= u.type;
					
						% does unit respond to masker?
						s.units{mode}.tonic{ ...
							sCondID,scoreID}(end+1) = ~phasic;
						s.units{mode}.phasic{ ...
							sCondID,scoreID}(end+1) = phasic;
						s.units{mode}.category{ ...
							sCondID,scoreID}{end+1} = category;
						s.units{mode}.phasicSuppressing{ ...
							sCondID,scoreID}(end+1) = phasicSuppressing;
						s.units{mode}.phasicEnhancing{ ...
							sCondID,scoreID}(end+1) = phasicEnhancing;
						s.units{mode}.phasicNoChange{ ...
							sCondID,scoreID}(end+1) = phasicNoChange;
						s.units{mode}.subCategory{ ...
							sCondID,scoreID}{end+1} = subCategory;

						% psth
						c = size(s.units{mode}.psth{sCondID,scoreID}, 2);
						if c && c<size(psth,2) % fix for nan entries
							s.units{mode}.psth{sCondID, ...
								scoreID}(:,c+1:size(psth, 2)) = nan;
						end
						s.units{mode}.psth{sCondID,scoreID}(end+1,:) =psth;

						% d'
						dPrime = u.dPrimeCQMean{uCondID,scoreID};
						if isempty(dPrime); dPrime = nan;
						else
							% reference dPrime to tone onset
							pre = find(u.psthCenters < 0);
							dPrime = dPrime - dPrime(pre(end));
						end
						c = size(s.units{mode}.dPrimeCQMean{sCondID, ...
							scoreID}, 2);
						if c && c<size(dPrime,2) % fix for nan entries
							s.units{mode}.dPrimeCQMean{sCondID, ...
								scoreID}(:,c+1:size(dPrime, 2)) = nan;
						end
						s.units{mode}.dPrimeCQMean{sCondID,scoreID}( ...
							end+1,:) = dPrime;
						
						dPrime = u.dPrimeCQSum{uCondID,scoreID};
						if isempty(dPrime); dPrime = nan;
						else
							% reference dPrime to tone onset
							pre = find(u.psthCenters < 0);
							dPrime = dPrime - dPrime(pre(end));
						end
						c = size(s.units{mode}.dPrimeCQSum{sCondID, ...
							scoreID}, 2);
						if c && c<size(dPrime,2) % fix for nan entries
							s.units{mode}.dPrimeCQSum{sCondID, ...
								scoreID}(:,c+1:size(dPrime, 2)) = nan;
						end
						s.units{mode}.dPrimeCQSum{sCondID,scoreID}( ...
							end+1,:) = dPrime;
						
						% d' onset/peri/offset
						dPrime = u.dPrimeOnset{uCondID,scoreID};
						if isempty(dPrime); dPrime = nan; end
						s.units{mode}.dPrimeOnset{sCondID,scoreID}( ...
							end+1) = dPrime;
						
						dPrime = u.dPrimePeri{uCondID,scoreID};
						if isempty(dPrime); dPrime = nan; end
						s.units{mode}.dPrimePeri{sCondID,scoreID}( ...
							end+1) = dPrime;
						
						dPrime = u.dPrimePeriGap{uCondID,scoreID};
						if isempty(dPrime); dPrime = nan; end
						s.units{mode}.dPrimePeriGap{sCondID,scoreID}( ...
							end+1) = dPrime;
						
						dPrime = u.dPrimeOffset{uCondID,scoreID};
						if isempty(dPrime); dPrime = nan; end
						s.units{mode}.dPrimeOffset{sCondID,scoreID}( ...
							end+1) = dPrime;

						% vector strength
						for binID = 1:size(u.vectorBins,1)
							for baseFreqID = 1:length(u.baseFreqs)
								vec = u.vectorStrength{uCondID,scoreID};
								if isempty(vec); vec = nan;
								else
									vec = vec{binID,baseFreqID};
								end
								s.units{mode}.vectorStrength{ ...
									sCondID,scoreID}{binID,baseFreqID}( ...
									end+1) = vec;
							end
						end

						% mfsl (minimum first spike latency)
						mfsl = u.mfsl{uCondID,scoreID};
						if isempty(mfsl); mfsl = nan; end
						s.units{mode}.mfsl{sCondID,scoreID}(end+1) = mfsl;

						% mfsl phase
						phase = u.mfslPhase{uCondID,scoreID};
						if isempty(phase); phase = nan; end
						s.units{mode}.mfslPhase{sCondID,scoreID}(end+1) ...
							= phase;

						% max firing rate
						maxFiring = u.maxFiring{uCondID,scoreID};
						if isempty(maxFiring); maxFiring = nan; end
						s.units{mode}.maxFiring{sCondID,scoreID}(end+1) ...
							= maxFiring;

						% max firing rate
						meanFiring = u.meanFiring{uCondID,scoreID};
						if isempty(meanFiring); meanFiring = nan; end
						s.units{mode}.meanFiring{sCondID,scoreID}(end+1)...
							= meanFiring;
					end
					
					if isempty(u.psthMean{uCondID,1}); continue; end
					
					if mode==1
						s.unitCountPerCond{sCondID} = ...
							s.unitCountPerCond{sCondID} + 1;
					end
					
					s.units{mode}.dPrimeBehavior{sCondID}(end+1) = ...
						a.dPrimeBehavior{uCondID};
				end
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


	%% calculate mean and std of psth and d'
	for modeID = 1:s.unitCount
		for condID = 1:s.condCount
			for scoreID = 1:5
				% psth
				psth = s.units{modeID}.psth{condID,scoreID};
				s.units{modeID}.psthMean{condID,scoreID} = ...
					mean(psth, 1);
				s.units{modeID}.psthSTD{condID,scoreID} = ...
					std(psth, 0, 1) / sqrt(size(psth, 1));    % sem

				% cumulative quadratic mean of d'
				dPrime = s.units{modeID}.dPrimeCQMean{condID,scoreID};
				s.units{modeID}.dPrimeCQMeanMean{condID,scoreID} = ...
					mean(dPrime, 1);
				s.units{modeID}.dPrimeCQMeanErr{condID,scoreID} = ...
					std(dPrime, 0,1) / sqrt(size(dPrime,1));    % sem

				% vector strength
				for binID = 1:size(s.units{modeID}.vectorBins,1)
					for baseFreqID = 1:length(s.units{modeID}.baseFreqs)
						vec = s.units{modeID}.vectorStrength{ ...
							condID,scoreID}{binID,baseFreqID};
						s.units{modeID}.vectorStrengthMean{ ...
							condID,scoreID}{binID,baseFreqID} = ...
							mean(vec);
						s.units{modeID}.vectorStrengthErr{ ...
							condID,scoreID}{binID,baseFreqID} = ...
							std(vec) / sqrt(length(vec));    % sem
					end
				end

				% mfsl (minimum first spike latency)
				mfsl = s.units{modeID}.mfsl{condID,scoreID};
				s.units{modeID}.mfslMean{condID,scoreID} = ...
					mean(mfsl);
				s.units{modeID}.mfslErr{condID,scoreID} = ...
				% mfsl phase
				phase = s.units{modeID}.mfslPhase{condID,scoreID};
				s.units{modeID}.mfslPhaseMean{condID,scoreID} = ...
					nanmean(phase);
				s.units{modeID}.mfslPhaseErr{condID,scoreID} = ...
					nansem(phase);

				% max firing rate
				maxFiring = s.units{modeID}.maxFiring{condID,scoreID};
				s.units{modeID}.maxFiringMean{condID,scoreID} = ...
					mean(maxFiring);
				s.units{modeID}.maxFiringErr{condID,scoreID} = ...
					std(maxFiring, 0) / sqrt(length(maxFiring));    % sem

				% mean firing rate
				meanFiring = s.units{modeID}.meanFiring{condID,scoreID};
				s.units{modeID}.meanFiringMean{condID,scoreID} = ...
					mean(meanFiring);
				s.units{modeID}.meanFiringErr{condID,scoreID} = ...
					std(meanFiring, 0) / sqrt(length(meanFiring));    % sem
			end
		end
	end


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

function sem = nansem(x, dim)
	if nargin<2
		dim = 1;
	end
	sem = nanstd(x, 0, dim) ./ sqrt(sum(~isnan(x), dim));
end
