function viewAnalysis(analysis)
% in args:
%     analysis (str): path to an analysis file to load and view
%     or
%     analysis (cell array): list of analysis structs to view

	if ~exist('analysis', 'var')
		% set this before running
% 		analysis = 'results/CMR04Tail.mat';
% 		analysis = 'results/CMR02Head.mat';
%  		analysis = 'results/CMR05Fluffy-nochew.mat';
% 		analysis = 'results/CMR05Fluffy-chew.mat';
% 		analysis = 'results/CMR05Tail.mat';

% 		analysis = 'results/Aggregate-All-Unsorted.mat';
% 		analysis = 'results/Aggregate-All-SortedJoint.mat';
%  		analysis = 'results/Summary-All-Unsorted.mat';
%		analysis = 'results/Summary-All-SortedJoint.mat';

%  		analysis = 'results/Summary-CMR05Fluffy-SortedJoint.mat';
 		analysis = 'results/Summary-CMR05Fluffy-Sorted.mat';

% 		analysis = 'results/IMold.mat';
%
% 		analysis = 'AnalysisNYU/CMRphys.mat';
	end

	% create gui data struct
	if ischar(analysis)
		% load analysis file
		fprintf('Loading analysis from %s\n', analysis);
		data = load(analysis, 'analysis');
	else
		data = struct();
		data.analysis = analysis;
	end
	data.analysisID = 1;
	data.plotID     = 1;
	data.scoreID    = 1;
	data.scores     = {'All', 'HIT+CR', 'MISS+FA', 'HIT+FA', 'MISS+CR'};
	data.pageID     = 1;
	data.subsetID   = 1;    % only for summary analysis
	data.subsets = {'all', 'tonic', 'phasic', 'phasicSuppressing', ...
		'phasicEnhancing', 'phasicNoChange'};
	if strcmpi(data.analysis{1}.type, 'summary')
		data.plotNames = {
			'psth alt'
			'psth corr alt'
			'ter alt'
			'tep alt'
			'dprime alt'
			'dprime waterfall alt'
			'vs waterfall alt'
			'lfp alpha'
			'lfp beta'
			'lfp gamma'
			'psth'
% 			'psth err'
			'dprime cqmean'
% 			'dprime cqsum'
			'dprime neuro/behav'
			'dprime behavior'
			'vs 10'
			'vs 10 running'
			'vs 10 running phase'
			'vs pre'
			'vs peri'
			'vs post'
			'mts 10'
			'mts pre'
			'mts peri'
			'mts post'
% 			'firing max'
% 			'firing mean'
% 			'deltaAP'
			'deltaAP/behav'
			'mfsl'
			'mfsl phase'
			'mfsl violin'
			};
	else
		data.plotNames = {
			'raster'
			'psth'
% 			'dprime cqmean'
% 			'dprime cqsum'
% 			'dprime mqmean'
% 			'dprime'
% 			'lfp alpha'
% 			'lfp beta'
% 			'lfp gamma'
			'vs 10'
			'vs 10 running'
			'vs pre'
			'vs peri'
			'vs post'
			'mts 10'
			'mts pre'
			'mts peri'
			'mts post'
			'rlf'
			'firing max'
			'mfsl'
			'mfsl phase'
			'mutual info'
			'psth err'
			'psth heatmap'};
	end

	% subset the analysis based on any criteria
