% classify, merge and reanalyze units based on their pattern of activity

analysisFile = 'Analysis/CMR02Head-Classes.mat';
animalNames = {
	'CMR02Head'
	};

classes = [];    % class information and list of units to be merged

%% classify units based on their pattern of activity
for animalID = 1:length(animalNames)
	animalAnalysisFile = sprintf('Analysis/%s.mat', animalNames{animalID});

	fprintf('Loading analysis from %s\n', animalAnalysisFile);
	load(animalAnalysisFile, 'analysis');
	
	fprintf('Classifying units from %d sessions\n', length(analysis));
	
	for analysisID = 1:length(analysis)
		for unitID = 1:analysis{analysisID}.unitCount
			u = analysis{analysisID}.units{unitID};
			
			% extract 4 features
			peri   = any([u.pvalPeri{:}] < 0.05);          % peri stim
			onset  = any(abs([u.zscoreOnset{:}]) > 1);     % stim onset
			offset = any(abs([u.zscoreOffset{:}]) > 1);    % stim offset
			
			masker = false;    % is unit following masker?
			for condID = 1:u.condCount
				for binID = 1:size(u.vectorBins,1)
					pval  = u.vectorPVal{condID}{binID}{u.baseFreqs==10};
					zscore= u.vectorZScore{condID}{binID}{u.baseFreqs==10};
					if pval < 0.05 && abs(zscore) > 1
						masker = true;
						break;
					end
				end % binID
				if masker; break; end
			end % condID
			
			% generate a label for current unit's class by appending
			% extracted feature names and masker file/level as a string
			labels = {};
			if peri  ; labels{end+1} = 'peri'  ; end
			if onset ; labels{end+1} = 'onset' ; end
			if offset; labels{end+1} = 'offset'; end
			if masker; labels{end+1} = 'masker'; end
			labels{end+1} = u.maskerFile;
			labels{end+1} = sprintf('%ddB', u.maskerLevel);
			label = strjoin(labels, ' ');
			
			% look if a class with the same label already exists
			foundID = 0;
			for classID = 1:length(classes)
				if strcmp(classes{classID}.label, label)
					foundID = classID;
					break;
				end
			end
			
			if foundID
				% if same class found, append current unit
				classes{foundID}.units{end+1} = u;
			else
				% if new class, initialize it and add current unit
				classes{end+1} = struct();
				classes{end  }.label = label;
				classes{end  }.units{1} = u;
			end
		end % unitID
	end % anlaysisID
end % animalID


%% merge and reanlayze classified units
% maximum number of merged units each anlaysis struct packs
maxUnitCount = 16;
% cell array of structs
analysis     = cell(1, ceil(length(classes)/maxUnitCount));

for analysisID = 1:length(analysis)
	a      = struct();    % analysis struct
	a.type = 'units';
	if analysisID == length(analysis)
		a.unitCount = mod(length(classes)-1, maxUnitCount)+1;
	else
		a.unitCount = maxUnitCount;
	end
	a.units = cell(1,a.unitCount);
	analysis{analysisID} = a;
end

% fprintf('%d classes to process\n', length(classes));

for classID = 1:length(classes)
	fprintf('Processing class %d/%d: "%s"\n', classID, ...
		length(classes), classes{classID}.label);
	
	% merge all units in the current class
	m       = mergeUnits(classes{classID}.units);
	m.label = classes{classID}.label;
	
	% analyze the merge unit
	m       = analyzeUnit(m);
	
	% store the analyzed unit in the analysis struct and cell array
	analysisID = ceil(classID / maxUnitCount);
	analysis{analysisID}.units{mod(classID-1,maxUnitCount)+1} = m;
	
end % classID


%% save merged analysis in a .mat file
fprintf('Saving merged analysis to %s\n', analysisFile);
save(analysisFile, 'analysis', '-v7.3');

fprintf('Done\n');
