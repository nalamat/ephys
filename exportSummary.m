function exportSummary(summaryFile)
	%% export summary file to excel format

	if length(summaryFile)<4 || ~strcmpi(summaryFile(end-3:end), '.mat')
		error('[exportSummary] Need a .mat file');
	end
	exportFile = [summaryFile(1:end-4) '.xlsx'];

	fprintf('Exporting as excel to %s\n', exportFile);

	% only export active/passive MMR, not quiet
	modes = {'Active', 'Passive'};
	scoresGo = {'All', 'HIT', 'MISS'};
	scoresNogo = {'All', 'CA', 'FA'};

	% prep table headers
	headers = struct();
	headers.Intervals = ...  % for onset/peri/offset
		{'SubjectID' 'UnitID' 'Category' 'SubCategory' ...
		'Mode' 'TargetLevel' 'Score' 'Interval' ...
		'TER', 'TEP', 'dPrime', 'FiringMean', 'FiringMax', 'MutualInfo' ...
		'VS10', 'MTS10'};
	headers.Overall = ...     
		{'SubjectID' 'UnitID' 'Category' 'SubCategory' ...
		'Mode' 'TargetLevel' 'Score' ...
		'FiringMeanOnset' 'FiringMeanPeri' 'FiringMeanOffset' ...
		'FiringMaxOnset' 'FiringMaxPeri' 'FiringMaxOffset' ...
		'VS10Phase' 'PSTHCorr'};

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
	for modeID = 1:length(modes)
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
				% passive recordings don't have a score
				if modeID~=1 && scoreID>1; continue; end

				unitIDs = u.unitIDs{condID,scoreID};
				if condID == 1
					score = scoresNogo{scoreID};
				else
					score = scoresGo{scoreID};
				end

				for i = 1:length(unitIDs)
					unitID      = unitIDs(i);
					sessionID   = u.animalNames{condID,scoreID}{i}; % sessionID
					category    = u.category{condID,scoreID}(i);
					subCategory = u.subCategory{condID,scoreID}(i);
					
					vsFreq      = u.vsFreqs==10;
					mtsFreq     = 9.5<=u.mtsFreqs & u.mtsFreqs<=10.5;

					% for onset/peri/offset/perifull
					for interval = 1:u.i.count
						intervalName = u.i.names{interval};

						ter = u.ter{condID,scoreID}(i,interval);
						tep = u.tep{condID,scoreID}(i,interval);
						dp = u.dPrimeIntervals{condID,scoreID}(i,interval);
						firingMean = u.firingMean{condID,scoreID}(i,interval);
						firingMax = u.firingMax{condID,scoreID}(i,interval);
						mutualInfo = u.mutualInfo{condID,scoreID}(i,interval);
						vs10  = u.vs{condID,scoreID}(i,vsFreq,interval);
						mts10 = u.mts{condID,scoreID}(i,mtsFreq,interval);
						mts10 = mean(mts10);

						tables.Intervals(end+1,:) = ...
							{sessionID unitID category subCategory ...
							mode level score intervalName ...
							ter tep dp firingMean firingMax mutualInfo vs10 mts10};
					end

					% overall
% 					firingMean = u.firingMean{condID,scoreID}(i);
% 					firingMax  = u.firingMax{condID,scoreID}(i);

					firingMeanOnset  = mean(u.psth{condID,scoreID}(i, u.i.mask.onset ));
					firingMeanPeri   = mean(u.psth{condID,scoreID}(i, u.i.mask.peri  ));
					firingMeanOffset = mean(u.psth{condID,scoreID}(i, u.i.mask.offset));
					firingMaxOnset   = max (u.psth{condID,scoreID}(i, u.i.mask.onset ));
					firingMaxPeri    = max (u.psth{condID,scoreID}(i, u.i.mask.peri  ));
					firingMaxOffset  = max (u.psth{condID,scoreID}(i, u.i.mask.offset));
					
					% onset vector phase at 10Hz
					[~, timeID] = min(abs(u.vs10Times-u.vs10Window/2));
					vs10Phase = u.vs10{condID,scoreID}(i, timeID);
					
					% psth pearson's correlation
					[~, timeID] = min(abs(u.psthCorrTimes-u.psthCorrWindow/2));
					psthCorr = u.psthCorrR{condID,scoreID}(i, timeID);
					
					tables.Overall(end+1,:) = ...
							{sessionID unitID category subCategory ...
							mode level score ...
							firingMeanOnset firingMeanPeri firingMeanOffset ...
							firingMaxOnset firingMaxPeri firingMaxOffset ...
							vs10Phase psthCorr};
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

	% fclose(f);
end
