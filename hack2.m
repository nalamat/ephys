% change older version analysis files from: *-Multi.mat and *-Single.mat
% to the newer format: *-Unsorted.mat and *-SortedJoint.mat

dataPaths = {
	'../Data' 'CMR02Head'
	'../Data' 'CMR02Left'
	'../Data' 'CMR05Left'
	'../Data' 'CMR05Head'
	'../Data-Booth1-EARS' 'CMR05Fluffy'
	'../Data-Booth1-EARS' 'CMR05Tail'
	};
spikeConfigs = {
	'Multi' 'Unsorted'
	'Single' 'SortedJoint'
	};

for i = 1:size(dataPaths,1)
	dataPath = dataPaths{i,1};
	animal = dataPaths{i,2};
	
	for j = 1:size(spikeConfigs,1)
		unitType = spikeConfigs{j,1};
		spikeConfig = spikeConfigs{j,2};
		
		files = ls(sprintf('%s/%s/%s-*-%s.mat', dataPath, animal, ...
			animal, unitType));
		if isempty(files); continue; end
		files = cellstr(files);
		
		for k = 1:length(files)
			file = files{k};
			file = sprintf('%s/%s/%s', dataPath, animal, file);
			
			fprintf('Fixing %s\n', file);
			
			save(file, 'spikeConfig', '-append');
			file2 = strrep(file, [unitType '.mat'], [spikeConfig '.mat']);
			movefile(file, file2, 'f');
		end
	end
end

disp('Done');