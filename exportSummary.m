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
	headers.TER = ...  % target-evoked response for onset/peri/offset
		{'SubjectID' 'UnitID' 'Category' 'SubCategory' ...
		'Mode' 'TargetLevel' 'Score' 'Interval' 'TER', 'TEP', 'dPrime'};
	headers.VS = ...     % vector strength for pre/peri/post
		{'SubjectID' 'UnitID' 'Category' 'SubCategory' ...
		'Mode' 'TargetLevel' 'Score' 'Bin' 'VS10' 'MTS10'};
	headers.Firing = ... % peri stimulus, including onset/offset
		{'SubjectID' 'UnitID' 'Category' 'SubCategory' ...
		'Mode' 'TargetLevel' 'Score' 'FiringMean', 'FiringMax'};

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

					for intervalID = 1:length(u.intervals)
						interval = u.intervalNames{intervalID};

						% target-evoked response
						ter = u.ter{condID,scoreID}(i,intervalID);

						% target-evoked peak
						tep = u.tep{condID,scoreID}(i,intervalID);

						% dPrime
						dp = u.dPrimeIntervals{condID,scoreID}(i,intervalID);

						tables.TER(end+1,:) = ...
							{sessionID unitID category subCategory ...
							mode level score interval ter tep dp};
					end

					% vector strength
					vsFreq = u.vsFreqs==10;
					mtsFreq = 9.5<=u.mtsFreqs & u.mtsFreqs<=10.5;
					for binID = 1:size(u.vsBins,1)
						bin = u.vsBinNames{binID};
						vs  = u.vs{condID,scoreID}(i,binID,vsFreq);
						mts = u.mts{condID,scoreID}(i,binID,mtsFreq);
						mts = mean(mts);
						tables.VS(end+1,:) = ...
							{sessionID unitID category subCategory ...
							mode level score bin vs mts};
					end

					% mean and max firing rate
					firingMean = u.firingMean{condID,scoreID}(i);
					firingMax  = u.firingMax{condID,scoreID}(i);
					tables.Firing(end+1,:) = ...
							{sessionID unitID category subCategory ...
							mode level score firingMean firingMax};
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
