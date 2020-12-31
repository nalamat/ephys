function units = analyzeUnits(units)
% Analyze detected spikes for each unit and calculate metrics such as PSTH,
% neurometric d', mean and max firing rate, vector strength, modulation
% transfer function, etc.
%
% In args:
%     units (cell array of structs):
%         spikeTimes (nested cell array): relative to tone onset in sec,
%             {conds x scores}{trials}(spike times)
%         lfp (nested cell array): RMS of LFP bands,
%             {conds x scores}(bands x pre/per/post x trials)

	if ~iscell(units)
		single = true;
		units = {units};
	else
		single = false;
	end

	for unitID = 1:length(units)
		u = units{unitID};   % unpack

		% few basic parameters for analysis
		u.psthBin        = 10e-3; % bin size for calculating PSTH
		% -1s before onset and +1s after offset of tone
		u.psthEdges      = u.viewBounds(1)-u.psthBin/2 : u.psthBin : ...
			u.viewBounds(2)+u.psthBin/2;
		u.psthCenters    = u.psthEdges(1:end-1)+u.psthBin/2;
		psthBinCount     = length(u.psthCenters);
		
		% running pearson's correlation between nogo and go
		u.psthCorrWindow = 200e-3;
		u.psthCorrTimes  = u.psthCenters( ... % center aligned windows
			u.viewBounds(1)+u.psthCorrWindow/2 <= u.psthCenters & ...
			u.psthCenters <= u.viewBounds(2)-u.psthCorrWindow/2);

		% convolution window for smoothing PSTH
		u.psthWin        = 50e-3;                         % window size
		u.psthWindow     = gausswin(u.psthWin/u.psthBin); % gaussian window
		u.psthWindow     = rectwin(u.psthWin/u.psthBin);  % rectangular window
		u.psthWindow     = u.psthWindow / u.psthWin;      % normalize window

		% designate different intervals related to the target
		u.i.gap = 50e-3;
		u.i.names = {'Pre', 'Onset', 'Peri', 'Offset', 'Post', ...
			'PrePoke', 'Poke', 'PeriHalf', 'PostHalf', ...
			'PreFull', 'PeriFull', 'PostFull'};
		u.i.bounds = [
			u.viewBounds(1)+u.i.gap*2  0
			0                          u.i.gap*2
			u.i.gap*2                  u.targetDuration-u.i.gap
			u.targetDuration-u.i.gap   u.targetDuration+u.i.gap
			u.targetDuration+u.i.gap   u.viewBounds(2)-u.i.gap*2
			
			-900e-3                    -400e-3
			-350e-3                    -50e-3
			u.i.gap*2                  u.i.gap*2+500e-3
			u.targetDuration+u.i.gap   u.targetDuration+u.i.gap+500e-3
			
			u.viewBounds(1)            0
			0                          u.targetDuration
			u.targetDuration           u.viewBounds(2);
			];
		u.i.count = length(u.i.names);
		u.i.masks = cell(1, u.i.count);
		for id = 1:u.i.count
			name = u.i.names{id};
			name(1) = lower(name(1));
			u.i.id.(name) = id;
			u.i.bound.(name) = u.i.bounds(id,:);
			mask = u.i.bounds(id,1) <= u.psthCenters & ...
				u.psthCenters < u.i.bounds(id,2);
			u.i.masks{id} = mask;
			u.i.mask.(name) = mask;
		end
		u.i.id.onsetPeriOffset = [u.i.id.onset u.i.id.peri u.i.id.offset];
		u.i.id.prePeriPost = [u.i.id.pre u.i.id.peri u.i.id.post];
		u.i.id.half = [u.i.id.prePoke u.i.id.poke ...
			u.i.id.periHalf u.i.id.postHalf];
		u.i.id.full = [u.i.id.preFull u.i.id.periFull u.i.id.postFull];

		% vector strength parameters
		u.vsFreqs    = 1:1:20;

		u.vs10Window     = 300e-3;
		u.vs10Times      = u.psthCenters( ... % center aligned windows
			u.viewBounds(1)+u.vs10Window/2 <= u.psthCenters & ...
			u.psthCenters <= u.viewBounds(2)-u.vs10Window/2);

		% multi-tapered spectrum parameters
		u.mtsParams.Fs       = u.fs;      % sampling frequency
		u.mtsParams.fpass    = [1 50];    % band of frequencies to be kept
		u.mtsParams.tapers   = [2 3];     % taper parameters
		u.mtsParams.pad      = 2;         % pad factor for FFT
		u.mtsParams.err      = [2 0.05];
		u.mtsParams.trialave = 1;
		[~, u.mtsFreqs]      = mtspectrumpt(rand(1,50), u.mtsParams);


