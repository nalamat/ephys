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
		u.psthCorrTimes  = u.psthCenters( ... % left aligned windows
			u.viewBounds(1)+u.psthCorrWindow <= u.psthCenters);

		% convolution window for smoothing PSTH
		u.psthWin = 50e-3;                         % convolution window size
% 		win       = gausswin(u.psthWin/u.psthBin); % gaussian window
		win       = rectwin(u.psthWin/u.psthBin);  % rectangular window
		win       = win / u.psthWin;               % normalize window

		% designate different intervals related to the target
		u.gap = 50e-3;
		u.onset = 0<=u.psthCenters & u.psthCenters<u.gap*2;
		u.peri = u.gap*2<=u.psthCenters & ...
			u.psthCenters<u.targetDuration-u.gap;
		u.offset = u.targetDuration-u.gap<=u.psthCenters & ...
			u.psthCenters<u.targetDuration+u.gap;
		u.periFull = 0<=u.psthCenters & u.psthCenters<u.targetDuration;
		u.intervalNames = {'Onset', 'Peri', 'Offset', 'PeriFull'};
		u.intervals = {u.onset, u.peri, u.offset, u.periFull};

		% vector strength parameters
		u.vsFreqs    = 1:1:20;
		u.vsBins     = [
			u.viewBounds(1)     , 0
			u.gap*2               , u.targetDuration-u.gap
			u.targetDuration+u.gap, u.viewBounds(2)
		];
		u.vsBinNames = {'Pre','Peri','Post'};

		u.vs10Window     = 300e-3;
		u.vs10Times      = u.psthCenters( ... % left aligned windows
			u.viewBounds(1)+u.vs10Window <= u.psthCenters);

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
		ci   = init(1, length(u.intervals));
		cv   = init(length(u.vsBins), length(u.vsFreqs));
		cv2  = init(1, length(u.vs10Times));
		cm   = init(length(u.vsBins), length(u.mtsFreqs));
		cl   = init(u.lfpBandCount, 3);
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
		u.lambda           = c1;
		u.mutualInfo       = c1;
		u.mfsl             = c1;  % minimum first spike latency
		u.mfslPhase        = c1;  % phase of MFSL relative to masker
		u.firingMax        = c1;
		u.firingMean       = c1;
		u.firingSTD        = c1;
		u.vs               = cv;  % vector strength for pre/peri/post stim
		u.vsPhase          = cv;  % phase
		u.vsPVal           = cv;  % p values
