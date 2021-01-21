function exportSummary(summaryFile)
	%% export summary file to excel format
% 	summaryFile = 'results/Summary-Trained-Sorted.mat';
% 	summaryFile = 'results/Summary-Naive-Sorted.mat';

	if length(summaryFile)<4 || ~strcmpi(summaryFile(end-3:end), '.mat')
		error('[exportSummary] Need a .mat file');
	end
% 	exportFile = [summaryFile(1:end-4) '.xlsx'];
	exportFile = [summaryFile(1:end-4) '.csv'];

	fprintf('Exporting as csv to %s\n', exportFile);

	% only export active/passive MMR, not quiet
	modes = {'Active', 'Passive'};
	scoresGo = {'All', 'HIT', 'MISS'};
	scoresNogo = {'All', 'CA', 'FA'};

	% prep table headers
% 	headers = struct();
% 	headers.Intervals = ...  % per interval: onset/peri/offset ...
% 		{'SubjectID' 'UnitID' 'Group' 'Category' 'SubCategory' ...
% 		'Mode' 'TargetLevel' 'Score' 'Interval' ...
% 		'TER' 'TEP' 'dPrime' 'FRMean' 'FRMax' 'MutualInfo' ...
% 		'VS10' 'VS10Phase' 'VS10PVal' 'MTS10' 'CorrR' 'CorrP'};

	% prep tables as empty cells
% 	tableNames = fieldnames(headers);
% 	tables = struct();
% 	for tableID = 1:length(tableNames)
% 		tables.(tableNames{tableID}) = {};
% 	end

	f = fopen(exportFile, 'w');
	fprintf(f, ['SubjectID,SessionID,UnitID,Group,Category,SubCategory,' ...
		'Mode,TargetLevel,Score,Interval,' ...
		'BehavDPrime,RateDPrime,DecorrDPrime,' ...
		'TER,TEP,FRMean,FRMax,MutualInfo,' ...
		'VS10,VS10Phase,VS10PVal,MTS10,CorrR,CorrP\n']);

	% load summary analysis
	load(summaryFile, 'analysis');
	a = analysis{1};

	% iterate through different recording modes stored as summary units
	for modeID = 1:length(modes)
		mode = modes{modeID};
		u = a.units{modeID};

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

				if condID == 1
					score = scoresNogo{scoreID};
				else
					score = scoresGo{scoreID};
				end

				for i = 1:length(u.unitIDs)
					subjectID   = u.animalNames{i};
					sessionID   = u.sessionIDs(i);
					unitID      = u.unitIDs(i);
					group       = u.group;
					category    = u.category{i};
					subCategory = u.subCategory{i};

					% for onset/peri/offset/perifull
					for intervalID = 1:u.i.count
						intervalName = u.i.names{intervalID};

						behavDP = u.dPrimeBehavior{condID}(i);
						rateDP = u.i.dPrime{condID,scoreID}(i,intervalID);
						decorrDP = u.decorrDPrime{condID,scoreID}(i);
						ter = u.i.ter{condID,scoreID}(i,intervalID);
						tep = u.i.tep{condID,scoreID}(i,intervalID);
						firingMean = u.i.frMean{condID,scoreID}(i,intervalID);
						firingMax = u.i.frMax{condID,scoreID}(i,intervalID);
						mutualInfo = u.i.mutualInfo{condID,scoreID}(i,intervalID);
						if isinf(mutualInfo); mutualInfo = nan; end
						vs10  = u.i.vs10{condID,scoreID}(i,intervalID);
						vs10Phase = u.i.vs10Phase{condID,scoreID}(i,intervalID);
						vs10PVal = u.i.vs10PVal{condID,scoreID}(i,intervalID);
						mts10 = u.i.mts10{condID,scoreID}(i,intervalID);
						corrR = u.i.corrR{condID,scoreID}(i,intervalID);
						corrP = u.i.corrP{condID,scoreID}(i,intervalID);

% 						tables.Intervals(end+1,:) = ...
% 							{animaName unitID category subCategory ...
% 							mode level score intervalName ...
% 							ter tep dp firingMean firingMax mutualInfo ...
% 							vs10 vs10Phase vs10PVal mts10 corrR corrP};
						
						fprintf(f, ['%s,%d,%d,%s,%s,%s,' ...
							'%s,%d,%s,%s,' ...
							'%d,%d,%d,' ...
							'%d,%d,%d,%d,%d,' ...
							'%d,%d,%d,%d,%d,%d\n'], ...
							subjectID, sessionID, unitID, group, category, subCategory, ...
							mode, level, score, intervalName, ...
							behavDP, rateDP, decorrDP, ...
							ter, tep, firingMean, firingMax, mutualInfo, ...
							vs10, vs10Phase, vs10PVal, mts10, corrR, corrP);
					end
				end
			end
		end
	end

	% write tables to excel file
% 	warning( 'off', 'MATLAB:xlswrite:AddSheet');
% 	if exist(exportFile, 'file'); delete(exportFile); end
% 	for tableID = 1:length(tableNames)
% 		name = tableNames{tableID};
% 		t = cell2table(tables.(name), 'variablenames', headers.(name));
% 		writetable(t, exportFile, 'sheet', name);
% 	end

	fclose(f);
end
