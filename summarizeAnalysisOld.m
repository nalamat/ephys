%% summarize active vs. passive

analysisPath = 'AnalysisNJIT/%s.mat';
animalNames = {
	'CMR02Head'
	'CMR05Fluffy-nochew'
	};
summaryFile = 'AnalysisNJIT/Summary-nochew.mat';

recordingModeLabels = {'Active MMR', 'Passive MMR'};
% 	'Passive Silence'};

% selected analyses for summarizing
analysis2 = {};

% summary struct
s = struct();
s.type = 'summary';
s.unitCount = length(recordingModeLabels);
s.units = cell(s.unitCount, 1);
s.targetFreqs = [];
s.targetLevels = [];


%% select matching active and passive sessions from analysis
for animalID = 1:length(animalNames)
	analysisFile = sprintf(analysisPath, animalNames{animalID});

	fprintf('Loading analysis from %s\n', analysisFile);
	load(analysisFile, 'analysis');
	
	fprintf('%d recordings found\n', length(analysis));
	
	for analysisID = 1:length(analysis)
		a = analysis{analysisID};
		
		if isfield(a, 'experimentMode'); a.mode = a.experimentMode; end
		if isfield(a, 'experimentStart'); a.time = a.experimentStart; end
		if isfield(a, 'experimentStartStr')
			a.timeStr = a.experimentStartStr; end
		
		% only compatible with EARS
		if ~strcmpi(a.version, 'ears'); continue; end

		mode = recordingMode(a);
		if mode == 0; continue; end
		
		% find matching date
		id2 = 0;
		for analysisID2 = 1:length(analysis2)
			for mode2 = 1:length(analysis2{analysisID2})
				a2 = analysis2{analysisID2}{mode2};
				if ~isempty(a2) && isSameDay(a.time, a2.time)
					id2 = analysisID2;
					break;
				end
			end % mode2
			if id2 ~= 0; break; end
		end % analysisID2

		% if no matching date found, append
		if id2 == 0
			analysis2{end+1} = cell(2,1);
			id2 = length(analysis2);
		end

		analysis2{id2}{mode} = a;
	end % analysisID
end % animalID


%% drop cells that don't have both 'Active MMR' and 'Passive MMR'
drop = [];
for analysisID2 = 1:length(analysis2)
	if length(analysis2{analysisID2})<2
		drop = [drop, analysisID2];
		continue;
	end
	
	blank = false;
	for mode = 1:2
		if isempty(analysis2{analysisID2}{mode})
			blank = true;
		end
	end
	if blank
		drop = [drop, analysisID2];
		continue;
	end
	
	% TODO: match target conditions
	a1 = analysis2{analysisID2}{1};
	a2 = analysis2{analysisID2}{2};
	if ~isequal(a1.targetLevels, a2.targetLevels)
		drop = [drop, analysisID2];
		continue;
	end
% 	c1 = setdiff(a1.targetLevels, a2.targetLevels);
% 	c2 = setdiff(a2.targetLevels, a1.targetLevels);
end
drop = unique(drop);
analysis2(drop) = [];


%% get all target stimulus conditions
for analysisID2 = 1:length(analysis2)
	for mode = 1:length(analysis2{analysisID2})
		a = analysis2{analysisID2}{mode};
% 		if isempty(a); continue; end
		s.targetFreqs  = [s.targetFreqs , a.targetFreqs ];
		s.targetLevels = [s.targetLevels, a.targetLevels];
	end
end
s.targetFreqs  = unique(s.targetFreqs);
s.targetLevels = unique(s.targetLevels);
% the `unique` function has a weird behavior that returns a 0x1 vector
% when acting on empty vectors, next 2 lines fix this
if isempty(s.targetFreqs ); s.targetFreqs  = []; end
if isempty(s.targetLevels); s.targetLevels = []; end
s.condCount = length(s.targetFreqs) ...
	* length(s.targetLevels) + 1;    % +1 for nogo
s.targetDuration = analysis2{1}{1}.targetDuration;
s.viewBounds = analysis2{1}{1}.viewBounds;