% 	exc = [];
% 	for analysisID = 1:length(data.analysis)
% 		a = data.analysis{analysisID};
% 		if ~strcmpi(a.maskerFile, 'supermasker.wav') || length(a.targetLevels) < 3 ...
% 				|| ~strcmpi(a.experimentMode, 'Passive')
% 			exc = [exc analysisID];
% 		end
% 	end
% 	data.analysis(exc) = [];

	% show figure
	fig = figure;
	% fig.Color = 'w';
	drawnow;
	warning('off', 'MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
	fig.JavaFrame.setMaximized(1);

	set(fig, 'WindowKeyPressFcn', @figKeyPress);
	guidata(fig, data);
	refreshPlot(fig);
end


% key press event of the figure, navigate through analyses and plots
function figKeyPress(fig, e)
	d          = guidata(fig);

	% keep a temporary copy to check for changes at the end
	analysisID = d.analysisID;
	plotID     = d.plotID;
	scoreID    = d.scoreID;
	pageID     = d.pageID;
	subsetID   = d.subsetID;
	plotCount  = length(d.plotNames);

	if any(strcmpi('alt', e.Modifier))
		step = 10;
	elseif any(strcmpi('shift', e.Modifier))
		step = 5;
% 	elseif any(strcmpi('alt', e.Modifier)) && ...
% 			any(strcmpi('shift', e.Modifier))
	elseif any(strcmpi('control', e.Modifier))
		step = inf;
	else
		step = 1;
	end

	switch e.Key
		case 'leftarrow'
			d.analysisID = max(d.analysisID-step, 1);
			d.pageID = min(d.pageID, ...
				ceil(d.analysis{d.analysisID}.unitCount/16));
		case 'rightarrow'
			d.analysisID = min(d.analysisID+step, ...
				length(d.analysis));
			d.pageID = min(d.pageID, ...
				ceil(d.analysis{d.analysisID}.unitCount/16));
		case 'uparrow'
			d.plotID = max(d.plotID-step, 1);
		case 'downarrow'
			d.plotID = min(d.plotID+step, plotCount);
		case 'pageup'
			if strcmpi(d.analysis{d.analysisID}.type, 'summary')
				d.subsetID = max(d.subsetID-1, 1);
			else
				d.pageID = max(d.pageID-step, 1);
			end
		case 'pagedown'
			if strcmpi(d.analysis{d.analysisID}.type, 'summary')
				d.subsetID = min(d.subsetID+1, length(d.subsets));
			else
				d.pageID = min(d.pageID+step, ...
					ceil(d.analysis{d.analysisID}.unitCount/16));
			end
		case 'r'
			refreshPlot(fig);
		case 'e'
			fig = figure();
			drawnow;
			size = [1000, 1000];
			screen = get(0, 'screensize');
			fig.OuterPosition = [(screen(3:4)-size)/2 size];
			refreshPlot(fig, d);
		case {'1' '2' '3' '4' '5'}
			d.scoreID = str2double(e.Key);
		case 'm'
			% only for summary analysis
			d.maskerResponse = ~d.maskerResponse;
	end
	if analysisID ~= d.analysisID || plotID ~= d.plotID || ...
			scoreID ~= d.scoreID || pageID ~= d.pageID || ...
			subsetID ~= d.subsetID
		guidata(fig, d);
		refreshPlot(fig);
	end
end


% code for all plots
function refreshPlot(fig, d)
	%% init
	figure(fig);
	clf;

	colors = [
		0.500, 0.500, 0.500;
		0.850, 0.325, 0.098;
		0.000, 0.447, 0.741;
		0.929, 0.694, 0.125;
		0.494, 0.184, 0.556;
		0.466, 0.674, 0.188;
		0.301, 0.745, 0.933;
		0.635, 0.078, 0.184;
		0.000, 0.000, 1.000;
		1.000, 0.000, 0.000;
		0.000, 0.000, 0.000;
		];
	getColor = @(i)colors(mod(i-1,size(colors,1))+1,:);

	% active/passive summary colors (ARO style)
	% rows: active mmr, passive mmr, passive quiet
	% cols: nogo, -10, 0, +10 db snr
	colors2 = {
		[240,160,140]/255, [233,99,103]/255, [229,66,72]/255, [224,35,39]/255;
		[.6 .6 .6], [.3 .3 .3], [.15 .15 .15], [0 0 0];
		[.6 .6 .6], [.3 .3 .3], [.15 .15 .15], [0 0 0];
		};

	% Unpack data
	if nargin < 2
		d = guidata(fig);
	end

	a = d.analysis{d.analysisID};
	plotName = d.plotNames{d.plotID};
	scoreID = d.scoreID;
	pageID = d.pageID;
	subset = d.subsets{d.subsetID};

	sorted = isfield(a, 'spikeConfig') && ...
		any(strcmpi(a.spikeConfig, {'sorted', 'sortedjoint'})) || ...
		isfield(a.units{1}, 'spikeConfig') && ...
		any(strcmpi(a.units{1}.spikeConfig, ...
		{'sorted', 'sortedjoint'})) || ...
		strcmpi(a.units{1}.type, 'single'); % for backwards compatibility

% 	a.unitCount = 2;
% 	a.units = a.units(a.channels==13 | a.channels==14);

	channelSubset = [];

	if sorted
		if strcmpi(a.type, 'summary')
% 			firingUL = 7.5;
			firingUL = 7;
		else
			firingUL = 15;
		end
		vectorUL = .6;
	else
		if strcmpi(a.type, 'summary')
			firingUL = 40;
		else
			firingUL = 160;
		end
		vectorUL = .8;
% 		firingUL = 40;
% 		vectorUL = .4;
% 		channelSubset = [9];
	end


	subplots = {};
	subplots2 = {};
	sameXLim = false;
	sameYLim = false;

	freqLabel = 'Frequency (kHz)';
	if isfield(a, 'version') && strcmp(a.version, 'neurobehavior@nyu')
		levelLabel = 'Level (dB)';
	else
		levelLabel = 'Level (dB SPL)';
	end
	snrLabel = 'SNR (dB)';

	%% plot selection
	try
% 		if a.unitCount > 16
% 			error(['Number of units in each analysis struct ' ...
% 				'should not exceed 16']);
% 		end

		%% summary plots that use both active and passive analyses
		% difference between PSTH of go and nogo
		if strcmpi(plotName, 'psth alt')
			plotTitle = 'Sound evoked response';
			if ~strcmpi(a.type, 'summary')
				error('Only for summary analysis');
			end
			if a.unitCount<2 || ...
					~strncmpi(a.units{1}.label, 'Active MMR', 10) || ...
					~strcmpi(a.units{2}.label, 'Passive MMR')
				error('Only for active and passive MMR');
			end

			modeCount = 3;
			for modeID = 1:modeCount
				u = a.units{modeID};

				% calculate average psth of nogo
				nogo = vertcat(u.psth{1,scoreID});
				if ~strcmpi(subset, 'all')
					msk = u.(subset){1,scoreID}==true;
					nogo = nogo(msk, :);
				end
				nogoMean = nanmean(nogo, 1);
				nogoErr = nansem(nogo, 1);

				for snrID = 1:3
					% calculate average psth of go
					go = vertcat(u.psth{snrID+1,scoreID});
					if ~strcmpi(subset, 'all')
						msk = u.(subset){1,scoreID}==true;
						go = go(msk, :);
					end
					goMean = nanmean(go, 1);
					goErr = nansem(go, 1);

					% plot go and nogo
					subplot(modeCount, 3, (modeCount-modeID)*3 + snrID);
					hold on;
					pltNogo = plot(u.psthCenters, nogoMean, ...
						'color', colors2{modeID, 1}, ...
						'linewidth', 1.5);
					pltGo = plot(u.psthCenters, goMean, ...
						'color', colors2{modeID, 1+snrID}, ...
						'linewidth', 1.5);

					peri = 0 <= u.psthCenters & u.psthCenters < 1;
					periCenters = u.psthCenters(peri);

					pltDelta = patch([periCenters fliplr(periCenters)], ...
						[goMean(peri) fliplr(nogoMean(peri))], ...
						[1 1 0], 'edgecolor', 'none');
					alpha(pltDelta, .4);
					uistack(pltDelta, 'bottom');

					% push ribbons to the back of line plots
% 					for condID = u.condCount:-1:2
% 						if patches(condID)
% 							uistack(patches(condID),'bottom');
% 						end
% 					end

					markTarget(u, modeID==1);

					xticks(u.viewBounds(1):1:u.viewBounds(2));
	% 				xticks(u.psthCenters(1:50:length(u.psthCenters)));
	% 				xticklabels(-1:.5:2);
	% 				xlim([-.3, 1.3]);
					xlim(u.viewBounds);
					ylim([0,firingUL]);
					ylabel('Firing rate (1/s)');
					xlabel('Time (s)');
	% 				grid on;

					if u.maskerLevel
						snr = u.targetLevels(snrID) - u.maskerLevel;
						condStr = num2str(snr, '%d dB');
						condStr2 = num2str(snr, '%d dB SNR');
					else
						level = u.targetLevels(snrID);
						condStr = num2str(level, '%d dB');
						condStr2 = num2str(level, '%d dB SPL');
					end
% 					msk = plots~=0;
% 					legend(plots(msk), condsStr(msk), ...
% 						'location', 'northeast');
% 					legend([pltNogo pltGo], {'Nogo' condStr}, ...
% 						'location', 'northeast');
					title([u.label ', ' condStr2]);
				end
			end

			% skip to the end
			error('my:break', '');

		% running correlation between go and nogo
		elseif strcmpi(plotName, 'psth corr alt')
			plotTitle = 'PSTH correlation';
			if ~strcmpi(a.type, 'summary')
				error('Only for summary analysis');
			end
			if a.unitCount<2 || ...
					~strncmpi(a.units{1}.label, 'Active MMR', 10) || ...
					~strcmpi(a.units{2}.label, 'Passive MMR')
				error('Only for active and passive MMR');
			end

			modeCount = 2;
			for modeID = 1:modeCount
				u = a.units{modeID};

				% calculate average psth of nogo
				nogo = vertcat(u.psth{1,scoreID});
				if ~strcmpi(subset, 'all')
					msk = u.(subset){1,scoreID}==true;
					nogo = nogo(msk, :);
				end
				nogoMean = nanmean(nogo, 1);

				for snrID = 1:3
					% calculate average psth of go
					go = vertcat(u.psth{1+snrID,scoreID});
					if ~strcmpi(subset, 'all')
						msk = u.(subset){1+snrID,scoreID}==true;
						go = go(msk, :);
					end
					goMean = nanmean(go, 1);
					
					R = zeros(size(u.psthCorrTimes));
					P = ones(size(u.psthCorrTimes));
					for timeID = 1:length(u.psthCorrTimes)
						time = u.psthCorrTimes(timeID);
						% center aligned window
						msk = time - u.psthCorrWindow/2 <= u.psthCenters & ...
							u.psthCenters <= time + u.psthCorrWindow/2;
						[r, p] = corrcoef(nogoMean(msk), goMean(msk));
						R(timeID) = r(1,2);
						P(timeID) = p(1,2);
					end
					RMean = R;
					RErr = zeros(size(R));
				
% 					R = vertcat(u.psthCorrR{snrID+1,scoreID});
% 					if ~strcmpi(subset, 'all')
% 						msk = u.(subset){1,scoreID}==true;
% 						R = R(msk, :);
% 					end
% 					RMean = nanmean(R, 1);
% 					RErr = nansem(R, 1);
					
					% running pearson's correlation
					subplot(modeCount, 3, (modeCount-modeID)*3 + snrID);
					hold on;
					plot(u.psthCorrTimes, RMean, ...
						'color', colors2{modeID, 1+snrID}, ...
						'linewidth', 1.5);
					
					p = patch([u.psthCorrTimes fliplr(u.psthCorrTimes)], ...
						[RMean+RErr fliplr(RMean-RErr)], ...
						colors2{modeID, 1+snrID}, ...
						'edgecolor', 'none');
					alpha(p, .2);
					uistack(p, 'bottom');
					
					% mark significant p-values
% 					hold on;
% 					sig = P<.05;
% 					plot(centers(sig), R(sig), '.', 'markersize', 12, ...
% 						'color', [.6 .6 1]);


					% running cross correlation
% 					time_window = 100e-3;
% 					time_step = 30e-3;
%
% 					peri = 0<=u.psthCenters;
% 					goMeanPeri = goMean;
% 					nogoMeanPeri = nogoMean;

% 					[lag_time, twin, xcl] = timewindow_xcorr(nogoMeanPeri-mean((nogoMeanPeri+goMeanPeri)/2), ...
% 						goMeanPeri-mean((nogoMeanPeri+goMeanPeri)/2), 1/u.psthBin, time_window, time_step, time_window, 0);

					% plot go and nogo
% 					for ii = 1 : length(twin)
% 						tmp = xcl(ii,:);
% 						tmp(20:22)=0;
% 						pk(ii) = min(find(abs(tmp)==max(abs(tmp))));
% 					end
% 					plot(twin - u.targetDuration,pk);% sum(xcl'))
% 					imagesc(twin, lag_time, xcl');%./sum(xcl'));

% 					plot(u.psthCenters, movmean((goMean - nogoMean) ./ (goErr/2 + nogoErr/2), 10));

					markTarget(u, modeID==1);

					axis tight square;
					xticks(u.viewBounds(1):1:u.viewBounds(2));
	% 				xticks(u.psthCenters(1:50:length(u.psthCenters)));
					xticklabels(-1:1:2);
					xlim([u.psthCorrTimes(1), u.psthCorrTimes(end)]);
% 					xlim(u.viewBounds);
					yticks(-1:.5:1);
					ylim([-1,1]);
% 					ylabel('Firing rate (1/s)');
% 					xlabel('Time (s)');
					grid on;

					if u.maskerLevel
						snr = u.targetLevels(snrID) - u.maskerLevel;
						condStr = num2str(snr, '%d dB');
						condStr2 = num2str(snr, '%d dB SNR');
					else
						level = u.targetLevels(snrID);
						condStr = num2str(level, '%d dB');
						condStr2 = num2str(level, '%d dB SPL');
					end
% 					msk = plots~=0;
% 					legend(plots(msk), condsStr(msk), ...
% 						'location', 'northeast');
% 					legend([pltNogo pltGo], {'Nogo' condStr}, ...
% 						'location', 'northeast');
					title([u.label ', ' condStr2]);
				end
			end

			% skip to the end
			error('my:break', '');
			
		% target-evoked response and peak activation relative to nogo
		elseif any(strcmpi(plotName, {'ter alt', 'tep alt', 'dprime alt'}))
			if ~strcmpi(a.type, 'summary')
				error('Only for summary analysis');
			end

			if strcmpi(plotName, 'ter alt')
				plotTitle = 'Target-evoked response';
			elseif strcmpi(plotName, 'tep alt')
				plotTitle = 'Target-evoked peak';
			elseif strcmpi(plotName, 'dprime alt')
				plotTitle = 'Neurometric d''';
			end

			sameYLim = true;
			
			modeCount = 3;
			for modeID = 1:modeCount
				u = a.units{modeID};

				if strcmpi(plotName, 'ter alt')
					vals = u.ter;
				elseif strcmpi(plotName, 'tep alt')
					vals = u.tep;
				elseif strcmpi(plotName, 'dprime alt')
					vals = u.dPrimeIntervals;
				end
				
				if u.maskerLevel
					conds = u.targetLevels - u.maskerLevel;
					condLabel = 'SNR [dB]';
				else
					conds = u.targetLevels;
					condLabel = 'SPL [dB]';
				end

				% dimensions: units x intervals x conds
				sup = u.phasicSuppressing{1,1}==true;
				enh = u.phasicEnhancing{1,1}==true;
				vals = cat(3, vals{2:end,scoreID}); % no nogo
				if any(strncmpi(plotName, {'ter', 'tep'}, 3))
					vals = vals * 100; % as percentage
				end
				avgSup = squeeze(nanmean(vals(sup, :, :), 1));
				errSup = squeeze(nansem(vals(sup, :, :), 1));
				avgEnh = squeeze(nanmean(vals(enh, :, :), 1));
				errEnh = squeeze(nansem(vals(enh, :, :), 1));
				
				intervalCount = 3;
				for intervalID = 1:intervalCount
					subplots{end+1} = subplot(modeCount, intervalCount, ...
						(modeCount-modeID)*3 + intervalID);
					hold on;
					errorbar(conds, avgSup(intervalID,:), errSup(intervalID,:), ...
						'-o', 'color', [1 .4 0], 'markerfacecolor', [1 .4 0], ...
						'markersize', 4, 'linewidth', 1.5);
					errorbar(conds, avgEnh(intervalID,:), errEnh(intervalID,:), ...
						'-o', 'color', [0 .3 1], 'markerfacecolor', [0 .3 1], ...
						'markersize', 4, 'linewidth', 1.5);

					axis square tight;
					xlim([min(conds)-2.5, max(conds)+2.5]);
					if contains(plotName, 'dprime')
						ylim([0, .8]);
					end
% 					ylim([-10, 10]);
					xticks(conds);
					xlabel(condLabel);
					ylabel([plotTitle ' [%]']);
					leg = legend({'Phasic Suppressing', 'Phasic Enhancing'}, ...
						'location', 'northeast', 'fontsize',8);
					title([u.label ', ' u.intervalNames{intervalID}]);
				end
			end

			% skip to the end
			error('my:break', '');

			
		% waterfall plot of dprime of units per snr and onset/peri/offset
		elseif strcmpi(plotName, 'dprime waterfall alt')
			plotTitle = 'd'' waterfall';
			if ~strcmpi(a.type, 'summary')
				error('Only for summary analysis');
			end
			if a.unitCount<2 || ...
					~strncmpi(a.units{1}.label, 'Active MMR', 10) || ...
					~strcmpi(a.units{2}.label, 'Passive MMR')
				error('Only for active and passive MMR');
			end

			% sort according to active mode, peri, +10 dB SNR
			dPrime = a.units{1}.dPrimeIntervals{end,scoreID}(:,2);
			if ~strcmpi(subset, 'all')
				msk = a.units{1}.(subset){1,scoreID}==true;
				dPrime = dPrime(msk);
			end
			[~, i] = sort(dPrime);

			modeCount = 2;
			intervalCount = length(a.units{1}.intervals)-1;    % no perifull
			for modeID = 1:modeCount
				u = a.units{modeID};
				
				% dimensions: unit x interval x snr
				dPrime = cat(3, u.dPrimeIntervals{2:end,scoreID});
				if ~strcmpi(subset, 'all')
					msk = u.(subset){1,scoreID}==true;
					dPrime = dPrime(msk, :, :);
				end
				% sort
% 				[~, i] = sort(dPrime(:, 3));
				dPrime = dPrime(i, :, :);
				
				if u.maskerLevel
					snrs = u.targetLevels - u.maskerLevel;
				else
					snrs = u.targetLevels;
				end
				units = 1:size(dPrime,1);

				for intervalID = 1:intervalCount
					subplot(modeCount, intervalCount, ...
						(modeCount-modeID)*3 + intervalID);

					[x, y] = meshgrid(snrs, units);
					waterfall(x, y, squeeze(dPrime(:,intervalID,:)));

					xticks(snrs);
					ylim([units(1) units(end)]);
					zlim([0 1.2]);
					if u.maskerLevel
						xlabel('SNR [dB]');
					else
						xlabel('Target level [dB SPL]')
					end
					ylabel('Unit number');
					zlabel('d''');

					title([u.label ', ' u.intervalNames{intervalID} ' d''']);
				end
			end


			% skip to the end
			error('my:break', '');

		% waterfall plot of vector strength of units at 10Hz per snr and
		% pre/peri/post
		elseif strcmpi(plotName, 'vs waterfall alt')
			plotTitle = 'VS @ 10Hz waterfall';
			if ~strcmpi(a.type, 'summary')
				error('Only for summary analysis');
			end
			if a.unitCount<2 || ...
					~strncmpi(a.units{1}.label, 'Active MMR', 10) || ...
					~strcmpi(a.units{2}.label, 'Passive MMR')
				error('Only for active and passive MMR');
			end

			% sort according to active mode, peri, +10 dB SNR
			freq = a.units{1}.vsFreqs == 10;
			vs = squeeze(a.units{1}.vs{end,scoreID}(:,2,freq));
			if ~strcmpi(subset, 'all')
				msk = a.units{1}.(subset){1,scoreID}==true;
				vs = vs(msk, :);
			end
			[~, i] = sort(vs);

			modeCount = 2;
			for modeID = 1:modeCount
				u = a.units{modeID};

				freq = u.vsFreqs == 10;
				for snrID = 1:length(u.targetLevels)
					if u.maskerLevel
						snr = u.targetLevels(snrID) - u.maskerLevel;
						condStr = num2str(snr, '%d dB SNR');
					else
						level = u.targetLevels(snrID);
						condStr = num2str(level, '%d dB SPL');
					end

					vs = squeeze(u.vs{snrID+1,scoreID}(:,:,freq));
					if ~strcmpi(subset, 'all')
						msk = u.(subset){1,scoreID}==true;
						vs = vs(msk, :);
					end

% 					[~, i] = sort(vs(:, 2));
					vs = vs(i, :);

					bins = 1:size(vs,2);
					units = 1:size(vs,1);

					subplot(modeCount, length(u.targetLevels), ...
						(modeCount-modeID)*3 + snrID);

					[x, y] = meshgrid(bins, units);
					waterfall(x, y, vs);

					xticks(bins);
					xticklabels(u.vsBinNames);
					ylim([units(1) units(end)]);
					zlim([0 1]);
					ylabel('Unit number');
					zlabel('VS @ 10Hz');

					title([u.label ', ' condStr]);
				end
			end


			% skip to the end
			error('my:break', '');

		% difference between PSTH of active vs passive
		elseif strcmpi(plotName, 'deltaAP')

			plotTitle = '\Delta AP plots';
			if ~strcmpi(a.type, 'summary')
				error('Only for summary analysis');
			end
			if a.unitCount<2 || ...
					~strncmpi(a.units{1}.label, 'Active', 6) || ...
					~strcmpi(a.units{2}.label, 'Passive MMR')
				error('Only for active and passive MMR');
			end

			uA = a.units{1};
			uP = a.units{2};
			psthCenters = uA.psthCenters;
			targetDuration = uA.targetDuration;
			viewBounds = uA.viewBounds;
			condCount = uA.condCount;

			alphaDiff = 0;
			alphaErr = .2;
			sameYLim = true;


			% delta AP = active nogo - passive nogo
			condID = 1; % nogo
			psthA = vertcat(uA.psth{condID,scoreID});
			psthP = vertcat(uP.psth{condID,scoreID});
			if ~strcmpi(subset, 'all')
				msk = uA.(subset){condID,scoreID}==true;
				psthA = psthA(msk, :);
				psthP = psthP(msk, :);
			end
			psthAErr = nansem(psthA, 1);
			psthPErr = nansem(psthP, 1);
			psthA = nanmean(psthA, 1);
			psthP = nanmean(psthP, 1);

% 			deltaAP = psthA - psthP;

% 			psthADelayed = [zeros(1,43) psthA(1:end-43)];
% 			psthDelayedDiff = psthP - psthADelayed + mean(psthA);

			% plot
			subplots{end+1} = subplot(3, condCount, 1);
			hold on;
			axis tight square;
			pltAErr = patch([psthCenters fliplr(psthCenters)], ...
				[psthA+psthAErr fliplr(psthA-psthAErr)],...
				'r', 'edgecolor', 'none'); alpha(pltAErr, alphaErr);
			pltPErr = patch([psthCenters fliplr(psthCenters)], ...
				[psthP+psthPErr fliplr(psthP-psthPErr)], ...
				'm', 'edgecolor', 'none'); alpha(pltPErr, alphaErr);
			pltAP = patch([psthCenters flip(psthCenters)], ...
				[psthA flip(psthP)], 'b', 'edgecolor', 'none');
			alpha(pltAP, alphaDiff);
			pltA = plot(psthCenters, psthA, 'r', 'linewidth', 1.5);
			pltP = plot(psthCenters, psthP, 'b', 'linewidth', 1.5);

			% mark target duration
			markTarget(a);

			xticks(viewBounds(1):1:viewBounds(2));
			xlim(viewBounds);
			ylabel('Firing rate (1/s)');
			xlabel('Time (s)');
			legend([pltA, pltP], {'Active', 'Passive'});
			title('{\Delta}AP (Nogos)');


			% delta MA, MP and M
			for condID = 2:condCount
				% delta MA = active nogo - active go
				snr = uA.targetLevels(condID-1) - uA.maskerLevel;
				snrStr = num2str(snr, '%d dB');

				psthNogo = vertcat(uA.psth{1,scoreID});
				psthGo = vertcat(uA.psth{condID,scoreID});
				if ~strcmpi(subset, 'all')
					msk = uA.(subset){1,scoreID}==true;
					psthNogo = psthNogo(msk, :);
					msk = uA.(subset){condID,scoreID}==true;
					psthGo = psthGo(msk, :);
				end
				psthNogoErr = std(psthNogo, 0, 1) / sqrt(size(psthNogo,1));
				psthGoErr = std(psthGo, 0, 1) / sqrt(size(psthGo,1));
				psthNogo = nanmean(psthNogo, 1);
				psthGo = nanmean(psthGo, 1);
				deltaMA = psthNogo - psthGo;

				subplots{end+1} = subplot(3, uA.condCount, condID);
				hold on;
				axis tight square;
				pltNogoErr = patch([psthCenters fliplr(psthCenters)], ...
					[psthNogo+psthNogoErr fliplr(psthNogo-psthNogoErr)],...
					'r', 'edgecolor', 'none'); alpha(pltNogoErr, alphaErr);
				pltGoErr = patch([psthCenters fliplr(psthCenters)], ...
					[psthGo+psthGoErr fliplr(psthGo-psthGoErr)], ...
					'm', 'edgecolor', 'none'); alpha(pltGoErr, alphaErr);
				pltMA = patch([psthCenters flip(psthCenters)], ...
					[psthGo flip(psthNogo)], 'b', 'edgecolor', 'none');
				alpha(pltMA, alphaDiff);
				pltNogo = plot(psthCenters, psthNogo, 'r', ...
					'linewidth', 1.5);
				pltGo = plot(psthCenters, psthGo, 'm', ...
					'linewidth', 1.5);

				% mark target duration
				markTarget(a);

				xticks(viewBounds(1):1:viewBounds(2));
				xlim(viewBounds);
				yl = ylim;
				ylim([0, yl(2)])
				ylabel('Firing rate (1/s)');
				xlabel('Time (s)');
				legend([pltNogo, pltGo], {'Nogo', 'Go'});
				title(['{\Delta}MA ' snrStr])


				% delta MP = passive nogo - passive go
				snr = uP.targetLevels(condID-1) - uP.maskerLevel;
				snrStr = num2str(snr, '%d dB');

				psthNogo = vertcat(uP.psth{1,scoreID});
				psthGo = vertcat(uP.psth{condID,scoreID});
				if ~strcmpi(subset, 'all')
					msk = uP.(subset){1,scoreID}==true;
					psthNogo = psthNogo(msk, :);
					msk = uP.(subset){condID,scoreID}==true;
					psthGo = psthGo(msk, :);
				end
				psthNogoErr = std(psthNogo, 0, 1) / sqrt(size(psthNogo,1));
				psthGoErr = std(psthGo, 0, 1) / sqrt(size(psthGo,1));
				psthNogo = nanmean(psthNogo, 1);
				psthGo = nanmean(psthGo, 1);
				deltaMP = psthNogo - psthGo;

				subplots{end+1} = ...
					subplot(3, uP.condCount, condID+uP.condCount);
				hold on;
				axis tight square;
				pltNogoErr = patch([psthCenters fliplr(psthCenters)], ...
					[psthNogo+psthNogoErr fliplr(psthNogo-psthNogoErr)],...
					'b', 'edgecolor', 'none'); alpha(pltNogoErr, alphaErr);
				pltGoErr = patch([psthCenters fliplr(psthCenters)], ...
					[psthGo+psthGoErr fliplr(psthGo-psthGoErr)], ...
					'g', 'edgecolor', 'none'); alpha(pltGoErr, alphaErr);
				pltMA = patch([psthCenters flip(psthCenters)], ...
					[psthGo flip(psthNogo)], 'b', 'edgecolor', 'none');
				alpha(pltMA, alphaDiff);
				pltNogo = plot(psthCenters, psthNogo, 'b', ...
					'linewidth', 1.5);
				pltGo = plot(psthCenters, psthGo, 'g', ...
					'linewidth', 1.5);

% 				pltDelayedDiff = plot(psthCenters, psthDelayedDiff, 'k', ...
% 					'linewidth', 1.5);

				% mark target duration
				markTarget(a);

				xticks(viewBounds(1):1:viewBounds(2));
				xlim(viewBounds);
				ylabel('Firing rate (1/s)');
				xlabel('Time (s)');
				legend([pltNogo, pltGo], {'Nogo', 'Go'});
				title(['{\Delta}MP ' snrStr])


				% delta M = delta MA / delta PA
				deltaM = deltaMA ./ deltaMP;
				deltaM(abs(deltaM)>10) = nan;%sign(deltaM(abs(deltaM)>10)).*10;

				subplots2{end+1} = ...
					subplot(3, uP.condCount, condID+uP.condCount*2);
				hold on;
				axis tight square;
				plot(psthCenters, deltaM, 'k', 'linewidth', 1.5);

				xticks(viewBounds(1):1:viewBounds(2));
				xlim(viewBounds);
				ylabel('{\Delta}MA/{\Delta}MP');
				xlabel('Time (s)');
				title(['{\Delta}M ' snrStr])
			end

			% skip to the end
			error('my:break', '');

		elseif strcmpi(plotName, 'deltaAP/behav')
			% delta AP versus behavioral d'
			plotTitle = '{\Delta}AP vs behavioral d'' plots';
			if ~strcmpi(a.type, 'summary')
				error('Only for summary analysis');
			end
			if a.unitCount<2 || ...
					~strncmpi(a.units{1}.label, 'Active', 6) || ...
					~strcmpi(a.units{2}.label, 'Passive MMR')
				error('Only for active and passive MMR');
			end
			if length(a.targetFreqs)~=1
				error('Only for a single target freq');
			end

			uA = a.units{1};
			uP = a.units{2};
			psthCenters = uA.psthCenters;
			targetDuration = uA.targetDuration;
			viewBounds = uA.viewBounds;
			condCount = uA.condCount;

			sameXLim = true;
			sameYLim = true;

			condsStr = {'Nogo'};
			for freq = uA.targetFreqs
				for level = uA.targetLevels
% 					condsStr{end+1} = sprintf('%gk %gdB', freq, level);
					condsStr{end+1} = sprintf('%g dB', ...
						level - uA.maskerLevel);
				end
			end

			plots = zeros(condCount,1);

			getShade = @(condID)[.7 .7 .7] * ...
					(1-(condID-1)/(condCount-1)) + [0 0 .3];

			ax = subplot(1,1,1);
			axis square tight;
			hold on;
% 			f = fopen('results/deltaAP-behav.csv', 'w');
% 			fprintf(f, ['sessionID, conditionID, conditionLabel, ' ...
% 				'dPrimeBehav, deltaAP\n']);
			for condID = 1:condCount
				peri = 0<=psthCenters & psthCenters<=targetDuration;
				psthA = vertcat(uA.psth{condID,1});
				psthP = vertcat(uP.psth{condID,1});
				psthA = psthA(:, peri);
				psthP = psthP(:, peri);
				if condID == 1
					% plot nogo deltaAP against average behavioral d' of
					% the two loudest target level conditions
					dpBehav = vertcat(uA.dPrimeBehavior{end-1:end});
					dpBehav = mean(dpBehav, 1);
				else
					dpBehav = uA.dPrimeBehavior{condID};
				end
				sessionIDs = uA.sessionIDs{condID,1};

				if ~strcmpi(subset, 'all')
					msk = uA.(subset){condID,1}==true;
					psthA = psthA(msk,:);
					psthP = psthP(msk,:);
					dpBehav = dpBehav(msk);
					sessionIDs = sessionIDs(msk);
				end

				deltaAP = trapz(psthCenters(peri), abs(psthA - psthP), 2)';
				groups = findgroups(sessionIDs);
				deltaAP = splitapply(@mean, deltaAP, groups);
				dpBehav = splitapply(@mean, dpBehav, groups);

% 				for i = 1:length(deltaAP)
% 					fprintf(f, '%d, %d, %s, %g, %g\n', ...
% 						sessionIDs(find(groups==i, 1)), condID, ...
% 						condsStr{condID}, dpBehav(i), deltaAP(i));
% 				end

				plots(condID) = plot(dpBehav, deltaAP, '.', ...
						'markersize', 15, ...
						...'color', getColor(condID));
						'color', getShade(condID));
			end
