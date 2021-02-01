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
%
% Notes: each unit has two structs, `i` and `t`.
% `i` stands for interval, and contains parameters and metrics pertaining
% to each time interval defined based on particular events such as nose
% poke, tone onset, offset, etc.
% `t` stands for trial, and contains metrics calculated per trial (PSTH),
% and possibly also per interval (VS or MTS).

	if ~iscell(units)
		single = true;
		units = {units};
	else
		single = false;
	end

	parfor unitID = 1:length(units)
		u = units{unitID};   % unpack

		% few basic parameters for analysis
		u.psthBin        = 10e-3; % bin size for calculating PSTH
		% -1s before onset and +1s after offset of tone
		u.psthCenters    = u.viewBounds(1) : u.psthBin : u.viewBounds(2);
		u.psthEdges      = u.viewBounds(1)-u.psthBin/2 : u.psthBin : ...
			u.viewBounds(2)+u.psthBin/2;
		
		u.rateDPBin      = u.psthBin;
		u.rateDPTimes    = 0 : u.rateDPBin : u.viewBounds(2);
		
		% running pearson's correlation between nogo and go
		u.corrWindow = 300e-3;
		u.corrTimes  = u.psthCenters( ... % center aligned windows
			u.viewBounds(1)+u.corrWindow/2 <= u.psthCenters & ...
			u.psthCenters <= u.viewBounds(2)-u.corrWindow/2);

		% convolution window for smoothing PSTH
		u.psthWin        = 50e-3;                         % window size
		u.psthWindow     = gausswin(u.psthWin/u.psthBin); % gaussian window
		u.psthWindow     = rectwin(u.psthWin/u.psthBin);  % rectangular window
		u.psthWindow     = u.psthWindow / u.psthWin;      % normalize window

		% designate different intervals related to the target
		% all metrics calculated for these intervals will also be assigned
		% to the same struct: u.i
		u.i.gap = 50e-3;
		u.i.names = {'Pre', 'Onset', 'Peri', 'Offset', 'Post', ...
			'Pre200', 'Poke200', 'Onset200' 'Peri200', 'Offset200', 'Post200',...
			'Pre300', 'Poke300', 'Onset300' 'Peri300', 'Offset300', 'Post300',...
			'PreFull', 'PeriFull', 'PostFull'};
		u.i.bounds = [
			% pre/onset/peri/offset/post (all + during)
			u.viewBounds(1)+u.i.gap*2  -u.i.gap
			0                          u.i.gap*2
			u.i.gap*2                  u.targetDuration-u.i.gap
			u.targetDuration-u.i.gap   u.targetDuration+u.i.gap
			u.targetDuration+u.i.gap   u.viewBounds(2)-u.i.gap*2
			
			% all 200
			-700e-3                    -500e-3
			-350e-3                    -150e-3
			0                          200e-3
			500e-3                     700e-3
			u.targetDuration-50e-3     u.targetDuration+150e-3
			u.targetDuration+500e-3    u.targetDuration+700e-3
			
			% all 300
			-800e-3                    -500e-3
			-350e-3                    -50e-3
			0                          300e-3
			500e-3                     800e-3
			u.targetDuration-50e-3     u.targetDuration+250e-3
			u.targetDuration+500e-3    u.targetDuration+800e-3
			
			% full
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
		u.i.id.during = [u.i.id.onset u.i.id.peri u.i.id.offset];
		u.i.id.all    = [u.i.id.pre u.i.id.peri u.i.id.post];
		u.i.id.all200 = [u.i.id.pre200 u.i.id.poke200 u.i.id.onset200 ...
			u.i.id.peri200 u.i.id.offset200 u.i.id.post200];
		u.i.id.all300 = [u.i.id.pre300 u.i.id.poke300 u.i.id.onset300 ...
			u.i.id.peri300 u.i.id.offset300 u.i.id.post300];
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
		u.mtsFreqs10         = 9.5<=u.mtsFreqs & u.mtsFreqs<=10.5;

% 		u.svmTimes       = 10e-3:10e-3:1;
% 		u.svmScores      = [];

		% initialize and preallocate all metrics with NaNs
		c     = cell(u.condCount, 5); % {conds x scores}
		initt = @(sz1, sz2)cellfun(@(c, sp){nan(length(sp), sz1, sz2)}, ...
			c, u.spikeTimes);      % per trial
		init  = @(sz1, sz2)cellfun(@(c){nan(sz1, sz2)}, c);
		c1    = init(1, 1);
		cpt   = initt(length(u.psthCenters), 1);
		ct    = init(1, length(u.psthCenters));
		cdp   = init(1, length(u.rateDPTimes));
		cc    = init(1, length(u.corrTimes));
		cit   = initt(u.i.count, 1);
		ci    = init(1, u.i.count);
		cii   = init(u.i.count, u.i.count);
		cv    = init(length(u.vsFreqs), u.i.count);
		cv2   = init(1, length(u.vs10Times));
		cmt   = initt(length(u.mtsFreqs), u.i.count);
		cm    = init(length(u.mtsFreqs), u.i.count);
		u.t.psth         = cpt; % firing versus time per trial
		u.psth           = ct;  % average firing rate versus time
		u.psthSTD        = ct;  % standard deviation of firing versus time
		u.corrR          = cc;  % running correlation ref. nogo vs. time
		u.corrP          = cc;  % p-value of correlation versus time
		u.autocorrR      = cc;  % running auto-correlation ref. pre300 vs. time
		u.autocorrP      = cc;  % p-value of correlation versus time
		u.i.corrR        = ci;  % correlation ref. nogo per interval
		u.i.corrP        = ci;  % p-value of correlation per interval
		u.i.autocorrR    = cii; % auto-correlation between all interval pairs
		u.i.autocorrP    = cii; % p-value of autocorrelation
		u.corrDP         = c1;  % decorrelation d' between poke and onset
		u.rateDP         = cdp; % neurometric rate d' as a function of time
		u.i.rateDP       = ci;  % neurometric rate d' per interval
		u.i.lambda       = ci;  % est. lambda of poisson process per interval
		u.i.mutualInfo   = ci;  % mutual info relative to nogo per interval
		u.i.frMean       = ci;  % average firing rate per interval
		u.i.frMax        = ci;  % maximum firing rate per interval
		u.i.frSTD        = ci;  % standard deviation of firing per interval
		u.mfsl           = c1;  % minimum first spike latency
		u.mfslPhase      = c1;  % phase of MFSL relative to masker
		u.i.vs           = cv;  % vector strength: base frequency x interval
		u.i.vsPhase      = cv;  % phase of VS: base frequency x interval
		u.i.vsPVal       = cv;  % p-value of VS: base frequency x interval
		u.i.vs10         = ci;  % VS @ 10hz per interval
		u.i.vs10Phase    = ci;  % phase of VS @ 10hz per interval
		u.i.vs10PVal     = ci;  % p-value of VS @ 10hz per interval
		u.vs10           = cv2; % running vector strength @ 10hz versus time
		u.vs10Phase      = cv2; % phase of running VS @ 10hz versus time
		u.vs10PVal       = cv2; % p values of running VS at 10hz versus time
		u.i.mts          = cm;  % multi-taper spectrum: freq x interval
		u.i.mtsSTD       = cm;  % standard deviation of mts: freq x interval
		u.i.mts10        = ci;  % mts @ 10hz: interval
		u.i.mts10STD     = ci;  % standard deviation of mts @ 10hz: interval
		u.i.mts10DP      = ci;  % d' of mts @ 10hz: interval
		if isfield(u, 'lfp')
			% {conds x scores}[bands x bins]
			cl = init(u.lfpBandCount, 3);
			u.lfpMean      = cl;
			u.lfpSTD       = cl;
			u.lfpSEM       = cl;
		end

		c = cell(length(u.targetFreqs), 3);
		u.rlf            = c;
		u.threshold      = c;
		u.nonmonotonic   = c;

		% per all stimulus conditions
		for condID = 1:u.condCount

			% per each score: all(hit+miss+cr+fa), hit+cr, miss+fa, hit+fa, miss+cr
			for scoreID = 1:5

				% better method for calculating PSTH with STD of firing rate
				spikeTimes = u.spikeTimes{condID,scoreID};
				trials = length(spikeTimes);

				if trials == 0; continue; end

				tpsth = zeros(trials, length(u.psthCenters)); % per trial
				for trialID = 1:trials
					hist = histcounts(spikeTimes{trialID}, u.psthEdges);
					% this smoothing filter is non-causal and may cause the
					% neural response to spread backwards before an event
					tpsth(trialID, :) = conv(hist, u.psthWindow, 'same');
				end

				psth    = mean(tpsth, 1);
				psthSTD = std(tpsth, 0, 1);

				u.t.psth{condID,scoreID}  = tpsth;
				u.psth{condID,scoreID}    = psth;
				u.psthSTD{condID,scoreID} = psthSTD;
				
				% running pearson's correlation between go and nogo versus time
				if condID == 1 && scoreID == 1
					R = ones(size(u.corrTimes));
					P = zeros(size(u.corrTimes));
				else
					R = zeros(size(u.corrTimes));
					P = ones(size(u.corrTimes));
					for timeID = 1:length(u.corrTimes)
						time = u.corrTimes(timeID);
						% center aligned window
						win = time - u.corrWindow/2 <= u.psthCenters & ...
							u.psthCenters < time + u.corrWindow/2;
						[r, p] = corrcoef(u.psth{1,1}(win), psth(win));
						R(timeID) = r(1,2);
						P(timeID) = p(1,2);
					end
				end
				u.corrR{condID,scoreID} = R;
				u.corrP{condID,scoreID} = P;
				
				% running auto-correlation in reference to pre300 versus time
				psthPre300 = psth(u.i.mask.pre300);
				for timeID = 1:length(u.corrTimes)
					% center aligned window
					win = timeID:timeID+length(psthPre300)-1;
					[r, p] = corrcoef(psthPre300, psth(win));
					u.autocorrR{condID,scoreID}(timeID) = r(1,2);
					u.autocorrP{condID,scoreID}(timeID) = p(1,2);
				end
				u.corrR{condID,scoreID} = R;
				u.corrP{condID,scoreID} = P;
				
				% pearson's correlation between go and nogo per interval
				if condID == 1 && scoreID == 1
					R = ones(size(u.i.names));
					P = zeros(size(u.i.names));
				else
					R = zeros(size(u.i.names));
					P = ones(size(u.i.names));
					for intervalID = 1:u.i.count
						mask = u.i.masks{intervalID};
						[r, p] = corrcoef(u.psth{1,1}(mask), psth(mask));
						R(intervalID) = r(1,2);
						P(intervalID) = p(1,2);
					end
				end
				u.i.corrR{condID,scoreID} = R;
				u.i.corrP{condID,scoreID} = P;
				
				% auto-correlation per all interval pairs (if same length)
				for intervalID1 = 1:u.i.count
					mask1 = u.i.masks{intervalID1};
					psth1 = u.psth{condID,scoreID}(mask1);
					for intervalID2 = 1:u.i.count
						mask2 = u.i.masks{intervalID2};
						psth2 = u.psth{condID,scoreID}(mask2);
						if length(psth1) == length(psth2)
							[r, p] = corrcoef(psth1, psth2);
							u.i.autocorrR{condID,scoreID}(intervalID1,intervalID2) = r(1,2);
							u.i.autocorrP{condID,scoreID}(intervalID1,intervalID2) = p(1,2);
						end
					end
				end

				% calculate neurometric dprime for each PSTH bin in
				% reference to Nogo (both CR and FA)
% 				if ~any(isnan(u.psth{1,1}))
				if condID == 1 && scoreID == 1
					u.rateDP  {condID,scoreID} = zeros(size(u.rateDPTimes));
					u.i.rateDP{condID,scoreID} = zeros(1, u.i.count);
					
				else
					for i = 1:length(u.rateDPTimes)
						t = u.rateDPTimes(i);
						if t == 0
							u.rateDP{condID,scoreID}(i) = 0;
							continue;
						end
						frGo = zeros(size(spikeTimes));
						for trialID = 1:length(spikeTimes)
							frGo(trialID) = sum(0 <= spikeTimes{trialID} & ...
								spikeTimes{trialID} < t) / t;
						end
						spikesNogo = u.spikeTimes{1,1};
						frNogo = zeros(size(spikesNogo));
						for trialID = 1:length(spikesNogo)
							frNogo(trialID) = sum(0 <= spikesNogo{trialID} & ...
								spikesNogo{trialID} < t) / t;
						end
						avgGo = mean(frGo);
						avgNogo = mean(frNogo);
						errGo = std(frGo);
						errNogo = std(frNogo);
						u.rateDP{condID,scoreID}(i) = ...
							(avgGo - avgNogo) / (.5 * (errGo + errNogo));
					end
					
					% old d' metrics
% 					dPrime = (psthMean - u.psth{1,1}) ./ ...
% 						((psthSTD + u.psthSTD{1,1}) / 2);
% 					dPrime(dPrime>4) = 4;
% 					dPrime(dPrime<-4) = -4;
% 					dPrime(isnan(dPrime)) = 0;
% 					u.rateDP{condID,scoreID} = dPrime;
% 
% 					% cumulative quadratic mean of d'
% 					cqMean = sqrt(cumsum(dPrime.^2) ./ ...
% 						(1:length(dPrime)));
% 					pre = find(u.psthCenters < 0);
% 					cqMean = cqMean - cqMean(pre(end));
% 					u.rateDPCQMean{condID,scoreID} = cqMean;
% 
% 					% cumulative sum of squares
% 					cqSum = sqrt(cumsum(dPrime.^2));
% 					pre = find(u.psthCenters < 0);
% 					cqSum = cqSum - cqSum(pre(end));
% 					u.rateDPCQSum{condID,scoreID} = cqSum;
% 
% 					% quadratic mean of d' in 50ms bins
% 					mqMean = sqrt(movmean(dPrime.^2, 50e-3/u.psthBin));
% 					u.rateDPMQMean{condID,scoreID} = mqMean;

					for intervalID = 1:u.i.count
						bound = u.i.bounds(intervalID,:);
						dur = bound(2) - bound(1);
						frGo = zeros(size(spikeTimes));
						for trialID = 1:length(spikeTimes)
							frGo(trialID) = sum(bound(1) <= spikeTimes{trialID} & ...
								spikeTimes{trialID} < bound(2)) / dur;
						end
						spikesNogo = u.spikeTimes{1,1};
						frNogo = zeros(size(spikesNogo));
						for trialID = 1:length(spikesNogo)
							frNogo(trialID) = sum(bound(1) <= spikesNogo{trialID} & ...
								spikesNogo{trialID} < bound(2)) / dur;
						end
						avgGo = mean(frGo);
						avgNogo = mean(frNogo);
						errGo = std(frGo);
						errNogo = std(frNogo);
						u.i.rateDP{condID,scoreID}(intervalID) = ...
							(avgGo - avgNogo) / (.5 * (errGo + errNogo));
						
						% old d' metric
						% quadratic mean for different intervals: pre/onset/peri ...
% 						u.i.rateDP{condID,scoreID}(intervalID) = ...
% 							sqrt(mean(dPrime(u.i.masks{intervalID}).^2));
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
				
				
				for intervalID = 1:u.i.count
					mask = u.i.masks{intervalID};
					bound = u.i.bounds(intervalID,:);
					
					% mean and max firing rate
					u.i.frMean{condID,scoreID}(intervalID) = mean(psth(mask));
					u.i.frMax {condID,scoreID}(intervalID) = max (psth(mask));
					u.i.frSTD {condID,scoreID}(intervalID) = std (psth(mask));
					
					% calculate the mean spiking rate "lambda"
					% flooring divides the rate appropriately to adjust for the
					% #samples in a window
					% isi: inter-spike-interval
					
					isi = cellfun(@(sp)diff( ...
						sp(bound(1)<sp & sp<bound(2)) ), ...
						spikeTimes, 'uniformoutput', false);
					isi = [isi{:}];
					lambda = floor(histogramFit(isi) / u.spikeDuration);
					u.i.lambda{condID,scoreID}(intervalID) = lambda;

					% calculate mutual information
					u.i.mutualInfo{condID,scoreID}(intervalID) = mutualInfo( ...
						lambda, u.i.lambda{1,1}(intervalID)); % vs nogo
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
				[~,locs] = findpeaks(u.psth{condID,scoreID}(u.i.mask.periFull));
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
				
				for intervalID = 1:u.i.count
					bounds = u.i.bounds(intervalID, :);

					spikeTimesInterval = spikeTimesAll( ...
						bounds(1)<=spikeTimesAll & spikeTimesAll<bounds(2));
					
					% vector strength for each base frequency per interval
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

						u.i.vs{condID,scoreID}(freqID,intervalID) = vs;
						u.i.vsPhase{condID,scoreID}(freqID,intervalID) = theta2;
						u.i.vsPVal{condID,scoreID}(freqID,intervalID) = pval;
					end % freqID
					
					% vs @ 10hz per interval (same as above)
					freqID = u.vsFreqs==10;
					u.i.vs10{condID,scoreID}(intervalID) = ...
						u.i.vs{condID,scoreID}(freqID,intervalID);
					u.i.vs10Phase{condID,scoreID}(intervalID) = ...
						u.i.vsPhase{condID,scoreID}(freqID,intervalID);
					u.i.vs10PVal{condID,scoreID}(intervalID) = ...
						u.i.vsPVal{condID,scoreID}(freqID,intervalID);
	
					% use bootstrapping to calculate multi-taper spectrum (MTS)
					% mean and STD across trials, per each frequency and interval
					spikes = u.spikeTimes{condID,scoreID};
					spikes = cellfun(@(sp)sp(bounds(1)<=sp & sp<bounds(2)), ...
						spikes, 'un', 0);
					m = min([spikes{:}]);
					spikes = cellfun(@(sp)sp - m, spikes, 'un', 0);
					
					% multi-taper spectrum at different frequencies, per interval
% 					if length(spikeTimesInterval)>10
% 						mts = mtspectrumpt(spikeTimesInterval - ...
% 							min(spikeTimesInterval), u.mtsParams)';
% 						mts = 10*log10(mts); % convert to dB
% 						if length(mts) == length(u.mtsFreqs)
% 							u.i.mts{condID,scoreID}(:,intervalID) = mts;
% 							% mts only @ 10hz (within a band of 1hz)
% 							u.i.mts10{condID,scoreID}(intervalID) = ...
% 								mean(mts(u.mtsFreqs10));
% 						end
% 					end
					
					rng(1); % random seed
					reps = 20;
					n = ceil(trials / 2);
					mts = nan(reps, length(u.mtsFreqs));
					mtsParams = u.mtsParams;
					mtsFreqs = u.mtsFreqs;
					for i = 1:reps
						sample = datasample(spikes, n);
						sample = [sample{:}];
						if length(sample) > 10
							mts_i = mtspectrumpt(sample, mtsParams)' / n;
							mts_i = 10*log10(mts_i); % convert to dB
							if length(mts_i) == length(mtsFreqs)
								mts(i,:) = mts_i;
							end
						end
					end
					
					u.i.mts{condID,scoreID}(:,intervalID) = nanmean(mts, 1);
					u.i.mtsSTD{condID,scoreID}(:,intervalID) = nanstd(mts, 1);
					
					mts10 = nanmean(mts(:,u.mtsFreqs10), 2);
					u.i.mts10{condID,scoreID}(intervalID) = nanmean(mts10, 1);
					u.i.mts10STD{condID,scoreID}(intervalID) = nanstd(mts10, 1);
					
					% mts d'
					if condID == 1 && scoreID == 1
						u.i.mts10DP{1,1}(intervalID) = 0;
					else
						avg1 = u.i.mts10{1,1}(intervalID);
						avg2 = u.i.mts10{condID,scoreID}(intervalID);
						std1 = u.i.mts10STD{1,1}(intervalID);
						std2 = u.i.mts10STD{condID,scoreID}(intervalID);
						dp = (avg2 - avg1) / ((std1 + std2)/2);
						if isinf(dp); dp = nan; end
						u.i.mts10DP{condID,scoreID}(intervalID) = dp;
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
			levelIDs = 1:length(u.targetLevels);
			condIDs  = (freqID-1)*length(u.targetLevels)+levelIDs+1;  % +1 for nogo

			for scoreID = 1:5
				% rate-level function (RLF) peri-stimulus
				rlf = vertcat(u.i.frMean{condIDs,scoreID});  % conds x intervals
				rlf = squeeze(rlf(:,u.i.id.peri)); % conds
				if length(rlf) ~= length(condIDs); continue; end
				u.rlf{freqID,scoreID} = rlf;

				% threshold based on RLF
				threshold = nan;
				for levelID = 1:length(u.targetLevels)
					if ~isnan(rlf(levelID)) && levelID+1<=length(u.targetLevels) ...
							&& rlf(levelID)*1.2<rlf(levelID+1)   % 20% increase
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
