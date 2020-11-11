% remove lfp from root level of all analysis files
% (it was moved to analysis struct of individual sessions)

dataPaths = {
	'../../Data' 'CMR02Head'
	'../../Data' 'CMR02Left'
	'../../Data' 'CMR05Left'
	'../../Data' 'CMR05Head'
	'../../Data' 'CMR05Fluffy'
	'../../Data' 'CMR05Tail'
	'../../Data' 'CMR06Right'
	'../../Data' 'CMR06Left'
	'../../Data-Booth1-EARS' 'CMR08Head'
	'../../Data-Booth1-EARS' 'D1Tail'
	'../../Data-Booth1-EARS' 'CMR08Tail'
	'../../Data-Booth1-EARS' 'CMR08Fluffy'
	'../../Data-Booth1-EARS' 'D2Tail'
	'../../Data-Booth1-EARS' 'D2Right'
	};

for i = 1:size(dataPaths,1)
	dataPath = dataPaths{i,1};
	animal = dataPaths{i,2};
		
	files = ls(sprintf('%s/%s/%s-*-Unsorted.mat', dataPath, animal, ...
		animal));
	if isempty(files); continue; end
	files = cellstr(files);

	for k = 1:length(files)
		file = files{k};
		file = sprintf('%s/%s/%s', dataPath, animal, file);

		fprintf('Fixing %s\n', file);

		data = load(file);
		if isfield(data, 'lfps')
			data = rmfield(data, 'lfps');
			save(file, '-struct', 'data');
		end
	end
end

disp('Done');