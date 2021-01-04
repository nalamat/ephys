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
	headers.Intervals = ...  % per interval: onset/peri/offset ...
		{'SubjectID' 'UnitID' 'Category' 'SubCategory' ...
		'Mode' 'TargetLevel' 'Score' 'Interval' ...
		'TER', 'TEP', 'dPrime', 'FiringMean', 'FiringMax', 'MutualInfo' ...
		'VS10', 'MTS10', 'PSTHCorr'};

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

					% for onset/peri/offset/perifull
					for intervalID = 1:u.i.count
						intervalName = u.i.names{intervalID};

						ter = u.ter{condID,scoreID}(i,intervalID);
						tep = u.tep{condID,scoreID}(i,intervalID);
						dp = u.dPrimeInts{condID,scoreID}(i,intervalID);
						firingMean = u.firingMean{condID,scoreID}(i,intervalID);
						firingMax = u.firingMax{condID,scoreID}(i,intervalID);
						mutualInfo = u.mutualInfo{condID,scoreID}(i,intervalID);
						vs10  = u.vs10Ints{condID,scoreID}(i,intervalID);
						mts10 = u.mts10{condID,scoreID}(i,intervalID);
						psthCorr = u.PSTHCorrIntsR{condID,scoreID}(i,intervalID);

						tables.Intervals(end+1,:) = ...
							{sessionID unitID category subCategory ...
							mode level score intervalName ...
							ter tep dp firingMean firingMax mutualInfo ...
							vs10 mts10 psthCorr};
					end
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
