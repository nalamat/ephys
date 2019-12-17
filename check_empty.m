for i = 1:length(files)
% 	f = files{i};
% 	a = whos('f');
% 	b = a.bytes;
% 	fprintf('%3d : %9d\n', i, b);
	if ~isfield(files{i}, 'psth')
		fprintf('%d\n', i);
	end
end