% 		u.svmTimes       = 10e-3:10e-3:1;
% 		u.svmScores      = [];

		% clear everything, in case the unit has been already analyzed once
		c    = cell(u.condCount, 5); % {conds x scores}
		init = @(sz1, sz2)cellfun(@(c){nan(sz1, sz2)}, c);
		c1   = init(1, 1);
		ct   = init(1, length(u.psthCenters));
		cc   = init(1, length(u.psthCorrTimes));
		ci   = init(1, u.i.count);
		cv   = init(length(u.vsFreqs), u.i.count);
		cv2  = init(1, length(u.vs10Times));
		cm   = init(length(u.mtsFreqs), u.i.count);
		u.psth             = init(0, length(u.psthCenters));
		u.psthMean         = ct;
		u.psthSTD          = ct;
		u.psthCorrR        = cc;
		u.psthCorrP        = cc;
		u.dPrime           = ct;  % as a function of time (psth centers)
		u.dPrimeCQMean     = ct;  % cumulative quadratic mean versus time
		u.dPrimeCQSum      = ct;  % cumulative quadratic sum versus time
		u.dPrimeMQMean     = ct;  % moving quadratic mean versus time
		u.dPrimeIntervals  = ci;  % quadratic mean for: onset/peri/offset...
		u.lambda           = ci;
		u.mutualInfo       = ci;
		u.firingMean       = ci;
		u.firingMax        = ci;
		u.firingSTD        = ci;
		u.mfsl             = c1;  % minimum first spike latency
		u.mfslPhase        = c1;  % phase of MFSL relative to masker
		u.vs               = cv;  % vector strength for pre/peri/post stim
		u.vsPhase          = cv;  % phase
		u.vsPVal           = cv;  % p values
% 		u.vsZScore         = cv;
		u.vs10             = cv2; % running vector strength at 10 hz
		u.vs10Phase        = cv2; % phase of running vector strength at 10 hz
		u.vs10PVal         = cv2; % p values
		u.mts              = cm;
		if isfield(u, 'lfp')
			% {conds x scores}[bands x bins]
			cl   = init(u.lfpBandCount, 3);
			u.lfpMean          = cl;
			u.lfpSTD           = cl;
			u.lfpSEM           = cl;
		end

		c = cell(length(u.targetFreqs), 3);
		u.rlf              = c;
		u.threshold        = c;
		u.nonmonotonic     = c;

		% per all stimulus conditions
		for condID = 1:u.condCount

			% per each score: all(hit+miss+cr+fa), hit+cr, miss+fa, hit+fa, miss+cr
			for scoreID = 1:5

				% better method for calculating PSTH with STD of firing rate
				spikeTimes = u.spikeTimes{condID,scoreID};
				trials = length(spikeTimes);

				if trials == 0; continue; end

				psth = zeros(trials, psthBinCount);
				for trialID = 1:trials
					hist = histcounts(spikeTimes{trialID}, u.psthEdges);
					% this smoothing filter is non-causal and may cause the
					% neural response to spread backwards before an event
					psth(trialID, :) = conv(hist, u.psthWindow, 'same');
				end

				psthMean = mean(psth, 1);
				psthSTD = std(psth, 0, 1);

				u.psth{condID,scoreID} = psth;
				u.psthMean{condID,scoreID} = psthMean;
				u.psthSTD{condID,scoreID} = psthSTD;
				
				% running pearson's correlation
				if condID == 1 && scoreID == 1
					R = ones(size(u.psthCorrTimes));
					P = zeros(size(u.psthCorrTimes));
				else
					R = zeros(size(u.psthCorrTimes));
					P = ones(size(u.psthCorrTimes));
					for timeID = 1:length(u.psthCorrTimes)
						time = u.psthCorrTimes(timeID);
						% center aligned window
						win = time - u.psthCorrWindow/2 <= u.psthCenters & ...
							u.psthCenters < time + u.psthCorrWindow/2;
						[r, p] = corrcoef(u.psthMean{1,1}(win), psthMean(win));
						R(timeID) = r(1,2);
						P(timeID) = p(1,2);
					end
				end
				u.psthCorrR{condID,scoreID} = R;
				u.psthCorrP{condID,scoreID} = P;

				% calculate neurometric dprime for each PSTH bin in
				% reference to Nogo (both CR and FA)