%% setup summary units, each of which represent a specific recording mode
for modeID = 1:s.unitCount
	u1 = analysis2{1}{1}.units{1};
	
	u = struct();
	u.condCount = s.condCount;
	u.targetFreqs = s.targetFreqs;
	u.targetLevels = s.targetLevels;
	u.targetDuration = s.targetDuration;
	u.viewBounds = s.viewBounds;
	
	u.psthBin = u1.psthBin;
	u.psthWin = u1.psthWin;
	u.psthEdges = u1.psthEdges;
	u.psthCenters = u1.psthCenters;
	u.baseFreqs = u1.baseFreqs;
	u.vectorBins = u1.vectorBins;
	u.vectorBinNames = u1.vectorBinNames;
	u.label = recordingModeLabels{modeID};
	
	cc = cell(s.condCount, 3); % 3: scores
	
	u.animalNames = cc;
	u.unitIDs = cc;
	u.tonic = cc;
	u.phasic = cc;
	u.phasicSuppressing = cc;
	u.phasicEnhancing = cc;
	u.psth = cc;
	u.psthMean = cc;
	u.psthSTD = cc;
	u.dPrimeCQMean = cc;
	u.dPrimeCQMeanMean = cc;
	u.dPrimeCQMeanErr = cc;
	u.mfsl = cc;
	u.mfslMean = cc;
	u.mfslErr = cc;
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
		for scoreID = 1:3
			u.vectorStrength{condID,scoreID} = ...
				cell(size(u.vectorBins,1), length(u.baseFreqs));
		end
	end
	
	s.units{modeID} = u;
end


%% select target responding units and gather their activation metrics
s.targetRespondingUnits = 0;
s.tonicUnits = 0;
s.phasicUnits = 0;
s.phasicSuppressingUnits = 0;
s.phasicEnhancingUnits = 0;
for analysisID2 = 1:length(analysis2)
	for unitID = 1:analysis2{analysisID2}{1}.unitCount
		% check if unit is auditory
		targetResponding = 0;
		phasic = 0;
		for mode = 1:length(analysis2{analysisID2})
			a = analysis2{analysisID2}{mode};
% 			if isempty(a); continue; end
			u = a.units{unitID};
			for condID = 2:u.condCount
				if u.dPrimeOnset{condID,1} > .3
					targetResponding = targetResponding+1; end
				if u.dPrimePeri{condID,1} > .3
					targetResponding = targetResponding+1; end
				if u.dPrimeOffset{condID,1} > .3
					targetResponding = targetResponding+1; end
			end
			baseFreq = u.baseFreqs==10;
			for condID = 1:u.condCount
				for binID = 1:size(u.vectorBins,1)
					vs = u.vectorStrength{condID,1}{binID,baseFreq};
					p = u.vectorPVal{condID,1}{binID,baseFreq};
					if isnan(vs)
						fprintf(...
							'NAN: cond %d, bin %d, channel %d, %s\n', ...
							condID, binID, a.channels(unitID), u.dataFile);
					end
					if p<.001
						phasic = phasic+1;
					end
				end
			end
		end
		
		% does unit respond to target?
		if targetResponding < 2; continue; end
		
		fprintf('Selecting channel %d from %s on %s\n', ...
			analysis2{analysisID2}{1}.channels(unitID), ...
			analysis2{analysisID2}{1}.animalName, ...
			analysis2{analysisID2}{1}.timeStr);
		s.targetRespondingUnits = s.targetRespondingUnits + 1;
		
		% does unit respond to masker?
		phasic = phasic>=2;
		if phasic
			s.phasicUnits = s.phasicUnits + 1;
		else
			s.tonicUnits = s.tonicUnits + 1;
		end
		
		% is unit masker suppressing?
		phasicSuppressing = false;
		phasicEnhancing = false;
		if phasic
			u1 = analysis2{analysisID2}{1}.units{unitID};
			u2 = analysis2{analysisID2}{2}.units{unitID};
			baseFreq = u.baseFreqs==10;
			
			for binID = 1:size(u.vectorBins,1)
				vs1 = cellfun(@(c)c{binID,baseFreq}, ...
					u1.vectorStrength(:,1));
				vs2 = cellfun(@(c)c{binID,baseFreq}, ...
					u2.vectorStrength(:,1));
				if ttest(vs1, vs2)
					if mean(vs1) < mean(vs2)
						phasicSuppressing = true;
					else
						phasicEhnancing = true;
					end
				end
			end
		end
		if phasicSuppressing
			s.phasicSuppressingUnits = s.phasicSuppressingUnits + 1;
		elseif phasicEnhancing
			s.phasicEnhancingUnits = s.phasicEnhancingUnits + 1;
		end
		
		for mode = 1:length(analysis2{analysisID2})
			a = analysis2{analysisID2}{mode};
