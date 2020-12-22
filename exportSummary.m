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
	headers.TER = ...      % target-evoked response
		{'SubjectID' 'UnitID' 'Category' 'SubCategory' ...
		'Mode' 'TargetLevel' 'Score' 'TER'};
	headers.dPrime = ...   % neurometric d'
		{'SubjectID' 'UnitID' 'Category' 'SubCategory' ...
		'Mode' 'TargetLevel' 'Score' 'Bin' 'dPrime'};
	headers.VS10 = ...     % vector strength at 10Hz pre/peri/post stim
		{'SubjectID' 'UnitID' 'Category' 'SubCategory' ...
		'Mode' 'TargetLevel' 'Score' 'Bin' 'VS10'};
	headers.FiringMean = ...
		{'SubjectID' 'UnitID' 'Category' 'SubCategory' ...
		'Mode' 'TargetLevel' 'Score' 'FiringMean'};
	headers.FiringMax = ...
		{'SubjectID' 'UnitID' 'Category' 'SubCategory' ...
		'Mode' 'TargetLevel' 'Score' 'FiringMax'};
	headers.MFSL = ...
		{'SubjectID' 'UnitID' 'Category' 'SubCategory' ...
		'Mode' 'TargetLevel' 'Score' 'MFSL'};

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
					unitID = unitIDs(i);
					sID = u.animalNames{condID,scoreID}{i};
					category = u.category{condID,scoreID}(i);
					subCategory = u.subCategory{condID,scoreID}(i);

					if condID~=1
						peri = 0<=u.psthCenters & ...
							u.psthCenters<=u.targetDuration;
% 						if modeID==1
% 							nogoScore = 2;
% 						else
% 							nogoScore = 1;
% 						end
						nogo = u.psth{1,1}(i,peri);
						if any(isnan(u.psth{condID,scoreID}(i)))
							continue;
						end
						go = u.psth{condID,scoreID}(i,peri);
						ter = trapz(u.psthCenters(peri), go-nogo);
						ter = ter / mean(nogo); % normalize

						tables.TER(end+1,:) = ...
							{sID unitID category subCategory ...
							mode level score ter};
					end

					% dPrime
					if condID~=1
						bins = {'Onset', 'Peri', 'PeriGap', 'Offset'};
						for binID = 1:length(bins)
							bin = bins{binID};
							d = u.(['dPrime' bin]){condID,scoreID}(i);
							tables.dPrime(end+1,:) = ...
								{sID unitID category subCategory ...
								mode level score bin d};
						end
					end

					% vector strength
					vsFreq = u.vsFreqs==10;
					for binID = 1:size(u.vsBins,1)
						bin = u.vsBinNames{binID};
						vs = u.vs{...
							condID,scoreID}{binID,vsFreq}(i);
						tables.VS10(end+1,:) = ...
							{sID unitID category subCategory ...
							mode level score bin vs};
					end

					% mean firing rate
					firingMean = u.firingMean{condID,scoreID}(i);
					tables.FiringMean(end+1,:) = ...
							{sID unitID category subCategory ...
							mode level score firingMean};

					% max firing rate
					firingMax = u.firingMax{condID,scoreID}(i);
					tables.FiringMax(end+1,:) = ...
							{sID unitID category subCategory ...
							mode level score firingMax};

					% minimum first spike latency
					mfsl = u.mfsl{condID,scoreID}(i);
					tables.MFSL(end+1,:) = ...
							{sID unitID category subCategory ...
							mode level score mfsl};
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