% 		u.vsZScore         = cv;
		u.vs10             = cv2; % running vector strength at 10 hz
		u.vs10Phase        = cv2; % phase of running vector strength at 10 hz
		u.vs10PVal         = cv2; % p values
		u.mts              = cm;
		% {conds x scores}[bands x bins]
		u.lfpMean          = cl;
		u.lfpSTD           = cl;
		u.lfpSEM           = cl;

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
					psth(trialID, :) = conv(hist, win, 'same');
				end

				psthMean = mean(psth, 1);
				psthSTD = std(psth, 0, 1);

				u.psth{condID,scoreID} = psth;
				u.psthMean{condID,scoreID} = psthMean;
				u.psthSTD{condID,scoreID} = psthSTD;
				
				% running pearson's correlation
				if condID ~= 1
					R = zeros(size(u.psthCorrTimes));
					P = ones(size(u.psthCorrTimes));
					for timeID = 1:length(u.psthCorrTimes)
						time = u.psthCorrTimes(timeID);
						% left aligned window
						msk = time - u.psthCorrWindow <= u.psthCenters & ...
							u.psthCenters <= time;
						nogo = u.psthMean{1,1}(msk);
						go = u.psthMean{condID,scoreID}(msk);
						[r, p] = corrcoef(nogo, go);
						R(timeID) = r(1,2);
						P(timeID) = p(1,2);
					end
					u.psthCorrR{condID,scoreID} = R;
					u.psthCorrP{condID,scoreID} = P;
				end

				% calculate neurometric dprime for each PSTH bin in
				% reference to Nogo (both CR and FA)
				if condID ~= 1 && ~any(isnan(u.psthMean{1,1}))
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
					u.dPrimeIntervals{condID,scoreID} = zeros(size(u.intervals));
					for intervalID = 1:length(u.intervals)
						u.dPrimeIntervals{condID,scoreID}(intervalID) = ...
							sqrt(mean(dPrime(u.intervals{intervalID}).^2));
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

				% cumulative psth
	% 			psthCum = zeros(trials, bins);
	% 			for binID = 1:bins
	% 				t = u.psthCenters(binID);
	% 				t0 = t - u.psthBin/2;
	% 				t1 = t + u.psthBin/2;
	% 				for trialID = 1:trials
	% 					spikes = u.spikeTimesPerTrial{condID,trialID};
	% 					psth(trialID, binID) = ...
	% 						sum(t0<=spikes & spikes<t1) / u.psthBin;
	% 					psthCum(trialID, binID) = ...
	% 						sum(0<=spikes & spikes<t) / t;
	% 				end
	% 			end
	% 			psthCumMean = mean(psthCum);
	% 			psthCumSTD = std(psthCum);
	% 			u.psthCumMean{condID} = psthCumMean;
	% 			u.psthCumSTD{condID} = psthCumSTD;
	% 			if condID==1
	% 				u.psthCumDPrime{condID} = zeros(1, bins);
	% 			else
	% 				dprime = (psthCumMean - u.psthCumMean{1}) ./ ...
	% 					((psthCumSTD + u.psthCumSTD{1}) / 2);
	% 				dprime(dprime>4) = 4;
	% 				dprime(dprime<-4) = -4;
	% 				dprime(isnan(dprime)) = 0;
	% 				u.psthCumDPrime{condID} = dprime;
	% 			end

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

	% 			% peri-stimulus response p-value compared to nogo
	% 			psthPeri = 0<=u.psthCenters & u.psthCenters<=u.targetDuration;
	% 			if condID==1 || u.trialCountPerCond(1)==0
	% 				u.pvalPeri{condID} = 1;
	% 			else
	% 				[~, u.pvalPeri{condID}] = ttest( ...
	% 					u.psth{1}(psthPeri), psthMean(psthPeri));
	% 			end

				% onset response z-score
	% 			vals = psthMean(u.psthCenters < 0);
	% 			val  = mean(psthMean(0<=u.psthCenters & u.psthCenters<50e-3));
	% 			z    = zscore([val, vals]);
	% 			u.zscoreOnset{condID} = z(1);

				% offset response z-score
	% 			vals = psthMean(50e-3<=u.psthCenters & ...
	% 				u.psthCenters<u.targetDuration);
	% 			val  = mean(psthMean(u.targetDuration<=u.psthCenters & ...
	% 				u.psthCenters<u.targetDuration+50e-3));
	% 			z    = zscore([val, vals]);
	% 			u.zscoreOffset{condID} = z(1);

				% calculate the mean spiking rate "lambda"
				% flooring divides the rate appropriately to adjust for the
				% #samples in a window
				% isi: inter-spike-interval
				isi = cellfun(@(sp)diff( ...
					sp(0<sp & sp<u.targetDuration) ), ...
					spikeTimes, 'uniformoutput', false);
				isi = [isi{:}];
				u.lambda{condID,scoreID} = floor(histogramFit(isi) / ...
					u.spikeDuration);

				% calculate mutual information
				if ~isnan(u.lambda{1,1})
					u.mutualInfo{condID,scoreID} = mutualInfo( ...
						u.lambda{condID,scoreID}, u.lambda{1,1}); % vs nogo
				end

				% minimum first spike latency (MFSL) peri-stimulus
				% assume no two peaks within 2*psthBin
				[~,locs] = findpeaks(u.psthMean{condID,scoreID}(u.periFull)); ...
