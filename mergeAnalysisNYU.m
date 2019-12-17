% Merge analysis from files recorded the same day with same parameters
mergeTable  = 'merge_table_v4.xlsx';
animalNames = {
	'BackF5'
	'BackM4'
	'CMRphys'
	'first_data'
	'FluffyM4'
	'HeadM_G1'
	'LeftF8'
	'RightF1'
	'RightM7'
	'TailF1'
	};

try
	
for animalID = 1:length(animalNames)
	animalName   = animalNames{animalID};
	analysisFile = sprintf('FileAnalysis2/%s.mat'   , animalName);
	mergedFile   = sprintf('MergedAnalysis2/%s.mat' , animalName);


	%% Read merge information from excel file
	fprintf('Reading merge information from %s\n', mergeTable)
	[~,~,table] = xlsread(mergeTable);

	merges = {};

	for i = 2:size(table,1)
		if isnan(table{i,2}); continue; end

		dataFile = table{i,1};
		params   = [table{i,2:6}];
		tokens   = strsplit(dataFile, '\');

		% Only process files from the current animal
		if ~strcmp(animalName, tokens{1})
			continue;
		end

		% Check if merge already exists
		m = [];
		for j = 1:length(merges)
			if all(merges{j}.params==params)
				m = merges{j};
				break;
			end
		end

		% If merge doesn't exist, create one
		if isempty(m)
			j = length(merges)+1;
			m = struct();
			m.params = params;
			m.dataFiles  = {};
		end

		% Add file to the merge
		m.dataFiles{end+1} = dataFile;

		merges{j} = m;
	end


	%% Combine data in the same merge group
	fprintf('Loading analysis from %s\n', analysisFile);
	analysis = load(analysisFile);
	emptyMerges = [];

	fprintf('%d merges to process\n', length(merges));

	for mergeID = 1:length(merges)

		fprintf('Processing merge %d\n', mergeID);
		m = merges{mergeID};

		% First pass: Load analysis data from files in the current merge and
		% combine their stimulus conditions
		m.files        = cell(size(m.dataFiles));
		m.elecs        = [];
		m.targetFreqs  = [];
		m.targetLevels = [];
		ignoreFiles    = [];

		for fileID = 1:length(m.dataFiles)
			% Find find in analysis data
			f = [];
			for k = 1:length(analysis.files)
				if strcmp(m.dataFiles{fileID}, analysis.files{k}.dataFile)
					f = analysis.files{k};
					break;
				end
			end
			% Skip when file not found
			% Skip weird files with many different target frequencies
			if isempty(f) || length(f.targetFreqs)>7
				ignoreFiles(end+1) = fileID;
				continue;
			end

			% Keep analysis data for second pass
			m.files{fileID} = f;

			% Combine stimulus conditions
			m.elecs        = [m.elecs        f.elecs       ];
			m.targetFreqs  = [m.targetFreqs  f.targetFreqs ];
			m.targetLevels = [m.targetLevels f.targetLevels];
		end % fileID

	% 	dataFiles = m.dataFiles;
	% 	files = m.files;

		m.dataFiles(ignoreFiles) = [];
		m.files(ignoreFiles) = [];

		% keep track of empty merges with no files
		if isempty(m.files)
			emptyMerges(end+1) = mergeID;
			continue;
		end

		m.elecs        = unique(m.elecs);
		m.targetFreqs  = unique(m.targetFreqs);
		m.targetLevels = unique(m.targetLevels);
		m.condCount    = length(m.targetFreqs) * ...
			length(m.targetLevels) + 1;    % +1 for nogo

		fprintf('%d files found for the merge\n', length(m.files));

		% Initialize empty merged analysis
		f1 = m.files{1};
		m.condTrialCount = zeros(1,m.condCount);
		m.maskerLevel   = f1.maskerLevel;
		m.psthBin       = f1.psthBin;
		m.psthEdges     = f1.psthEdges;
		m.psthCenters   = f1.psthCenters;
		m.baseFreqs     = f1.baseFreqs;
		for elecID = 1:length(m.elecs)
			for cond_ID = 1:m.condCount
				m.psth      {elecID}{cond_ID} = zeros(size(f1.psth      {1}{1}));
				m.lambda    {elecID}{cond_ID} = zeros(size(f1.lambda    {1}{1}));
				m.mutualInfo{elecID}{cond_ID} = zeros(size(f1.mutualInfo{1}{1}));
				m.mfsl      {elecID}{cond_ID} = zeros(size(f1.mfsl      {1}{1}));
				m.maxFiring {elecID}{cond_ID} = zeros(size(f1.maxFiring {1}{1}));
				m.meanFiring{elecID}{cond_ID} = zeros(size(f1.meanFiring{1}{1}));
				m.stdFiring {elecID}{cond_ID} = zeros(size(f1.stdFiring {1}{1}));
				for baseFreqID = 1:length(m.baseFreqs)
					m.vectorStrength{elecID}{cond_ID}{baseFreqID} = zeros(size(f1.vectorStrength{1}{1}{1}));
					% vectorPhase ?
					m.vectorPVal    {elecID}{cond_ID}{baseFreqID} = zeros(size(f1.vectorPVal    {1}{1}{1}));
				end % baseFreqID
				m.mtfS10hz     {elecID}{cond_ID} = 0;
				m.mtfTrialCount{elecID}{cond_ID} = 0;
			end % condID
		end % elecID

		% Second pass: Combine analysis data with weighted average
		for fileID = 1:length(m.files)

			fprintf('Combining file %d\n', fileID);
			f = m.files{fileID};

			% Per all conditions in the file
			for condIDf = 1:f.condCount
				% Transform condition index from file (f) to merge (m)
				if condIDf == 1
					condIDm = 1;
				else
					freqIDf  = floor((condIDf-2)/length(f.targetLevels))+1;
					levelIDf = mod((condIDf-2),length(f.targetLevels))+1;
					freq     = f.targetFreqs (freqIDf );
					level    = f.targetLevels(levelIDf);
					freqIDm  = find(m.targetFreqs==freq);
					levelIDm = find(m.targetLevels==level);
					condIDm  = (freqIDm-1)*length(m.targetLevels)+levelIDm+1;
				end

				trialCount = m.condTrialCount(condIDm) + f.condTrialCount(condIDf);
				weight1    = m.condTrialCount(condIDm)/trialCount;
				weight2    = f.condTrialCount(condIDf)/trialCount;
				m.condTrialCount(condIDm) = trialCount;

				for elecIDf = 1:length(f.elecs)
					% Transform file electrode index to merge electrode index
					elec    = f.elecs(elecIDf);
					elecIDm = find(m.elecs==elec);

					m.psth      {elecIDm}{condIDm} = wmean(m.psth      {elecIDm}{condIDm}, weight1, f.psth      {elecIDf}{condIDf}, weight2);
					m.lambda    {elecIDm}{condIDm} = wmean(m.lambda    {elecIDm}{condIDm}, weight1, f.lambda    {elecIDf}{condIDf}, weight2);
					m.mutualInfo{elecIDm}{condIDm} = wmean(m.mutualInfo{elecIDm}{condIDm}, weight1, f.mutualInfo{elecIDf}{condIDf}, weight2);
					m.mfsl      {elecIDm}{condIDm} = wmean(m.mfsl      {elecIDm}{condIDm}, weight1, f.mfsl      {elecIDf}{condIDf}, weight2);
					m.maxFiring {elecIDm}{condIDm} = wmean(m.maxFiring {elecIDm}{condIDm}, weight1, f.maxFiring {elecIDf}{condIDf}, weight2);
					m.meanFiring{elecIDm}{condIDm} = wmean(m.meanFiring{elecIDm}{condIDm}, weight1, f.meanFiring{elecIDf}{condIDf}, weight2);
					m.stdFiring {elecIDm}{condIDm} = wmean(m.stdFiring {elecIDm}{condIDm}, weight1, f.stdFiring {elecIDf}{condIDf}, weight2);

					for baseFreqID = 1:length(m.baseFreqs)
						m.vectorStrength{elecIDm}{condIDm}{baseFreqID} = wmean(m.vectorStrength{elecIDm}{condIDm}{baseFreqID}, weight1, f.vectorStrength{elecIDf}{condIDf}{baseFreqID}, weight2);
						% vectorPhase ?
						m.vectorPVal    {elecIDm}{condIDm}{baseFreqID} = wmean(m.vectorPVal    {elecIDm}{condIDm}{baseFreqID}, weight1, f.vectorPVal    {elecIDf}{condIDf}{baseFreqID}, weight2);
					end % baseFreqID

					
					% Some conditions might not have a mtf
					mtfF = f.mtfF{elecIDf}{condIDf};
					if ~isempty(mtfF)
						mtfTrialCount = m.mtfTrialCount{elecIDm}{condIDm} + f.condTrialCount(condIDf);
						mtfWeight1 = m.mtfTrialCount{elecIDm}{condIDm}/mtfTrialCount;
						mtfWeight2 = f.condTrialCount(condIDf)/mtfTrialCount;
						m.mtfTrialCount{elecIDm}{condIDm} = mtfTrialCount;
						fRange = 9.5<=mtfF & mtfF<=10.5;
						mtfS10hz = mean(f.mtfS{elecIDf}{condIDf}(fRange));
						m.mtfS10hz{elecIDm}{condIDm} = wmean(m.mtfS10hz{elecIDm}{condIDm}, mtfWeight1, mtfS10hz, mtfWeight2);
					end

				end % elecIDf

			end % condIDf

		end % fileID

		% More or less copy pasted from analyze_data.m
		for elecID = 1:length(m.elecs)
			% Per each frequency in the merge
			for freqID = 1:length(m.targetFreqs)
				% All levels with the current frequency
				levelIDs = 1:length(m.targetLevels);
				condIDs  = (freqID-1)*length(m.targetLevels) + ...
					levelIDs + 1;    % +1 for nogo

				% Rate-level function (RLF)
				rlf = [m.meanFiring{elecID}{condIDs}];
				m.rlf{elecID}{freqID} = rlf;

				% Threshold based on RLF
				threshold = nan;
				for levelID = 1:length(m.targetLevels)
					if ~isnan(rlf(levelID)) && ...
							levelID+1<=length(m.targetLevels) && ...
							rlf(levelID)*1.2<rlf(levelID+1) % 20% increase
						threshold = m.targetLevels(levelID);
					end
				end
				m.threshold{elecID}{freqID} = threshold;

				% Nonmonotonic neurons based on RLF
				nonmonotonic = nan;
				for levelID = length(m.targetLevels):-1:1
					if ~isnan(rlf(levelID))
						nonmonotonic = rlf(levelID)<0.5*max(rlf);
					end
				end
				m.nonmonotonic{elecID}{freqID} = nonmonotonic;
			end % freqID
		end % elecID

		rmfield(m, 'files');
		merges{mergeID} = m;

	end % mergeID

	% remove empty merges
	merges(emptyMerges) = [];

	fprintf('Saving merged analysis to %s\n', mergedFile);
	save(mergedFile, 'merges', '-v7.3');
end

fprintf('Done\n');
if exist('notify'); notify('Completed "mergeAnalysis.m"'); end

catch err
	if exist('notify'); notify('Error in "mergeAnalysis.m"'); end
	rethrow(err);
end

function res = wmean(a1, w1, a2, w2)
% 	if any(isnan(a1) & isnan(a2))
% 		res = nan;
% 	elseif any(isnan(a1))
% 		res = a2;
% 	elseif any(isnan(a2))
% 		res = a1;
% 	else
		res = a1*w1 + a2*w2;
% 	end
end