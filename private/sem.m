function sem = sem(x, dim)
	if nargin<2
		dim = 1;
	end
	sem = std(x, 0, dim) ./ sqrt(size(x, dim));
end