% 					'minpeakdistance',5);
				if ~isempty(locs)
					psthCentersPeri = u.psthCenters(u.periFull);
					mfsl = psthCentersPeri(locs(1));
				else
					warning('[analyzeUnits] no MFSL found for unit %s, cond %d, score %d', u.label, condID, scoreID);
					mfsl = nan;
				end
				u.mfsl{condID,scoreID} = mfsl;

				% phase of MFSL relative to masker
				phase = mfsl * u.maskerFrequency * 360 + u.phaseDelay;
				u.mfslPhase{condID,scoreID} = phase;

				% maximum firing rate peri-stimulus
				u.firingMax {condID,scoreID} = ...
					max (u.psthMean{condID,scoreID}(u.periFull));
				u.firingMean{condID,scoreID} = ...
					mean(u.psthMean{condID,scoreID}(u.periFull));
				u.firingSTD {condID,scoreID} = ...
					std (u.psthMean{condID,scoreID}(u.periFull));

				% vector strength and multi-taper spectrum pre/peri/post-stimulus
% 				spikeTimes = u.spikeTimes{condID,scoreID};
				spikeTimesAll = [u.spikeTimes{condID,scoreID}{:}];
				
				for binID = 1:size(u.vsBins,1)
					bin = u.vsBins(binID,:);

					spikeTimesBin = spikeTimesAll( ...
						bin(1)<=spikeTimesAll & spikeTimesAll<bin(2));
					
					% vector strength for each base frequency
					for freqID = 1:length(u.vsFreqs)

						% calculate VS trial by trial
% 						vs = zeros(1,length(spikeTimes));
% 						for trialID = 1:length(spikeTimes)
% 							spikeTimesTrial = spikeTimes{trialID};
% 							spikeTimesBin = spikeTimesTrial( ...
% 								bin(1)<=spikeTimesTrial & ...
% 								spikeTimesTrial<bin(2));
% 							if isempty(spikeTimesBin)
% 								vs(trialID) = 0;
% 							else
% 								X = spikeTimesBin * ...
% 									u.vsFreqs(vsFreqID);
% 								theta = (X-floor(X))*(2*pi);
% 								xl = cos(theta);
% 								yl = sin(theta);
% 								vs(trialID) = ...
% 									sqrt((sum(xl).^2)+(sum(yl).^2)) / ...
% 									length(theta);
% 							end
% 						end
% 						vs = mean(vs);

						% calculate VS using spikes from all trials
						if ~isempty(spikeTimesBin)
							X = spikeTimesBin * u.vsFreqs(freqID);
							theta = (X-floor(X))*(2*pi);
							xl = cos(theta);
							yl = sin(theta);
							vs = sqrt((sum(xl).^2)+(sum(yl).^2)) / ...
								length(theta);
							c = xl + 1i.*yl;
% 							vs2 = abs(mean(c));
							theta2 = angle(mean(c));

							n = length(spikeTimesBin);
							pval = rayleighsz(vs, n);

							u.vs{condID,scoreID}(binID,freqID) = vs;
							u.vsPhase{condID,scoreID}(binID,freqID) = theta2;
							u.vsPVal{condID,scoreID}(binID,freqID) = pval;
						end
						
					end % freqID

					% masker response z-score across all base frequencies
	% 				z = zscore([u.vs{condID,scoreID}{binID,:}]);
	% 				u.vsZScore{condID,scoreID}{binID,:} = num2cell(z);
	
					% multi-taper spectrum
					if length(spikeTimesBin)>10
						mts = mtspectrumpt(spikeTimesBin - min(spikeTimesBin), ...
							u.mtsParams)';
						if length(mts) == length(u.mtsFreqs)
							u.mts{condID,scoreID}(binID,:) = mts;
						end
					end
					
				end % binID

				% running vector strength at 10Hz as a function of time
				vsFreq = 10;
				spikeTimes = u.spikeTimes{condID,scoreID};
				spikeTimesAll = [spikeTimes{:}];

				for timeID = 1:length(u.vs10Times)
					time = u.vs10Times(timeID);
					spikeTimesBin = spikeTimesAll( ... % left aligned windows
						time-u.vs10Window<=spikeTimesAll & spikeTimesAll<=time);

					% calculate VS using spikes from all trials
					if ~isempty(spikeTimesBin)
						n = length(spikeTimesBin);
						X = spikeTimesBin * vsFreq;
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
				lfp = u.lfp{condID, scoreID};
				u.lfpMean{condID, scoreID} = mean(lfp, 3);
				u.lfpSTD{condID, scoreID} = std(lfp, 0, 3);
				u.lfpSEM{condID, scoreID} = sem(lfp, 3);

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
