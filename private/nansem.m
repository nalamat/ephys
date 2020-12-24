function sem = nansem(x, dim)
% Calculate standard error of the mean omiting nans
% If dim is not given, defaults to first dimension that it's not of size 1
	if nargin<2
		dim = find(size(x) ~= 1, 1);
    if isempty(dim)
        dim = 1;
    end
	end
	sem = nanstd(x, 0, dim) ./ sqrt(sum(~isnan(x), dim));
end