% 				if ~any(isnan(u.psthMean{1,1}))
				if condID == 1 && scoreID == 1
					u.dPrime         {condID,scoreID} = zeros(size(u.psthCenters));
					u.dPrimeCQMean   {condID,scoreID} = zeros(size(u.psthCenters));
					u.dPrimeCQSum    {condID,scoreID} = zeros(size(u.psthCenters));
					u.dPrimeMQMean   {condID,scoreID} = zeros(size(u.psthCenters));
					u.dPrimeIntervals{condID,scoreID} = zeros(1, u.i.count);
					
				else
					dPrime = (psthMean - u.psthMean{1,1}) ./ ...
						((psthSTD + u.psthSTD{1,1}) / 2);
					dPrime(dPrime>4) = 4;
					dPrime(dPrime<-4) = -4;
					dPrime(isnan(dPrime)) = 0;
					u.dPrime{condID,scoreID} = dPrime;

					% cumulative quadratic mean of d'
					cqMean = sqrt(cumsum(dPrime.^2) ./ ...
						(1:length(dPrime)));
					pre = find(u.psthCenters < 0);
					cqMean = cqMean - cqMean(pre(end));
					u.dPrimeCQMean{condID,scoreID} = cqMean;

					% cumulative sum of squares
					cqSum = sqrt(cumsum(dPrime.^2));
					pre = find(u.psthCenters < 0);
					cqSum = cqSum - cqSum(pre(end));
					u.dPrimeCQSum{condID,scoreID} = cqSum;

					% quadratic mean of d' in 50ms bins
					mqMean = sqrt(movmean(dPrime.^2, 50e-3/u.psthBin));
					u.dPrimeMQMean{condID,scoreID} = mqMean;

					% quadratic mean for different intervals: pre/onset/peri ...
% 					u.dPrimeIntervals{condID,scoreID} = zeros(1, u.i.count);
					for interval = 1:u.i.count
						u.dPrimeIntervals{condID,scoreID}(interval) = ...
							sqrt(mean(dPrime(u.i.masks{interval}).^2));
					end

					% cumulative mean
		% 			cmean = [];
		% 			for t = -1:1
		% 				mask = t<=u.psthCenters & u.psthCenters<t+1;
		% 				cmean(mask) = cumsum(dprime(mask))./(1:sum(mask));
		% 				cmean(mask) = sqrt(cumsum(dprime(mask).^2)./(1:sum(mask)));
		% 			end
		% 			mask = -1<=u.psthCenters;
		% 			cmean(~mask) = 0;
		% 			cmean(mask) = cumsum(dprime(mask))./(1:sum(mask));
		% 			cmean(mask) = sqrt(cumsum(dprime(mask).^2)./(1:sum(mask)));
		% 			cmean(mask) = sqrt(cumsum(dprime(mask).^2));
				end
				
				
				for interval = 1:u.i.count
					mask = u.i.masks{interval};
					
					% mean and max firing rate
					u.firingMean{condID,scoreID}(interval) = mean(psthMean(mask));
					u.firingMax {condID,scoreID}(interval) = max (psthMean(mask));
					u.firingSTD {condID,scoreID}(interval) = std (psthMean(mask));
					
					% calculate the mean spiking rate "lambda"
					% flooring divides the rate appropriately to adjust for the
					% #samples in a window
					% isi: inter-spike-interval
					isi = cellfun(@(sp)diff( ...
						sp(0<sp & sp<u.targetDuration) ), ...
						spikeTimes, 'uniformoutput', false);
					isi = [isi{:}];
					lambda = floor(histogramFit(isi) / u.spikeDuration);
					u.lambda{condID,scoreID}(interval) = lambda;

					% calculate mutual information
					u.mutualInfo{condID,scoreID}(interval) = mutualInfo( ...
						lambda, u.lambda{1,1}(interval)); % vs nogo
				end

				% SVM classification
	% 			if condID~=1
	% 				for i = 1:length(u.svmTimes)
	% 					mask = 0<=u.psthCenters & u.psthCenters<=u.svmTimes(i);
	% 					x0 = u.psth{1}(:, mask);
	% 					x1 = u.psth{condID}(:, mask);
	% 					x = [x0; x1];
	% 					y = repelem([0, 1], [size(x0,1), size(x1,1)]);
	% 					mdl = fitcsvm(x, y);
	% 					[~, score] = predict(mdl, x);
	% 					u.svmScores{condID}(i) = score;
	% 				end
	% 			end

				% minimum first spike latency (MFSL) peri-stimulus
				% assume no two peaks within 2*psthBin
				[~,locs] = findpeaks(u.psthMean{condID,scoreID}(u.i.mask.periFull));
% 					'minpeakdistance',5);
				if ~isempty(locs)
					psthCentersPeri = u.psthCenters(u.i.mask.periFull);
					mfsl = psthCentersPeri(locs(1));
				else
					fprintf('[analyzeUnits] no MFSL found for unit %s, cond %d, score %d\n', ...
						u.label, condID, scoreID);
					mfsl = nan;
				end
				u.mfsl{condID,scoreID} = mfsl;

				% phase of MFSL relative to masker
				phase = mfsl * u.maskerFrequency * 360 + u.phaseDelay;
				u.mfslPhase{condID,scoreID} = phase;

				% vector strength and multi-taper spectrum pre/peri/post-stimulus