% 			fclose(f);

			xLim = xlim;
			xlim([0 xLim(2)]);
			yLim = ylim;
			ylim([0 yLim(2)]);
			xlabel('Behavioral d''');
			ylabel('{\Delta}AP');
			msk = plots~=0;
			legend(plots(msk), condsStr(msk), ...
				'location', 'northeastoutside');
% 			title(u.label);

			error('my:break', '');
		end

		%% regular plots that are per unit
		if sorted
			unitFrom = (pageID-1)*16+1;
% 			unitFrom = (pageID-1)*16+2;
			unitTo = min([pageID*16, a.unitCount]);
% 			a.unitCount = 2;
		else
			unitFrom = 1;
			unitTo = a.unitCount;
		end

		for unitID = unitFrom:unitTo
			u = a.units{unitID};
% 			unitID = unitID - 1;

			if ~isempty(channelSubset) && all(u.channel ~= channelSubset)
				continue;
			end

			if ~isfield(u, 'viewBounds') % for older analysis results
				u.viewBounds = [-1, 2];
			end

			% 	if f.targetFreqs(1) == 0; f.targetFreqs(1) = .5; end
% 			if strcmpi(a.experimentMode, 'poke training')
% 				nogoStr = 'No Target';
% 				nogoStr = 'Nogo';
% 			else
			nogoStr = 'Nogo';