% 			if isempty(a); continue; end
			u = a.units{unitID};
			for uCondID = 1:u.condCount
				% map condition ID from unit to summary
				sCondID = mapCondID(uCondID, u, s);
				
				for scoreID = 1:3
					% check if there have been any trials for the current
					% condition and score pair
					psth = u.psthMean{uCondID,scoreID};
					if isempty(psth); continue; end
					
					% keep a list of summarized animal names and unit IDs
					% (different unit numbering scheme) 
					s.units{mode}.animalNames{sCondID,scoreID}{end+1} = ...
						a.animalName;
					s.units{mode}.unitIDs{sCondID,scoreID}(end+1) = ...
						s.targetRespondingUnits;
					
					% does unit respond to masker?
					s.units{mode}.tonic{ ...
						sCondID,scoreID}(end+1) = ~phasic;
					s.units{mode}.phasic{ ...
						sCondID,scoreID}(end+1) = phasic;
					s.units{mode}.phasicSuppressing{ ...
						sCondID,scoreID}(end+1) = phasicSuppressing;
					s.units{mode}.phasicEhnancing{ ...
						sCondID,scoreID}(end+1) = phasicEnhancing;
					
					% psth
					s.units{mode}.psth{sCondID,scoreID}(end+1,:) = psth;
					
					% d'
					dPrime = u.dPrimeCQMean{uCondID,scoreID};
					pre = find(u.psthCenters < 0);
					dPrime = dPrime - dPrime(pre(end));
					s.units{mode}.dPrimeCQMean{sCondID,scoreID}( ...
						end+1,:) = dPrime;
					
					% vector strength
					for binID = 1:size(u.vectorBins,1)
						for baseFreqID = 1:length(u.baseFreqs)
							vec = u.vectorStrength{ ...
								uCondID,scoreID}{binID,baseFreqID};
							s.units{mode}.vectorStrength{ ...
								sCondID,scoreID}{binID,baseFreqID}( ...
								end+1) = vec;
						end
					end
					
					% mfsl (minimum first spike latency)
					s.units{mode}.mfsl{sCondID,scoreID}(end+1) = ...
						u.mfsl{uCondID,scoreID};
					
					% max firing rate
					s.units{mode}.maxFiring{sCondID,scoreID}(end+1) = ...
						u.maxFiring{uCondID,scoreID};
					
					% max firing rate
					s.units{mode}.meanFiring{sCondID,scoreID}(end+1) = ...
						u.meanFiring{uCondID,scoreID};
				end
			end
		end
	end
end

fprintf(['Selected %d target responding & %d masker responding units ' ...
	'& %d masker suppressing units\n'], ...
	s.targetRespondingUnits, s.phasicUnits, ...
	s.phasicSuppressingUnits);


%% calculate mean and std of psth and d'
for modeID = 1:s.unitCount
	for condID = 1:s.condCount
		for scoreID = 1:3
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
				std(mfsl, 0) / sqrt(length(mfsl));    % sem
			
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
analysisTemp = analysis;
analysis = {s};
fprintf('Saving summary of analysis to %s\n', summaryFile);
save(summaryFile, 'analysis', '-v7.3');
analysis = analysisTemp;

fprintf('Done\n');


%% helper functions
function res = recordingMode(a)
	res = 0;
	if strcmpi(a.mode, 'go nogo') && ...
			strcmpi(a.maskerFile, 'supermasker.wav') && ...
			a.maskerLevel == 50 && ...
			isequal(a.targetFreqs, 1)
		res = 1;
	elseif strcmpi(a.mode, 'passive') && ...
			strcmpi(a.maskerFile, 'supermasker.wav') && ...
			a.maskerLevel == 50 && ...
			isequal(a.targetFreqs, 1)
		res = 2;
% 	elseif strcmpi(a.mode, 'passive') && ...
% 			(strcmpi(a.maskerFile, '') || a.maskerLevel == 0) && ...
% 			isequal(a.targetFreqs, 1)
% 		res = 3;
	end
end
