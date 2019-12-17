animalNames = {
	'CMR04Tail'
	'CMR02Head'
	'CMR05Fluffy'
	};
analysisPath = 'AnalysisNJIT/%s.mat';

for animalID = 1:length(animalNames)
	animalName = animalNames{animalID};
	analysisFile = sprintf(analysisPath, animalName);
	load(analysisFile, 'analysis'); % load

	for analysisID = 1:length(analysis)
		a = analysis{analysisID}; % unpack
		a.animalName = animalName;

		for unitID = 1:a.unitCount
			u = a.units{unitID}; % unpack
			u.animalName = animalName;

	% 		for condID = 1:u.condCount
	% 			for scoreID = 1:3
	% 				c = zeros(0, length(u.psthCenters));
	% 				
	% 				if strcmpi(a.mode, 'passive') && scoreID~=1
	% 					u.psth{condID,scoreID} = c;
	% 				end
	% 				
	% 				if isempty(u.psth{condID,scoreID})
	% 					u.psthMean{condID,scoreID} = c;
	% 					u.psthSTD{condID,scoreID} = c;
	% 				end
	% 			end
	% 		end
	% 		
			a.units{unitID} = u; % pack
		end

		analysis{analysisID} = a; % pack
	end

	save(analysisFile, 'analysis', '-v7.3'); % save
end

fprintf('Done\n');