% 			end
			freqsStr      = cellfun(@(a)num2str(a,'%g'    ),...
				num2cell(u.targetFreqs ),'un',0);
			freqsStrHz    = cellfun(@(a)num2str(a,'%g kHz'),...
				num2cell(u.targetFreqs ),'un',0);
			levelsStr     = cellfun(@(a)num2str(a,'%g'    ),...
				num2cell(u.targetLevels),'un',0);
			levelsStrdB   = cellfun(@(a)num2str(a,'%g dB' ),...
				num2cell(u.targetLevels),'un',0);
			levelsNogo    = [min(u.targetLevels)-10, ...
				u.targetLevels];                        % add nogo
			levelsNogoStr = [nogoStr, levelsStr];       % add nogo
			levelsNogoStrdB = [nogoStr, levelsStrdB];   % add nogo

			if ~isfield(u, 'maskerLevel')
				warning('Assuming masker level = 50 dB SPL')
				u.maskerLevel = 50;
			end

			snr = u.targetLevels - u.maskerLevel;
			snrStr     = cellfun(@(a)num2str(a,'%g'    ),...
				num2cell(snr),'un',0);
			snrStrdB   = cellfun(@(a)num2str(a,'%g dB' ),...
				num2cell(snr),'un',0);
			snrNogo = [min(snr)-10, snr];               % add nogo
			snrNogoStr = [nogoStr, snrStr];             % add nogo
			snrNogoStrdB = [nogoStr, snrStrdB];         % add nogo

			if length(u.targetFreqs) == 1
				condsStr = snrNogoStrdB;
			else
				condsStr = {nogoStr};
				for freq = u.targetFreqs
	% 				for level = u.targetLevels
	% 					condsStr{end+1} = sprintf('%gk %gdB', freq, level);
	% 				end
					for s = snr
						condsStr{end+1} = sprintf('%gk %gdB', freq, s);
					end
				end
			end

			if any(strcmpi(a.type, {'session', 'datafile'}))
				if sorted
					pos = unitID-(pageID-1)*16;
				elseif strcmpi(a.version, 'neurobehavior@nyu')
					pos = a.channels(unitID);
				else
					pos = channelMappingA4x4(a.channels(unitID));
				end
				unitCount = 16;

				if ~isempty(channelSubset)
					pos = find(channelSubset == u.channel);
					unitCount = length(channelSubset);
				end
			else
				pos = unitID;
				unitCount = a.unitCount;
			end

			ax = subplot(ceil(unitCount/4), min(unitCount,4), pos);
			subplots{end+1} = ax;

			hold on;

			% Raster plot
			if strcmpi(plotName, 'raster')
				plotTitle = 'Raster Plot';

				plots = zeros(u.condCount-1,1);
				axis square tight;
				ySum = 0;
				yCenters = zeros(1,u.condCount);
				for condID = 1:u.condCount
% 					if u.trialCountPerCond(condID)==0; continue; end
					spikeTimes = u.spikeTimes{condID,scoreID};
					trialCount = length(spikeTimes);
					spikeCounts = cellfun(@(c)length(c), spikeTimes);
					x = [spikeTimes{:}];
					if trialCount && ~isempty(x)
						y = repelem(1:trialCount, spikeCounts) + ySum;
						plots(condID) = plot(x, y, '.', ...
							'markersize',4, 'color',getColor(condID));
					end
					yCenters(condID) = ySum + trialCount/2;
					ySum = ySum + trialCount + 1;
					if condID ~= u.condCount
% 						line([-1,2], [ySum ySum], 'color','k', ...
% 							'linewidth',1.5)
					end
				end

				markTarget(u);

% 				xticks(u.psthCenters(1:50:length(u.psthCenters)));
				xticks(u.viewBounds(1):1:u.viewBounds(2));
				xlim(u.viewBounds);
				yCenters(yCenters==0) = [];
				yticks(yCenters);
				yticklabels(condsStr);
				ylim([0, ySum]);
% 				ylabel('Firing rate (1/s)');
				xlabel('Time (s)');
