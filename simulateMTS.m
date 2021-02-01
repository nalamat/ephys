function simulateMTS()
% 	% each data point here is like MTS of a single trial
% 	data = randn(500,1) * 5 + 10; % mu = 10, sigma = 5
% 
% 	disp('Actual STD:')
% 	disp(std(data))
% 
% 	iter = 100;          % number of iteration
% 	n = length(data)/2;  % sample size
% 	res = nan(iter,1);
% 	for i = 1:iter
% 		% sample trials
% 		sample = datasample(data, n);
% 		% this is like calculating MTS of all sampled trials combined
% 		res(i) = mean(sample);
% 	end
% 
% 	disp('Simulated STD:')
% 	disp(std(res) * sqrt(n))

	mtsParams.Fs       = 31250;     % sampling frequency
	mtsParams.fpass    = [1 50];    % band of frequencies to be kept
	mtsParams.tapers   = [2 3];     % taper parameters
	mtsParams.pad      = 2;         % pad factor for FFT
	mtsParams.err      = [2 0.05];
	mtsParams.trialave = 1;
	[~, mtsFreqs]      = mtspectrumpt(rand(1,50), mtsParams);
% 	mtsFreqs10         = 9.5<=mtsFreqs & mtsFreqs<=10.5;
	
	rng(1);
	trials = 30;
	data = genSpikes(trials);
	
	mtsCombined = mtspectrumpt([data{:}], mtsParams) / trials;
	mtsCombined = 10*log10(mtsCombined);

	mts = nan(trials, length(mtsFreqs));
	for i = 1:trials
		mts(i,:) = mtspectrumpt(data{i}, mtsParams);
	end

	mts = 10*log10(mts);
	mtsMean = mean(mts, 1);
	mtsSTD  = std(mts, 1);

	reps = 10;
	n = ceil(trials/2);
	mtsSample = nan(reps, length(mtsFreqs));
	for i = 1:reps
		sample = datasample(data, n, 1);
		mtsSample(i,:) = mtspectrumpt([sample{:}], mtsParams) / n;
	end

	mtsSample = 10*log10(mtsSample);
	mtsSampleMean = mean(mtsSample, 1);
	mtsSampleSTD = std(mtsSample, 1);

	clf;
	cols = {
		[0, 0.4470, 0.7410]
		[0.8500, 0.3250, 0.0980]
		[0.9290, 0.6940, 0.1250]
		};
	p1 = plot(mtsFreqs, mtsCombined, 'linewidth', 2, 'color', cols{1});
	hold on;
	
	p2 = plot(mtsFreqs, mtsMean, 'linewidth', 2, 'color', cols{2});
	p = patch([mtsFreqs flip(mtsFreqs)], ...
		[mtsMean+mtsSTD flip(mtsMean-mtsSTD)], ...
		cols{2}, 'edgecolor', 'none');
	alpha(p, .3);
	
	p3 = plot(mtsFreqs, mtsSampleMean, 'linewidth', 2, 'color', cols{3});
	p = patch([mtsFreqs flip(mtsFreqs)], ...
		[mtsSampleMean+mtsSampleSTD flip(mtsSampleMean-mtsSampleSTD)], ...
		cols{3}, 'edgecolor', 'none');
	alpha(p, .3);
	
	legend([p1, p2, p3], {'Combined', 'Actual', 'Bootstrap'}, ...
		'location', 'best');
end


function spikes = genSingleUnit()
	spikes = 0;
	while all(spikes<1)
		new = poissrnd(100, 1, 10);
		new = cumsum(new) * 1e-3 + max(spikes);
		spikes = [spikes new];
	end
	spikes = spikes(0<spikes & spikes<1);
end


function spikes = genMultiUnit()
	spikes = [];
	for i = 1:3
		spikes = [spikes genSingleUnit()];
	end
end

function spikes = genSpikes(trials)
	spikes = cell(trials,1);
	for i = 1:trials
		spikes{i} = genMultiUnit();
	end
end
