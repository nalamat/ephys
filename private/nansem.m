function sem = nansem(x, dim)
	if nargin<2
		dim = 1;
	end
	sem = nanstd(x, 0, dim) ./ sqrt(sum(~isnan(x), dim));
end
