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
		u.gap = 50e-3;
		binCount = length(u.psthCenters);
		onset = 0<=u.psthCenters & u.psthCenters<u.gap;
		peri = 0<=u.psthCenters & u.psthCenters<u.targetDuration;
		periNoOnsetOffset = u.gap<=u.psthCenters & ...
			u.psthCenters<u.targetDuration-u.gap;
		offset = u.targetDuration-u.gap<=u.psthCenters & ...
			u.psthCenters<u.targetDuration+u.gap;
		
		% convolution window for smoothing PSTH
		u.psthWin        = 50e-3;            % convolution window size
% 		win = gausswin(u.psthWin/u.psthBin); % gaussian window
		win = rectwin(u.psthWin/u.psthBin);  % rectangular window
		win = win / u.psthWin;               % normalize window
		
		% Skip the first 10 ms after tone onset/offset
		u.baseFreqs      = 1:1:20;
		u.vectorBins     = [u.viewBounds(1), 0;
							u.gap, u.targetDuration-u.gap;
							u.targetDuration, u.viewBounds(2)];
		u.vectorBinNames = {'Pre','Peri','Post'};

% 		u.svmTimes       = 10e-3:10e-3:1;
% 		u.svmScores      = [];

		% clear everything, in case the unit has been already analyzed once
		c = cell(u.condCount, 5); % {conds x scores}
		u.psth             = c;
		u.psthMean         = c;
		u.psthSTD          = c;
		u.dPrime           = c;
		u.dPrimeCQMean     = c;
		u.dPrimeCQSum      = c;
		u.dPrimeMQMean     = c;
		u.dPrimeOnset      = c;
		u.dPrimePeri       = c;
		u.dPrimeOffset     = c;
	% 	u.psthCum          = [];
	% 	u.psthCumMean      = [];
	% 	u.psthCumSTD       = [];
	% 	u.psthCumDPrime    = [];
	% 	u.pvalPeri         = [];
	% 	u.zscoreOnset      = [];
	% 	u.zscoreOffset     = [];
		u.lambda           = c;
		u.mutualInfo       = c;
		u.mfsl             = c; % minimum first spike latency
		u.maxFiring        = c;
		u.meanFiring       = c;
		u.stdFiring        = c;
		u.vectorStrength   = c;
		u.vectorPhase      = c;
		u.vectorPVal       = c;
	% 	u.vectorZScore     = c;
		u.mtfF             = c;
		u.mtfS             = c;
		% {conds x scores}[bands x bins]
		u.lfpMean          = c;
		u.lfpSTD           = c;
		u.lfpSEM           = c;

		c = cell(length(u.targetFreqs), 3);
		u.rlf              = c;
		u.threshold        = c;
		u.nonmonotonic     = c;

		% per all stimulus conditions
		for condID = 1:u.condCount

			% calculate peri-stimulus time histograms (PSTH)
	% 		spikeTimes = u.spikeTimes{condID};
	% 		psthMean = histcounts(spikeTimes, u.psthEdges);
	% 		% average spikes per second
	% 		psthMean = psthMean / u.trialCountPerCond(condID) / u.psthBin;
	% 		u.psthMean{condID} = psthMean;

			for scoreID = 1:5
				% better method for calculating PSTH with STD of firing rate
				spikeTimes = u.spikeTimes{condID,scoreID};
				trials = length(spikeTimes);

				if trials == 0; continue; end
				
				psth = zeros(trials, binCount);
				for trialID = 1:trials
					hist = histcounts(spikeTimes{trialID}, u.psthEdges);
					psth(trialID, :) = conv(hist, win, 'same');
				end

				psthMean = mean(psth, 1);
				psthSTD = std(psth, 0, 1);

				u.psth{condID,scoreID} = psth;
				u.psthMean{condID,scoreID} = psthMean;
				u.psthSTD{condID,scoreID} = psthSTD;
				

				% calculate neurometric dprime for each PSTH bin in reference
				% to Nogo (both CR and FA)
				if condID==1
					u.dPrime{condID,scoreID} = zeros(1, binCount);
					u.dPrimeCQMean{condID,scoreID} = zeros(1, binCount);
					u.dPrimeCQSum{condID,scoreID} = zeros(1, binCount);
					u.dPrimeMQMean{condID,scoreID} = zeros(1, binCount);
				elseif ~isempty(u.psthMean{1,1})
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

					% use all scores
					u.dPrimeOnset{condID,scoreID}  = ...
						sqrt(sum(dPrime(onset).^2) / sum(onset));
					u.dPrimePeri{condID,scoreID} = ...
						sqrt(sum(dPrime(peri).^2) / sum(peri));
					u.dPrimeOffset{condID,scoreID} = ...
						sqrt(sum(dPrime(offset).^2) / sum(offset));

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
				if ~isempty(u.lambda{1,1})
					u.mutualInfo{condID,scoreID} = mutualInfo( ...
						u.lambda{condID,scoreID}, u.lambda{1,1}); % vs nogo
				end

				% minimum first spike latency (MFSL) peri-stimulus
				% assume no two peaks within 2*psthBin
				[~,locs] = findpeaks(u.psthMean{condID,scoreID}(peri)); ...