% 				legend(plots, condsStr, 'location', 'northeastoutside');
				title(u.label);


			% PSTH heatmap
			elseif strcmpi(plotName, 'psth heatmap')

				plotTitle = 'PSTH heatmap';

				im = zeros(u.condCount, length(u.psthCenters));
				for condID = 1:u.condCount
					im(condID,:) = u.psthMean{condID,scoreID};
				end
				imagesc(im, [0,firingUL]);
				axis square tight;
				xticks(1:(.5/u.psthBin):length(u.psthCenters));
				xticklabels(u.viewBounds(1):.5:u.viewBounds(2));

				for ticks = 2:length(u.targetLevels):u.condCount
					line(xlim(), [ticks-.5 ticks-.5], 'color', 'black');
				end

				% left axis shows target frequencies
				yyaxis left
				yticks([1, (2:length(u.targetLevels):u.condCount) + ...
					floor(length(u.targetLevels)/2)]);
				yticklabels([nogoStr, freqsStr]);
				set(gca, 'ydir', 'normal');
				set(gca, 'ycolor', 'black');
				set(gca, 'ticklength', [0,0]);
				ylabel('Freq (kHz)');
				lim = ylim();

				% right axis shows target levels
				yyaxis right
				ylim(lim);
				yticks(2:u.condCount);
				yticklabels(repmat(snr, 1, ...
					length(snr)));
				set(gca, 'ydir', 'normal');
				set(gca, 'ycolor', 'black');
				set(gca, 'ticklength', [0,0]);

				xlabel('Time (s)');
				ylabel(snrLabel);
				title(u.label);


			% PSTH
			elseif strcmpi(plotName, 'psth') || ...
					strcmpi(plotName, 'psth err')
				plotTitle = 'PSTH';

				plots = zeros(u.condCount,1);
				patches = zeros(u.condCount,1);
				axis square tight;
				for condID = 1:u.condCount
					tab = u.psthCenters;
					if strcmpi(a.type, 'summary')
						psth = vertcat(u.psth{condID,scoreID});
						if ~strcmpi(subset, 'all')
							msk = u.(subset){condID,scoreID}==true;
							psth = psth(msk, :);
						end
						avg = nanmean(psth, 1);
						err = nansem(psth, 1);
					else
						avg = u.psthMean{condID,scoreID};
						err = u.psthSTD{condID,scoreID};
					end
					col = getColor(condID);
					if isempty(avg); continue; end
					plots(condID) = plot(tab, avg, 'color', col, ...
						'linewidth', 1.5);
					if strcmpi(plotName, 'psth err')
						patches(condID) = patch([tab fliplr(tab)], ...
							[avg+err fliplr(avg-err)], ...
							col, 'edgecolor', 'none');
						alpha(patches(condID), .2);
					end
					ypos = firingUL - (condID-1)*firingUL*.05;

					gap = 50e-3;
					onset = 0<=u.psthCenters & u.psthCenters<gap;
					peri = gap<=u.psthCenters & ...
						u.psthCenters<u.targetDuration;
					offset = u.targetDuration<=u.psthCenters & ...
						u.psthCenters<u.targetDuration+gap;

					% mark significant changes of firing rate for
					% onset, offset and duration of the target
					if condID ~= 1 && ~strcmpi(a.type, 'summary') && ...
							~isempty(u.dPrime{condID,scoreID})
						dPrime = u.dPrime{condID,scoreID};
						dPrimeOnset  = ...
							sqrt(sum(dPrime(onset).^2) / sum(onset));
						dPrimePeri = ...
							sqrt(sum(dPrime(peri).^2) / sum(peri));
						dPrimeOffset = ...
							sqrt(sum(dPrime(offset).^2) / sum(offset));

% 						if dPrimeOnset > .3
% 							plot(0, ypos, '*', 'color', getColor(condID));
% 						end
% 						if dPrimePeri > .3
% 							plot(u.targetDuration/2, ypos, ...
% 								'*', 'color', getColor(condID));
% 						end
% 						if dPrimeOffset > .3
% 							plot(u.targetDuration, ypos, ...
% 								'*', 'color', getColor(condID));
% 						end

% 						if any(abs(dPrime(0<=u.psthCenters & ...
% 								u.psthCenters<u.targetDuration+gap)) > 1)
% 							plot(u.targetDuration/2, ypos, ...
% 								'*', 'color', getColor(condID));
% 						end
					end

					if ~strcmpi(a.type, 'summary')
						x = u.mfsl{condID,scoreID};
						[~, i] = min(abs(u.psthCenters-x));
						y = u.psthMean{condID,scoreID}(i);
						plot(x, y, '*', 'color', col);
					end

% 					if u.pvalPeri{condID} < .05
% 						plot(.5, ypos, '*', 'color', getColor(condID));
% 					end
% 					if abs(u.zscoreOnset{condID}) > 1
% 						plot(0, ypos, '*', 'color', getColor(condID));
% 					end
% 					if abs(u.zscoreOffset{condID}) > 1
% 						plot(1, ypos, '*', 'color', getColor(condID));
% 					end
				end

				% push ribbons to the back of line plots
				for condID = u.condCount:-1:2
					if patches(condID)
						uistack(patches(condID),'bottom');
					end
				end

				markTarget(u);

				xticks(u.viewBounds(1):1:u.viewBounds(2));
% 				xticks(u.psthCenters(1:50:length(u.psthCenters)));
% 				xticklabels(-1:.5:2);
% 				xlim([-.3, 1.3]);
				xlim(u.viewBounds);
				ylim([0,firingUL]);
				ylabel('Firing rate (1/s)');
				xlabel('Time (s)');
% 				grid on;

				if strcmpi(a.type, 'summary')
					loc = 'northeast';
				else
					loc = 'northeastoutside';
				end
				msk = plots~=0;
				legend(plots(msk), condsStr(msk), ...
					'location', loc);
				title(u.label);


			% local field potential
			elseif strncmpi(plotName, 'lfp', 3)
				bandName = plotName(5:end);
				bandName = [upper(bandName(1)) bandName(2:end)];
				bandID = find(strcmpi(u.lfpBandNames, bandName));
				sameYLim = true;

				plotTitle = ['RMS of ' bandName ' band'];

				plots = zeros(u.condCount, 1);

				for condID = 1:u.condCount
					if strcmpi(a.type, 'summary')
						lfp = squeeze(u.lfp{condID,scoreID}(:,bandID,:));
						if ~strcmpi(subset, 'all')
							msk = u.(subset){condID,scoreID}==true;
							lfp = lfp(msk, :);
						end
						lfp = 10*log10(lfp);
						avg = nanmean(lfp, 1);
						err = nansem(lfp, 1);
					else
						lfp = u.lfpMean{condID,scoreID}(bandID,:,:);
						lfp = 10*log10(lfp);
						avg = nanmean(lfp, 3);
						err = nansem(lfp, 3);
					end
					col = getColor(condID);
					plots(condID) = errorbar(1:3, avg, err, '-o', ...
						'color', col, 'markerfacecolor', col, 'markersize', 4, ...
						'linewidth', 1.5);
				end

				axis square tight;
				xticks(1:3);
				xticklabels({'Pre', 'Peri', 'Post'});
				xlim([.75, 3.25]);
				xlabel('');
% 				ylim([0,vectorUL]);
				ylabel(['RMS of ' bandName ' [dB]']);
				if strcmpi(a.type, 'summary')
					loc = 'northeast';
				else
					loc = 'northeastoutside';
				end
				legend(plots, condsStr, 'location', loc);
				title(u.label);
				

			% Neurometric d'
			elseif strcmpi(plotName, 'dprime') || ...
					strcmpi(plotName, 'dprime cqmean') || ...
					strcmpi(plotName, 'dprime cqsum') || ...
					strcmpi(plotName, 'dprime mqmean')
				dPrimeErr = [];
				if strcmpi(plotName, 'dprime')
					plotTitle = 'Neurometric d''';
					dPrime = u.dPrime;
				elseif strcmpi(plotName, 'dprime cqmean')
					plotTitle = 'Neurometric d'' Cumulative Quadratic Mean';
					dPrime = u.dPrimeCQMean;
				elseif strcmpi(plotName, 'dprime cqsum')
					plotTitle = 'Neurometric d'' Cumulative Quadratic Sum';
					dPrime = u.dPrimeCQSum;
				elseif strcmpi(plotName, 'dprime mqmean')
					plotTitle = 'Neurometric d'' Moving Quadratic Mean';
					dPrime = u.dPrimeMQMean;
				end
				sameYLim = true;

				plots = zeros(u.condCount,1);
				patches = zeros(u.condCount,1);
				axis square tight;
				for condID = 2:u.condCount
					tab = u.psthCenters;

					dp = dPrime{condID,scoreID};
					if strcmpi(a.type, 'summary')
						dp = vertcat(dp);
						if ~strcmpi(subset, 'all')
							msk = u.(subset){condID,scoreID}==true;
							dp = dp(msk, :);
						end
						avg = nanmean(dp, 1);
						err = nansem(dp, 1);
					else
						avg = dp;
					end

					if isempty(avg); continue; end

					col = getColor(condID);
					plots(condID) = plot(tab, avg, 'color', col, ...
						'linewidth', 2);
					if strcmpi(a.type, 'summary')
						patches(condID) = patch([tab fliplr(tab)], ...
							[avg+err fliplr(avg-err)], ...
							col, 'edgecolor', 'none');
						alpha(patches(condID), .2);
					end
				end

				% push ribbons to the back of line plots
				for condID = u.condCount:-1:2
					if patches(condID)
						uistack(patches(condID),'bottom');
					end
				end

				if all(plots==0)
					subplots{end} = [];
				end

				ylimits = ylim;

				markTarget(u);

				xticks(u.viewBounds(1):1:u.viewBounds(2));
% 				xticks(u.psthCenters(1:50:length(u.psthCenters)));
% 				xticklabels(-1:.5:2);
				if strcmpi(a.type, 'summary')
					xlim([-.3, 1.3]);
% 					ylim([0, 0.15]);
				else
% 					xlim(u.viewBounds);
					xlim([-.3, 2]);
% 					ylim(ylimits);
% 					ylim([0 ylimits(2)]);
% 					ylim([0 .3]);
				end
				ylim([0 ylimits(2)]);
				ylim([0, 0.15]);
				sameYLim = false;

				ylabel('Sensitivity index (d'')');
				xlabel('Time (s)');
				msk = plots~=0;
				legend(plots(msk), condsStr(msk), ...
					'location', 'northwest');
				title(u.label);


			% Behavioral d'
			elseif strcmpi(plotName, 'dprime behavior')
				plotTitle = 'Behavioral d''';