% 				spikeTimes = u.spikeTimes{condID,scoreID};
				spikeTimesAll = [u.spikeTimes{condID,scoreID}{:}];
				
				for interval = 1:u.i.count
					bounds = u.i.bounds(interval, :);

					spikeTimesInterval = spikeTimesAll( ...
						bounds(1)<=spikeTimesAll & spikeTimesAll<bounds(2));
					
					% vector strength for each base frequency
					for freqID = 1:length(u.vsFreqs)
						% calculate VS using spikes from all trials
						if isempty(spikeTimesInterval); continue; end
						
						X = spikeTimesInterval * u.vsFreqs(freqID);
						theta = (X-floor(X))*(2*pi);
						xl = cos(theta);
						yl = sin(theta);
						vs = sqrt((sum(xl).^2)+(sum(yl).^2)) / length(theta);
						c = xl + 1i.*yl;
% 							vs2 = abs(mean(c));
						theta2 = angle(mean(c));

						n = length(spikeTimesInterval);
						pval = rayleighsz(vs, n);

						u.vs{condID,scoreID}(freqID,interval) = vs;
						u.vsPhase{condID,scoreID}(freqID,interval) = theta2;
						u.vsPVal{condID,scoreID}(freqID,interval) = pval;
					end % freqID
	
					% multi-taper spectrum
					if length(spikeTimesInterval)>10
						mts = mtspectrumpt(spikeTimesInterval - ...
							min(spikeTimesInterval), u.mtsParams)';
						if length(mts) == length(u.mtsFreqs)
							u.mts{condID,scoreID}(:,interval) = mts;
						end
					end
					
				end % intervalID

				% running vector strength at 10Hz as a function of time
				vsFreq = 10;
				spikeTimes = u.spikeTimes{condID,scoreID};
				spikeTimesAll = [spikeTimes{:}];

				for timeID = 1:length(u.vs10Times)
					time = u.vs10Times(timeID);
					spikeTimesInterval = spikeTimesAll( ... % center aligned windows
						time - u.vs10Window/2 <= spikeTimesAll & ...
						spikeTimesAll < time + u.vs10Window/2);

					% calculate VS using spikes from all trials
					if ~isempty(spikeTimesInterval)
						n = length(spikeTimesInterval);
						X = spikeTimesInterval * vsFreq;
						theta = (X-floor(X))*(2*pi);
						xl = cos(theta);
						yl = sin(theta);
						vs = sqrt((sum(xl).^2)+(sum(yl).^2)) / n;
						c = xl + 1i.*yl;
% 						vs2 = abs(mean(c));
						theta2 = angle(mean(c));

						pval = rayleighsz(vs, n);

						u.vs10{condID,scoreID}(timeID) = vs;
						u.vs10Phase{condID,scoreID}(timeID) = theta2;
						u.vs10PVal{condID,scoreID}(timeID) = pval;
					end
					
				end % centerID

				% LFP
				% dimensions: {conds x scores}[bands x bins x trials]
				% bins are: pre/peri/post-stim
				if isfield(u, 'lfp')
					lfp = u.lfp{condID, scoreID};
					u.lfpMean{condID, scoreID} = mean(lfp, 3);
					u.lfpSTD{condID, scoreID} = std(lfp, 0, 3);
					u.lfpSEM{condID, scoreID} = sem(lfp, 3);
				end

			end % scoreID

		end % condID

		% per each frequency
		for freqID = 1:length(u.targetFreqs)
			% all levels with the current frequency
			levelID = 1:length(u.targetLevels);
			condID  = (freqID-1)*length(u.targetLevels) + levelID + 1;   % +1 for nogo

			for scoreID = 1:5
				% rate-level function (RLF) peri-stimulus
				rlf = [u.firingMean{condID,scoreID}];
				if length(rlf) ~= length(condID); continue; end
				u.rlf{freqID,scoreID} = rlf;

				% threshold based on RLF
				threshold = nan;
				for levelID = 1:length(u.targetLevels)
					if ~isnan(rlf(levelID)) && levelID+1<=length(u.targetLevels) && ...
							rlf(levelID)*1.2<rlf(levelID+1)   % 20% increase
						threshold = u.targetLevels(levelID);
					end
				end % levelID
				u.threshold{freqID,scoreID} = threshold;

				% nonmonotonic neurons based on RLF
				nonmonotonic = nan;
				for levelID = length(u.targetLevels):-1:1
					if ~isnan(rlf(levelID))
						nonmonotonic = rlf(levelID)<0.5*max(rlf);
					end
				end
				u.nonmonotonic{freqID,scoreID} = nonmonotonic;
			end % scoreID

		end % freqID

		units{unitID} = u; % pack

	end % unitID

	if single
		units = units{1};
	end

end % analyzeUnit