% 					'minpeakdistance',5);
				if ~isempty(locs)
					psthCentersPeri = u.psthCenters(peri);
					mfsl = psthCentersPeri(locs(1));
				else
					warning('[analyzeUnits] no MFSL found for unit %s, cond %d, score %d', u.label, condID, scoreID);
					mfsl = nan;
				end
				u.mfsl{condID,scoreID} = mfsl;

				% maximum firing rate peri-stimulus
				u.maxFiring {condID,scoreID} = ...
					max (u.psthMean{condID,scoreID}(peri));
				u.meanFiring{condID,scoreID} = ...
					mean(u.psthMean{condID,scoreID}(peri));
				u.stdFiring {condID,scoreID} = ...
					std (u.psthMean{condID,scoreID}(peri));

				% vector strength pre/peri/post-stimulus
% 				spikeTimes = [u.spikeTimes{condID,scoreID}{:}];
				spikeTimes = u.spikeTimes{condID,scoreID};
				spikeTimesAll = [spikeTimes{:}];
				for binID = 1:size(u.vectorBins,1)
					bin = u.vectorBins(binID,:);
					for baseFreqID = 1:length(u.baseFreqs)
						
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
% 									u.baseFreqs(baseFreqID);
% 								theta = (X-floor(X))*(2*pi);
% 								xl = cos(theta);
% 								yl = sin(theta);
% 								vs(trialID) = ...
% 									sqrt((sum(xl).^2)+(sum(yl).^2)) / ...
% 									length(theta);
% 							end
% 						end
% 						vs = mean(vs);
						
						spikeTimesBin = spikeTimesAll( ...
							bin(1)<=spikeTimesAll & ...
							spikeTimesAll<bin(2));
						
						% calculate VS using spikes from all trials
						if isempty(spikeTimesBin)
							vs = 0;
							theta2 = 0;
						else
							X = spikeTimesBin * u.baseFreqs(baseFreqID);
							theta = (X-floor(X))*(2*pi);
							xl = cos(theta);
							yl = sin(theta);
							vs = sqrt((sum(xl).^2)+(sum(yl).^2)) / ...
								length(theta);
							c = xl + 1i.*yl;
% 							vs2 = abs(mean(c));
							theta2 = angle(mean(c));
						end
						
						n = length(spikeTimesBin);
						pval = rayleighsz(vs, n);

						u.vectorStrength{condID,scoreID} ... 
							{binID,baseFreqID} = vs;
						u.vectorPhase{condID,scoreID} ...
							{binID,baseFreqID} = theta2;
						u.vectorPVal{condID,scoreID} ...
							{binID,baseFreqID} = pval;
					end

					% masker response z-score across all base frequencies
	% 				z = zscore([u.vectorStrength{condID,scoreID}{binID,:}]);
	% 				u.vectorZScore{condID,scoreID}{binID,:} = num2cell(z);
				end

				% power at the modulation frequency peri-stimulus
				spikeTimesPeri = spikeTimesAll( ...
					u.vectorBins(2,1)<=spikeTimesAll & ...
					spikeTimesAll<u.vectorBins(2,2));
				if length(spikeTimesPeri)>6
					mtfParams.Fs = u.fs;      % sampling frequency
					mtfParams.fpass = [5 50]; % band of frequencies to be kept
					mtfParams.tapers = [3 5]; % taper parameters
					mtfParams.pad = 2;        % pad factor for FFT
					mtfParams.err = [2 0.05];
					mtfParams.trialave = 1;
					data = spikeTimesPeri;
					[mtfS,mtfF] = mtspectrumpt(data, mtfParams);
					% figure; plot(mtfF,10*log10(mtfS));
				else
					mtfF = [];
					mtfS = [];
				end
				u.mtfF{condID,scoreID} = mtfF;
				u.mtfS{condID,scoreID} = mtfS;
				
				
				
				% LFP
				% dimensions: {conds x scores}[bands x bins x trials]
				% bins are: pre/peri/post-stim
				lfp = u.lfp{condID, scoreID};
				u.lfpMean{condID, scoreID} = mean(lfp, 3);
				u.lfpSTD{condID, scoreID} = std(lfp, [], 3);
				u.lfpSEM{condID, scoreID} = u.lfpSTD{condID, scoreID} ...
					/ sqrt(size(lfp, 3));
				
			end % scoreID

		end % condID

		% per each frequency
		for freqID = 1:length(u.targetFreqs)
			% all levels with the current frequency
			levelID = 1:length(u.targetLevels);
			condID  = (freqID-1)*length(u.targetLevels) + ...
				levelID + 1;    % +1 for nogo

			for scoreID = 1:5
				% rate-level function (RLF) peri-stimulus
				rlf = [u.meanFiring{condID,scoreID}];
				if length(rlf) ~= length(condID); continue; end
				u.rlf{freqID,scoreID} = rlf;

				% threshold based on RLF
				threshold = nan;
				for levelID = 1:length(u.targetLevels)
					if ~isnan(rlf(levelID)) && ...
							levelID+1<=length(u.targetLevels) && ...
							rlf(levelID)*1.2<rlf(levelID+1) % 20% increase
						threshold = u.targetLevels(levelID);
					end
				end
				u.threshold{freqID,scoreID} = threshold;

				% nonmonotonic neurons based on RLF
				nonmonotonic = nan;
				for levelID = length(u.targetLevels):-1:1
					if ~isnan(rlf(levelID))
						nonmonotonic = rlf(levelID)<0.5*max(rlf);
					end
				end
				u.nonmonotonic{freqID,scoreID} = nonmonotonic;
			end % unitID

		end % freqID
		
		units{unitID} = u; % pack
		
	end % unitID
	
	if single
		units = units{1};
	end

end % analyzeUnit