% 				sameYLim = true;

				plots = zeros(length(u.targetFreqs),1);
				patches = zeros(length(u.targetFreqs),1);

				for freqID = 1:length(u.targetFreqs)
					levelIDs = 1:length(u.targetLevels);
					% Add nogo
					condIDs = (freqID-1)*length(u.targetLevels)+levelIDs+1;
					if strcmpi(a.type,'summary')
						col = colors2{unitID,end};
						avg = zeros(size(condIDs));
						err = zeros(size(condIDs));
						for i = 1:length(condIDs)
							condID = condIDs(i);
							dPrime = u.dPrimeBehavior{condID};
							if ~strcmpi(subset, 'all')
								msk = u.(subset){condID,1}==true;
								dPrime = dPrime(msk);
							end
							avg(i) = nanmean(dPrime);
							err(i) = nansem(dPrime);% / sqrt(length(dPrime));
						end

% 						patches(freqID) = patch([snr fliplr(snr)], ...
% 							[avg+err fliplr(avg-err)], ...
% 							col, 'edgecolor', 'none');
% 						alpha(patches(freqID), .2);
					else
						col = getColor(freqID+2);
						a = calculatePerformance(a);
						avg = [a.dPrimeBehavior{condIDs}];
					end
% 					plots(freqID) = plot(snr, avg, '-o', 'color', col, ...
% 						'linewidth',2);
					plots(freqID) = errorbar(snr, avg, err, '-o', ...
						'color', col, 'markerfacecolor', col, 'markersize', 4, ...
						'linewidth', 1.5);
				end

				% push ribbons to the back of line plots
				for freqID = length(u.targetFreqs):-1:1
					if patches(freqID)
						uistack(patches(freqID),'bottom');
					end
				end

				axis square tight;
% 				xticklabels(levelsStr);
				xticks(snr)
				xticklabels(snrStr);
				xlim([min(snr)-1, max(snr)+1]);

				yLim = ylim;
% 				ylim([0 yLim(2)]);
				ylim([0 3.5]);

% 				xlabel(levelLabel);
				xlabel(snrLabel);
				ylabel('Sensitivity index (d'')');
				if length(freqsStr) > 1
					legend(plots, freqsStrHz, 'location', 'northeast');
				end
				title(u.label);


			% Neurometric vs. behavioral d'
			elseif strcmpi(plotName, 'dprime neuro/behav')
				plotTitle = 'Neurometric vs. behavioral d''';
				sameXLim = true;
				sameYLim = true;

				if ~strcmpi(a.type, 'summary')
					error('Only for summary analysis');
				end
				if length(u.targetFreqs)>1
					error('Only one target frequency is allowed');
				end

				plots = zeros(u.condCount,1);
				axis square tight;

				uA = a.units{1};
				getShade = @(condID)[.6 .6 .7] * ...
					(1-(condID-2)/(u.condCount-2)) + [0 0 .3];

				for condID = 2:u.condCount
% 					[~, i] = min(abs(u.psthCenters-u.targetDuration));
					peri = 0<=u.psthCenters & ...
						u.psthCenters<=u.targetDuration;
					dpNeuro = vertcat(u.dPrimeCQMean{condID,1});
					dpNeuro = max(dpNeuro(:, peri), [], 2)';
					dpBehav = uA.dPrimeBehavior{condID};
					sessionIDs = uA.sessionIDs{condID,1};

					if ~strcmpi(subset, 'all')
						msk = u.(subset){condID,1}==true;
						dpNeuro = dpNeuro(msk);
						dpBehav = dpBehav(msk);
						sessionIDs = sessionIDs(msk);
					end

					groups = findgroups(sessionIDs);
					dpNeuro = splitapply(@(x)sum(maxk(x,5)), ...
						dpNeuro, groups);
					dpBehav = splitapply(@mean, dpBehav, groups);

					plots(condID) = plot(dpBehav, dpNeuro, '.', ...
						'markersize', 15, ...
						...'color', getColor(condID));
						...'color', getShade(condID));
						'color', colors2{unitID, condID});
				end

				xLim = xlim;
				xlim([0 xLim(2)]);
				yLim = ylim;
				ylim([0 yLim(2)]);
				xlabel('Behavioral d''');
				ylabel('Neurometric d''');
				msk = plots~=0;
				legend(plots(msk), condsStr(msk), ...
					'location', 'northwest');
				title(u.label);


			% Vector strength as a function of level at 10 Hz
			elseif strcmpi(plotName, 'vs 10')
				plotTitle = 'Vector strength at 10 Hz';

				plots = zeros(u.condCount,1);
				patches = zeros(u.condCount,1);
				bins = 1:size(u.vsBins,1);
				freq = u.vsFreqs==10;
				for condID = 1:u.condCount
% 					if condID >= u.condCount-2; continue; end
					if strcmpi(a.type, 'summary')
						vs = squeeze(u.vs{condID,scoreID}(:,:,freq));
						if ~strcmpi(subset, 'all')
							msk = u.(subset){condID,scoreID}==true;
							vs = vs(msk,:);
						end
						avg = nanmean(vs, 1);
						err = nansem(vs, 1);

						if isempty(avg); continue; end

						col = getColor(condID);
% 						plots(condID) = plot(bins, avg, ...
% 							'color', col, 'linewidth', 2);
% 						patches(condID) = patch([bins fliplr(bins)], ...
% 							[avg+err fliplr(avg-err)], ...
% 							col, 'edgecolor', 'none');
% 						alpha(patches(condID), .2);
						plots(condID) = errorbar(bins, avg, err, '-o', ...
							'color', col, 'markerfacecolor', col, 'markersize', 4, ...
							'linewidth', 1.5);
					else
						strength = u.vs{condID,scoreID}(:,freq);
						pval = u.vsPVal{condID,scoreID}(:,freq);
% 						zscore = [u.vsZScore{ ...
% 							condID,scoreID}{:,freq}];
						sig = pval < .001;
% 						thr = abs(zscore) > 1;
						plots(condID) = plot(bins, strength, ...
							'color', getColor(condID), ...
							'linewidth', 2);
% 						plot(bins(sig & ~thr), strength(sig & ~thr),'x',...
% 							'color', getColor(condID));
						plot(bins(sig), strength(sig), '*', ...
							'color', getColor(condID));
					end
				end

				% push ribbons to the back of line plots
				for condID = u.condCount:-1:1
					if patches(condID)
						uistack(patches(condID),'bottom');
					end
				end

				axis square tight;
				xlim([.9, bins(end)+.1]);
				xticks(bins);
				if strcmp(u.vsBinNames{2}, 'Intra')
					u.vsBinNames{2} = 'Peri';
				end
				xticklabels(u.vsBinNames);
				ylim([0,vectorUL]);
				ylabel('Vector strength at 10 Hz');
				if strcmpi(a.type, 'summary')
					loc = 'northeast';
				else
					loc = 'northeastoutside';
				end
				msk = plots~=0;
				legend(plots(msk), condsStr(msk), 'location', loc);
				title(u.label);


			% Running vector strength at 10 Hz as a function of time and level
			elseif strncmpi(plotName, 'vs 10 running', 13)
				if contains(plotName, 'phase')
					plotTitle = 'Running vector phase at 10 Hz';
					field = 'vs10Phase';
				else
					plotTitle = 'Running vector strength at 10 Hz';
					field = 'vs10';
				end

				plots = zeros(u.condCount,1);
				patches = zeros(u.condCount,1);
				times = u.vs10Times;
				for condID = 1:u.condCount
					if strcmpi(a.type, 'summary')
						vs = u.(field){condID,scoreID};
						if ~strcmpi(subset, 'all')
							msk = u.(subset){condID,scoreID}==true;
							vs = vs(msk,:);
						end
						if contains(plotName, 'phase')
							vs = vs * 180 / pi;
						end
						avg = nanmean(vs, 1);
						err = nansem(vs, 1);

						if isempty(avg); continue; end

						col = getColor(condID);
						plots(condID) = plot(times, avg, ...
							'color', col, 'linewidth', 2);
						patches(condID) = patch( ...
							[times fliplr(times)], ...
							[avg+err fliplr(avg-err)], ...
							col, 'edgecolor', 'none');
						alpha(patches(condID), .2);
					else
						vs = u.(field){condID,scoreID};
						if contains(plotName, 'phase')
							vs = vs * 180 / pi;
						end
						plots(condID) = plot(times, vs, ...
							'color', getColor(condID), ...
							'linewidth', 2);
						pval = u.vs10PVal{condID,scoreID};
						sig = pval < .001;
						plot(times(sig), vs(sig), '*', ...
							'color', getColor(condID));
					end
				end

				% push ribbons to the back of line plots
				for condID = u.condCount:-1:1
					if patches(condID)
						uistack(patches(condID),'bottom');
					end
				end

				markTarget(u);

				axis square tight;
				if contains(plotName, 'phase')
					ylim([-90,90]);
					ylabel('Vector phase [\circ]');
				else
					ylim([0,vectorUL]);
					ylabel('Vector strength at 10 Hz');
				end
				if strcmpi(a.type, 'summary')
					loc = 'northeast';
				else
					loc = 'northeastoutside';
				end
				msk = plots~=0;
				legend(plots(msk), condsStr(msk), 'location', loc);
				title(u.label);


			% Vector strength vs frequency for the given bin
			elseif strncmpi(plotName, 'vs', 2)
				if strcmp(u.vsBinNames{2}, 'Intra') % compatibility
					u.vsBinNames{2} = 'Peri';
				end
				binID = find(strcmpi(u.vsBinNames, ...
					plotName(length('vs')+2:end)));
				binName = u.vsBinNames{binID};

				plotTitle = [binName '-stimulus vector strength'];

				plots = zeros(u.condCount,1);

				for condID = 1:u.condCount
					if strcmpi(a.type, 'summary')
						% hack: showing average of all bins
