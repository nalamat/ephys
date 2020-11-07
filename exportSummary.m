summaryFile = 'AnalysisNJIT/Summary-All-Sorted.mat';
exportFile = 'AnalysisNJIT/Summary-All-Sorted.xlsx';
% summaryFile = 'AnalysisNJIT/Summary-CMR05Fluffy-Sorted.mat';
% exportFile = 'AnalysisNJIT/Summary-CMR05Fluffy-Sorted.xlsx';
% summaryFile = 'AnalysisNJIT/Summary-CMR05Tail-Sorted.mat';
% exportFile = 'AnalysisNJIT/Summary-CMR05Tail-Sorted.xlsx';
% summaryFile = 'AnalysisNJIT/Summary-D2Right-Sorted.mat';
% exportFile = 'AnalysisNJIT/Summary-D2Right-Sorted.xlsx';
summaryFile = 'AnalysisNJIT/Summary-CMR08Tail-Sorted.mat';
exportFile = 'AnalysisNJIT/Summary-CMR08Tail-Sorted.xlsx';

modes = {'Active', 'Passive'};
scoresGo = {'', 'HIT', 'MISS'};
scoresNogo = {'', 'CA', 'FA'};

% prep table headers
headers = struct();
headers.DeltaPSTH = ...
	{'SubjectID' 'RecMode' 'UnitID' 'TargetLevel' 'Score' 'Phasic' 'DeltaPSTH'};
headers.dPrime = ...
	{'SubjectID' 'RecMode' 'UnitID' 'TargetLevel' 'Score' 'Phasic' 'Time' 'dPrime'};
headers.VectorStrength = ...
	{'SubjectID' 'RecMode' 'UnitID' 'TargetLevel' 'Score' 'Phasic' 'Bin' 'VectorStrength'};
headers.MeanFiring = ...
	{'SubjectID' 'RecMode' 'UnitID' 'TargetLevel' 'Score' 'Phasic' 'MeanFiring'};
headers.MaxFiring = ...
	{'SubjectID' 'RecMode' 'UnitID' 'TargetLevel' 'Score' 'Phasic' 'MaxFiring'};
headers.MFSL = ...
	{'SubjectID' 'RecMode' 'UnitID' 'TargetLevel' 'Score' 'Phasic' 'MFSL'};

% prep tables as empty cells
tableNames = fieldnames(headers);
tables = struct();
for tableID = 1:length(tableNames)
	tables.(tableNames{tableID}) = {};
end

% f = fopen('AnalysisNJIT/Summary.csv', 'w');
% fprintf(f, 'RecMode, UnitID, TargetLevel, Score, Time, dPrime\n');

% load summary analysis
load(summaryFile, 'analysis');
a = analysis{1};

% iterate through different recording modes stored as summary units
for modeID = 1:length(a.units)
	mode = modes{modeID};
	u = a.units{modeID};
	centers = u.psthCenters;
	time = centers(0<=centers & centers<u.targetDuration);
	time = time(1:round(50e-3/u.psthBin):end);
	
	for condID = 1:u.condCount 
		levelID = condID-1;
		if levelID
			level = u.targetLevels(levelID);
		else
			level = 0;
		end
		
		for scoreID = 1:3
% 			if modeID==1 && scoreID==1; continue; end
			if modeID==2 && scoreID>1; continue; end
			
			unitIDs = u.unitIDs{condID,scoreID};
			if condID == 1
				score = scoresNogo{scoreID};
			else
				score = scoresGo{scoreID};
			end
			
			for i = 1:length(unitIDs)
				unitID = unitIDs(i);
				sID = u.animalNames{condID,scoreID}{i};
				phasic = u.phasic{condID,scoreID}(i);
				
				if condID~=1
					peri = 0<=u.psthCenters & ...
						u.psthCenters<=u.targetDuration;
					nogo = u.psth{1,1}(i,peri);
					go = u.psth{condID,scoreID}(i,peri);
					delta = trapz(u.psthCenters(peri), go-nogo);
					delta = delta / mean(nogo); % normalize

					tables.DeltaPSTH(end+1,:) = ...
						{sID mode unitID level score phasic delta};
				end
				
				% dPrime
				if condID~=1
					dPrime = u.dPrimeCQMean{condID,scoreID}(i,:);

					for t = time
						d = dPrime(centers==t);
						tables.dPrime(end+1,:) = ...
							{sID mode unitID level score phasic round(t,3) d};
						
% 						fprintf(f, '%s, %d, %g, %s, %.2f, %.20e\n', ...
% 							mode, unitID, level, score, t, d);
					end
				end
				
				% vector strength
				baseFreq = u.baseFreqs==10;
				for binID = 1:size(u.vectorBins,1)
					bin = u.vectorBinNames{binID};
					vs = u.vectorStrength{...
						condID,scoreID}{binID,baseFreq}(i);
					tables.VectorStrength(end+1,:) = ...
						{sID mode unitID level score phasic bin vs};
				end
				
				% mean firing rate
				meanFiring = u.meanFiring{condID,scoreID}(i);
				tables.MeanFiring(end+1,:) = ...
						{sID mode unitID level score phasic meanFiring};
				
				% max firing rate
				maxFiring = u.maxFiring{condID,scoreID}(i);
				tables.MaxFiring(end+1,:) = ...
						{sID mode unitID level score phasic maxFiring};
				
				% minimum first spike latency
				mfsl = u.mfsl{condID,scoreID}(i);
				tables.MFSL(end+1,:) = ...
						{sID mode unitID level score phasic mfsl};
			end
		end
	end
end

% write tables to excel file
warning( 'off', 'MATLAB:xlswrite:AddSheet');
if exist(exportFile, 'file'); delete(exportFile); end
for tableID = 1:length(tableNames)
	name = tableNames{tableID};
	t = cell2table(tables.(name), 'variablenames', headers.(name));
	writetable(t, exportFile, 'sheet', name);
end

fprintf('Done\n');

% fclose(f);
