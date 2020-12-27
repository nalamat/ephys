%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Poisson Fit %
% This function calculates and returns the mean spiking rate "lambda" by fitting the data to a poisson distribution

function lambda = histogramFit(int_arr_time)

% 	load int_arr_time_go;
	h = int_arr_time;
% 	for i = 1:size(int_arr_time,2)
% 		if ~isempty(int_arr_time{i})
% 			h = [h, int_arr_time{i}];
% 		end
% 	end

	if ~isempty(h)
		pd = fitdist(h', 'Exponential');
		x = [1:max(h)];
		e = exppdf(x , pd.mu);
		lambda = pd.mu;
	else
		lambda = 0;
	end
% 	figure, histogram(h , 'Normalization' , 'pdf');
% 	hold on; plot(e, 'LineWidth',2);

end %histogram_fit()