% 						vs = squeeze(mean(u.vs{condID,scoreID}, 2));
						vs = squeeze(u.vs{condID,scoreID}(:,binID,:));
						if ~strcmpi(subset, 'all')
							msk = u.(subset){condID,scoreID}==true;
							vs = vs(msk,:);
						end
						avg = nanmean(vs, 1);
						err = nansem(vs, 1);

						if isempty(avg); continue; end

						col = getColor(condID);
						plots(condID) = plot(u.vsFreqs, avg, ...
							'color', col, 'linewidth', 1.5);
						patches(condID) = patch( ...
							[u.vsFreqs fliplr(u.vsFreqs)], ...
							[avg+err fliplr(avg-err)], ...
							col, 'edgecolor', 'none');
						alpha(patches(condID), .2);

					else
						strength = u.vs{condID,scoreID}(binID,:);
						pval     = u.vsPVal{condID,scoreID}(binID,:);
	% 					zscore   = [u.vsZScore{condID,scoreID}{binID,:}];
						sig      = pval < .001;
	% 					thr      = abs(zscore) > 1;
						plots(condID) = plot(u.vsFreqs, strength, ...
							'color', getColor(condID), 'linewidth',1.5);
	% 					plot(u.vsFreqs(sig & ~thr), strength(sig & ~thr), ...
	% 						'x', 'color', getColor(condID));
						plot(u.vsFreqs(sig), strength(sig), ...
							'*', 'color', getColor(condID));
					end
				end

				axis square tight;
				ylim([0,vectorUL]);
				xlabel('Base frequency (Hz)');
				ylabel(['Vector strength (' binName ')']);
				if strcmpi(a.type, 'summary')
					loc = 'northeast';
				else
					loc = 'northeastoutside';
				end
				legend(plots, condsStr, 'location', loc);
				title(u.label);


			% MTS at 10Hz as a function of level
			elseif strcmpi(plotName, 'mts 10')
				plotTitle = 'MTS at 10 Hz';
				sameYLim = true;

				freqs = 9.5<=u.mtsFreqs & u.mtsFreqs<=10.5;
				bins = 1:length(u.vsBins);

				for condID = 1:u.condCount
					if strcmpi(a.type, 'summary')
						mts = u.mts{condID,scoreID}(:,:,freqs);
						mts = 10*log10(mts);
						mts = squeeze(mean(mts, 3));
						if ~strcmpi(subset, 'all')
							msk = u.(subset){condID,scoreID}==true;
							mts = mts(msk,:);
						end
						err = nansem(mts, 1);
						mts = nanmean(mts, 1);
					else
						mts = u.mts{condID,scoreID}(:,freqs);
						mts = 10*log10(mts);
						mts = mean(mts, 2);
						err = nan(size(mts));
					end
					
					errorbar(bins, mts, err, '-o', ...
						'color', getColor(condID), ...
						'markerfacecolor', getColor(condID), ...
						'markersize', 4, ...
						'linewidth', 1.5);
				end

				axis square tight;
				xticks(bins);
				xticklabels(u.vsBinNames);
				xlim([min(bins)-.25 max(bins)+.25]);
% 				xlabel(snrLabel);
				ylabel('MTS power at 10 Hz [dB]');
				if strcmpi(a.type, 'summary')
					loc = 'northeast';
				else
					loc = 'northeastoutside';
				end
				legend(condsStr, 'location', loc);
				title(u.label);


			% multi-taper spectrum
			elseif strncmpi(plotName, 'mts', 3)
				binID = find(strcmpi(u.vsBinNames, ...
					plotName(length('mts')+2:end)));
				binName = u.vsBinNames{binID};

				plotTitle = [binName '-stimulus MTS'];

				plots = zeros(u.condCount, 1);
				patches = zeros(u.condCount, 1);
				axis square tight;
				sameYLim = true;

				for condID = 1:u.condCount
					if strcmpi(a.type, 'summary')
						mts = squeeze(u.mts{condID,scoreID}(:,binID,:));
						if ~strcmpi(subset, 'all')
							msk = u.(subset){condID,scoreID}==true;
							mts = mts(msk, :);
						end
						mts = 10*log10(mts);
						avg = nanmean(mts, 1);
						err = nansem(mts, 1);
					else
						avg = 10*log10(u.mts{condID,scoreID}(binID,:));
					end
					avg = avg - median(avg(20<u.mtsFreqs));
					col = getColor(condID);
					freqs = u.mtsFreqs;
					plots(condID) = plot(freqs, avg, ...
						'color', col, ...
						'linewidth', 1.5);
					if strcmpi(a.type, 'summary')
						patches(condID) = patch([freqs fliplr(freqs)], ...
							[avg+err fliplr(avg-err)], ...
							col, 'edgecolor', 'none');
						alpha(patches(condID), .2);
					end
				end

				% push ribbons to the back of line plots
				for condID = u.condCount:-1:1
					if patches(condID)
						uistack(patches(condID),'bottom');
					end
				end

% 				axis square tight;
				xlabel('Frequency');
				ylabel('MTS power (Peri)');
				xticks(10:10:40);
				ylim([-2 7]);
				if strcmpi(a.type, 'summary')
					loc = 'northeast';
				else
					loc = 'northeastoutside';
				end
				legend(plots, condsStr, 'location', loc);
				title(u.label);


			% Plot RLF
			elseif strcmpi(plotName, 'rlf')
				plotTitle = 'RLF';

				for freqID = 1:length(u.targetFreqs)
					rlf = u.rlf{freqID,scoreID};
					rlf = [u.firingMean{1,scoreID}, rlf]; % Add nogo
					plot(snrNogo, rlf, 'color', getColor(freqID));
				end

				axis square tight;
				xticks(snrNogo);
				xticklabels(snrNogoStr);
				xlabel(snrLabel);
				ylabel('Mean firing rate (1/s)');
				if length(freqsStr) > 1
					legend(freqsStrHz, 'location', 'northeastoutside');
				end
				title(u.label);


			% Plot mean and max of firing rate
			elseif strcmpi(plotName, 'firing max') || ...
					strcmpi(plotName, 'firing mean')
				if strcmpi(plotName, 'firing max')
					plotTitle = 'Maximum firing rate';
				elseif strcmpi(plotName, 'firing mean')
					plotTitle = 'Average firing rate';
				end
				sameYLim = true;

				plots = zeros(length(u.targetFreqs),1);
				patches = zeros(length(u.targetFreqs),1);

				for freqID = 1:length(u.targetFreqs)
					levelIDs = 1:length(u.targetLevels);
					% Add nogo
					condIDs = [1, (freqID-1)*length(u.targetLevels) + ...
						levelIDs+1];
					col = getColor(freqID);
					x = snrNogo;
					if strcmpi(a.type,'summary')
						avg = zeros(size(condIDs));
						err = zeros(size(condIDs));
						for i = 1:length(condIDs)
							condID = condIDs(i);
							if strcmpi(plotName, 'firing max')
								firing = u.firingMax{condID,scoreID};
							elseif strcmpi(plotName, 'firing mean')
								firing = u.firingMean{condID,scoreID};
							end

							if ~strcmpi(subset, 'all')
								msk = u.(subset){condID,scoreID}==true;
								firing = firing(msk);
							end
							avg(i) = nanmean(firing);
							err(i) = nansem(firing);
						end

						patches(freqID) = patch([x fliplr(x)], ...
							[avg+err fliplr(avg-err)], ...
							col, 'edgecolor', 'none');
						alpha(patches(freqID), .2);
					else
						if strcmpi(plotName, 'firing max')
							avg = [u.firingMax{condIDs,scoreID}];
						elseif strcmpi(plotName, 'firing mean')
							avg = [u.firingMean{condIDs,scoreID}];
						end
					end
					plots(freqID) = plot(x, avg, 'color', col, ...
						'linewidth',3);
				end

				% push ribbons to the back of line plots
				for freqID = length(u.targetFreqs):-1:1
					if patches(freqID)
						uistack(patches(freqID),'bottom');
					end
				end

				axis square tight;
				xticks(snrNogo);
				xticklabels(snrNogoStr);
% 				ylim([0,firingUL]);
				xlabel(snrLabel);
				ylabel([plotTitle ' (1/s)']);
				if length(freqsStr) > 1
					legend(plots, freqsStrHz, 'location', 'northeastoutside');
				end
				title(u.label);


			% Plot MFSL
			elseif strcmpi(plotName, 'mfsl')
				plotTitle = 'MFSL';
				sameYLim = true;

				plots = zeros(length(u.targetFreqs),1);
				patches = zeros(length(u.targetFreqs),1);

				for freqID = 1:length(u.targetFreqs)
					levelIDs = 1:length(u.targetLevels);
					% Add nogo
					condIDs = [1, (freqID-1)*length(u.targetLevels) + ...
						levelIDs+1];
					x = snrNogo;
					if strcmpi(a.type,'summary')
						col = colors2{unitID,end};
						avg = zeros(size(condIDs));
						err = zeros(size(condIDs));
						for i = 1:length(condIDs)
							condID = condIDs(i);
							mfsl = u.mfsl{condID,scoreID};
							if ~strcmpi(subset, 'all')
								msk = u.(subset){condID,scoreID}==true;
								mfsl = mfsl(msk);
							end
							mfsl(~isfinite(mfsl)) = [];
							avg(i) = nanmean(mfsl);
							err(i) = nansem(mfsl);
						end
						plots(freqID) = errorbar(x, avg, err, ...
							'.-', 'color', col, 'linewidth', 2, ...
							'markersize', 20);
					else
						col = getColor(freqID);
						avg = [u.mfslPhase{condIDs,scoreID}];
						plots(freqID) = plot(x, avg, ...
							'.-', 'color', col, 'linewidth', 2, ...
							'markersize', 20);
					end
				end

				% push ribbons to the back of line plots
				for freqID = length(u.targetFreqs):-1:1
					if patches(freqID)
						uistack(patches(freqID),'bottom');
					end
				end

				axis square tight;
				xlim([min(snrNogo)-2.5, max(snrNogo)+2.5]);
				xticks(snrNogo);
				xticklabels(snrNogoStr);
				ylimits = ylim();
				ylim([0, ylimits(2)]);
				xlabel(snrLabel);
				ylabel('MFSL (ms)');
				if length(freqsStr) > 1
					legend(plots, freqsStrHz, 'location', 'northeast');
				end
				title(u.label);


			% plot MFSL phase
			elseif strcmpi(plotName, 'mfsl phase')
				plotTitle = 'MFSL Phase';
				sameYLim = true;

				plots = zeros(length(u.targetFreqs),1);
				patches = zeros(length(u.targetFreqs),1);

				for freqID = 1:length(u.targetFreqs)
					levelIDs = 1:length(u.targetLevels);
					% Add nogo
					condIDs = [1, (freqID-1)*length(u.targetLevels) + ...
						levelIDs+1];
					x = snrNogo;
					if strcmpi(a.type,'summary')
						col = colors2{unitID,end};
						avg = zeros(size(condIDs));
						err = zeros(size(condIDs));
						for i = 1:length(condIDs)
							condID = condIDs(i);
							phase = u.mfslPhase{condID,scoreID};
							if ~strcmpi(subset, 'all')
								msk = u.(subset){condID,scoreID}==true;
								phase = phase(msk);
							end
							phase(~isfinite(phase)) = [];
							avg(i) = nanmean(phase);
							err(i) = nansem(phase);
						end
						plots(freqID) = errorbar(x, avg, err, ...
							'.-', 'color', col, 'linewidth', 2, ...
							'markersize', 20);
					else
						col = getColor(freqID);
						avg = [u.mfslPhase{condIDs,scoreID}];
						plots(freqID) = plot(x, avg, ...
							'.-', 'color', col, 'linewidth', 2, ...
							'markersize', 20);
					end
				end

				axis square tight;
				xlim([min(snrNogo)-2.5, max(snrNogo)+2.5]);
				xticks(snrNogo);
				xticklabels(snrNogoStr);
% 				ylimits = ylim();
% 				ylim([0, ylimits(2)]);
				ylim([0 360]);
				xlabel(snrLabel);
				ylabel('MFSL Phase [\circ]');
				if length(freqsStr) > 1
					legend(plots, freqsStrHz, 'location', 'northeast');
				end
				title(u.label);


			% violin plot of MFSL
			elseif strcmpi(plotName, 'mfsl violin')
				plotTitle = 'MFSL Violin';
				if ~strcmpi(a.type, 'summary')
					error('Only for summary analysis');
				end
				sameYLim = true;

				plots = zeros(1,1);
				mfsl = cell(1,u.condCount);
				for condID = 1:u.condCount
					mfsl{condID} = u.mfsl{condID,scoreID} * 1000;
					if ~strcmpi(subset, 'all')
						msk = u.(subset){condID,scoreID}==true;
						mfsl{condID} = mfsl{condID}(msk);
					end
					mfsl{condID}(~isfinite(mfsl{condID})) = [];
				end
				try
				violin(mfsl);
				catch
					disp('err')
				end

				axis square tight;
				xticks(1:u.condCount);
				xticklabels(snrNogoStr);
				xlabel(snrLabel);
				ylabel('MFSL (ms)');
				ylim([0 200]);
% 				legend(plots, freqsStrHz, 'location', 'northeastoutside');
				title(u.label);


			% Plot mutual information
			elseif strcmpi(plotName, 'mutual info')
				plotTitle = 'Mutual information';
				mutualInfo = vertcat(u.mutualInfo{:});

				if length(u.targetLevels)==1 && length(u.targetFreqs)>1
					plot(1:length(u.targetFreqs), ...
						[mutualInfo{2:end, scoreID}], ...
						'color', getColor(1));
					xticks(1:length(u.targetFreqs));
					xticklabels(freqsStr);
					xlabel(freqLabel)
% 					leg = legend(levelsStr);
% 					title(leg, levelLabel);
					leg = legend(snrStr);
					title(leg, snrLabel);

				else
					for freqID = 1:length(u.targetFreqs)
						levelIDs = 1:length(u.targetLevels);
						condIDs = (freqID-1)*length(u.targetLevels) ...
							+ levelIDs + 1;
						plt = plot(u.targetLevels, ...
							[mutualInfo{condIDs, scoreID}], ...
							'color', getColor(freqID));
						if length(u.targetLevels)==1
							plt.Marker = 'x';
						end
					end
					xticks(snr);
					xlabel(snrLabel);
					leg = legend(freqsStrHz);
					title(leg, freqLabel);
				end

				axis square tight;
				ylim([0, 1]);
				ylabel('Mutual information');
				leg.Location = 'northeastoutside';
				title(u.label);

			else
				error('Invalid plot name');
			end
		end

	catch err
		if ~strcmpi(err.identifier, 'my:break')
			if exist('plotTitle', 'var')
				plotTitle = ['[ERROR] ' plotTitle];
			else
				plotTitle = '[ERROR]';
			end
			disp(getReport(err));
		end
	end

	%% finalize plots and add master title
	sameXYLim(subplots, sameXLim, sameYLim);
	sameXYLim(subplots2, sameXLim, sameYLim);

	% Get all file names
	if any(strcmpi(a.type, {'session', 'datafile'}))
		pages = ceil(a.unitCount/16);
		gos   = sum(a.trialCountPerCond(2:end));
		nogos = a.trialCountPerCond(1);
		if isfield(a, 'dataFiles')
			for i = 1:length(a.dataFiles)
				dataFile = [dataFile, a.dataFiles{i}];
				if i ~= length(a.dataFiles)
					if mod(i,2)==0
						dataFile = [dataFile, newline];
					else
						dataFile = [dataFile, ',  '];
					end
				end
			end
		else
			dataFile = a.dataFile;
		end
		mtitle = sprintf( ...
			['%s, Masker: %s @ %g dB SPL, Go: %d, Nogo: %d\n%s\n' ...
			'Analysis %d/%d [\\leftarrow\\rightarrow], ' ...
			'Plot %d/%d [\\uparrow\\downarrow], ' ...
			'Page %d/%d [\\Uparrow\\Downarrow], %s trials [1-5]'], ...
			plotTitle, a.maskerFile, a.maskerLevel, gos, nogos, dataFile, ...
			d.analysisID, length(d.analysis), ...
			d.plotID, length(d.plotNames), ...
			d.pageID, ceil(a.unitCount/16), d.scores{scoreID});
		figtitle = sprintf('%s for %s', plotTitle, dataFile);

	elseif strcmp(a.type, 'units')
		mtitle = sprintf('Analysis %d/%d, Units', ...
			d.analysisID, length(d.analysis));
		figtitle = mtitle;

	elseif strcmpi(a.type, 'summary')
		sessionCount = length(unique(a.units{1}.sessionIDs{1}));
		animalNames = unique(a.animalNames);
		animalInfo = strjoin(animalNames, ', ');

		levelsNogoStrdB   = ['Nogo', cellfun(@(a)num2str(a,'%g dB' ),...
			num2cell(a.targetLevels),'un',0)];

		unitCount = cellfun(@(a,b)sprintf('%s: %d', a,b), ...
			levelsNogoStrdB, a.unitCountPerCond, 'uniformoutput', false);
		unitCount = strjoin(unitCount, ', ');

		if strcmpi(subset, 'all')
			subsetInfo = 'Showing target responding units';
		elseif strcmpi(subset, 'tonic')
			subsetInfo = 'Showing tonic units';
		elseif strcmpi(subset, 'phasic')
			subsetInfo = 'Showing phasic units';
		elseif strcmpi(subset, 'phasicSuppressing')
			subsetInfo = 'Showing phasic suppressing units';
		elseif strcmpi(subset, 'phasicEnhancing')
			subsetInfo = 'Showing phasic enhancing units';
		elseif strcmpi(subset, 'phasicNoChange')
			subsetInfo = 'Showing phasic no-change units';
		end
		subsetInfo = [subsetInfo ' [\Uparrow\Downarrow], '];

		mtitle = sprintf(...
			['%s analysis summary, %s, %d sessions, %d animals: %s\n' ...
			'%d target responding (%d single, %d multi), %d tonic, ' ...
			'%d phasic, %d phasic suppressing, %d phasic enhancing & ' ...
			'%d phasic no-change units\n' ...
			... 'Unit count per condition: %s\n' ...
			'Plot %d/%d [\\uparrow\\downarrow], %s%s trials [1-5]'], ...
			a.spikeConfig, plotTitle, sessionCount, ...
			length(animalNames), animalInfo, ...
			a.targetRespondingUnits, a.singleUnits, a.multiUnits, ...
			a.tonicUnits, a.phasicUnits, a.phasicSuppressingUnits, ...
			a.phasicEnhancingUnits, a.phasicNoChangeUnits, ...
			... unitCount, ...
			d.plotID, length(d.plotNames), ...
			subsetInfo, d.scores{scoreID});
		figtitle = sprintf('%s for %s, %s units', plotTitle, animalInfo, subset);
	else
		mtitle = 'Unknown analysis type';
		figtitle = mtitle;
	end

% 	mtitle = sprintf(strtrim(mtitle));
	mtitle = strtrim(mtitle);
% 	disp(mtitle);

	set(gcf, 'name', figtitle);
	axes('Position',[0 0 1 1],'Visible','off');
	text(.5,1, strrep(mtitle, '_', '\_'), 'horizontalalignment', 'center', ...
		'verticalalignment', 'top', ...
		'fontweight', 'bold', 'fontsize',9, 'interpreter','tex');
	uistack(gca, 'bottom');
end

% helper functions
function markTarget(u, markPoke)
	if nargin < 2
		markPoke = true;
	end

	targetRectColor = [0 0 .4 .08];
	targetRectColor2 = targetRectColor .* [1 1 1 .5];
	pokeRectColor = [0 .8 0 .15];
% 	pokeRectColor = [216 229 141 130]/255;

	ylimits = ylim;

	% mark target without onset
	rect = rectangle( ...
		'position', [50e-3 -100 u.targetDuration-100e-3 500], ...
		'facecolor', targetRectColor2, ...
		'linestyle', 'none');
	uistack(rect, 'bottom');

	% mark target duration
	rect = rectangle( ...
		'position', [0 -100 u.targetDuration 500], ...
		'facecolor', targetRectColor, 'linestyle', 'none');
	uistack(rect, 'bottom');

	if markPoke
		% mark poke
		rect = rectangle( ...
			'position', [-.35 -100 .1 500], ...
			'facecolor', pokeRectColor, 'linestyle', 'none');
		uistack(rect, 'bottom');
	end

	ylim(ylimits);
end


function sameXYLim(subplots, sameXLim, sameYLim)
	if ~sameXLim && ~sameYLim; return; end
	xLim = [];
	yLim = [];
	for subplotID = 1:length(subplots)
		ax = subplots{subplotID};
		if isempty(ax); continue; end
		if isempty(xLim)
			xLim = ax.XLim;
		else
			xLim(1) = min(xLim(1), ax.XLim(1));
			xLim(2) = max(xLim(2), ax.XLim(2));
		end
		if isempty(yLim)
			yLim = ax.YLim;
		else
			yLim(1) = min(yLim(1), ax.YLim(1));
			yLim(2) = max(yLim(2), ax.YLim(2));
		end
	end
	for subplotID = 1:length(subplots)
		ax = subplots{subplotID};
		if isempty(ax); continue; end
		if sameXLim; ax.XLim = xLim; end
		if sameYLim; ax.YLim = yLim; end
	end
end
