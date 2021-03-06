function viewAnalysis(analysis)
% in args:
%     analysis (str): path to an analysis file to load and view
%     or
%     analysis (cell array): list of analysis structs to view
	
	if ~exist('analysis', 'var')
		% set this before running
% 		analysis = 'AnalysisNJIT/CMR04Tail.mat';
% 		analysis = 'AnalysisNJIT/CMR02Head.mat';
%  		analysis = 'AnalysisNJIT/CMR05Fluffy-nochew.mat';
% 		analysis = 'AnalysisNJIT/CMR05Fluffy-chew.mat';
% 		analysis = 'AnalysisNJIT/CMR05Tail.mat';

		% >>> for Antje when I'm away <<<
% 		analysis = 'AnalysisNJIT/Aggregate-All-Multi.mat';
% 		analysis = 'AnalysisNJIT/Aggregate-All-Single.mat';
 		%analysis = 'AnalysisNJIT/Summary-All-Multi.mat';
		analysis = 'AnalysisNJIT/Summary-All-Single.mat';

% 		analysis = 'AnalysisNJIT/IMold.mat';
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
		data.plotNames = {'psth err', 'dprime cqmean', ...
			...'dprime cqsum', ...
			'dprime neuro/behav', 'dprime behavior', ...
			'vector 10', 'max firing', 'mean firing', ...
			'delta', 'delta/behav', ...
			... 'mfsl'...
			};
	else
		data.plotNames = {'raster', 'psth', 'dprime cqmean', ...
% 			'dprime cqsum', ...
			... 'dprime mqmean', 'dprime', ...
			'vector 10', 'vector pre', 'vector peri', 'vector post', ...
			'rlf', 'mtf', 'mtf 10', 'max firing', 'mfsl', 'mutual info', ...
			'psth err', 'psth heatmap'};
	end
	
	% subset the analysis based on any criteria
	% exc = [];
	% for analysisID = 1:length(data.analysis)
	% 	a = data.analysis{analysisID};
	% 	if ~strcmpi(a.maskerFile, 'supermasker.wav')
	% 		exc = [exc analysisID];
	% 	end
	% end
	% data.analysis(exc) = [];

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



%% key press event of the figure, navigate through analyses and plots
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


%% selected analyses
function refreshPlot(fig, d)
	figure(fig);
	clf;
	
	colors = [
		0.500, 0.500, 0.500;
		0.000, 0.447, 0.741;
		0.850, 0.325, 0.098;
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
	targetRectColor = [0 0 0 .1];
	
	% Unpack data
	if nargin < 2
		d = guidata(fig);
	end
	
	a = d.analysis{d.analysisID};
	plotName = d.plotNames{d.plotID};
	scoreID = d.scoreID;
	pageID = d.pageID;
	subset = d.subsets{d.subsetID};
% 	a.unitCount = 2;
% 	a.units = a.units(a.channels==13 | a.channels==14);

	if strcmpi(a.units{1}.type, 'single')
		if strcmpi(a.type, 'summary')
			firingUL = 7;
		else
			firingUL = 15;
		end
		vectorUL = .5;
	else
		firingUL = 200;
		vectorUL = .6;
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
	
	try
% 		if a.unitCount > 16
% 			error(['Number of units in each analysis struct ' ...
% 				'should not exceed 16']);
% 		end

		if strcmpi(plotName, 'delta')
			plotTitle = '\Delta plots';
			if ~strcmpi(a.type, 'summary')
				error('Only for summary analysis');
			end
			if a.unitCount~=2 || ...
					~strcmpi(a.units{1}.label, 'Active MMR') || ...
					~strcmpi(a.units{2}.label, 'Passive MMR')
				error('Only for active and passive MMR');
			end
			
			uA = a.units{1};
			uP = a.units{2};
			psthCenters = uA.psthCenters;
			targetDuration = uA.targetDuration;
			viewBounds = uA.viewBounds;
			condCount = uA.condCount;
			
			alphaValue = .2;
			sameYLim = true;
			
			
			%% delta AP = active nogo - passive nogo
			condID = 1; % nogo
			psthA = vertcat(uA.psth{condID,scoreID});
			psthP = vertcat(uP.psth{condID,scoreID});
			if ~strcmpi(subset, 'all')
				msk = uA.(subset){condID,scoreID}==true;
				psthA = psthA(msk, :);
				psthP = psthP(msk, :);
			end
			psthA = mean(psthA, 1);
			psthP = mean(psthP, 1);
			
% 			deltaAP = psthA - psthP;

% 			psthADelayed = [zeros(1,43) psthA(1:end-43)];
% 			psthDelayedDiff = psthP - psthADelayed + mean(psthA);
			
			% plot
			subplots{end+1} = subplot(3, condCount, 1);
			hold on;
			axis tight square;
			pltAP = patch([psthCenters flip(psthCenters)], ...
				[psthA flip(psthP)], 'b', 'edgecolor', 'none');
			alpha(pltAP, alphaValue);
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
			
			
			%% delta MA, MP and M
			for condID = 2:condCount
				%% delta MA = active nogo - active go
				psthNogo = vertcat(uA.psth{1,scoreID});
				psthGo = vertcat(uA.psth{condID,scoreID});
				if ~strcmpi(subset, 'all')
					msk = uA.(subset){1,scoreID}==true;
					psthNogo = psthNogo(msk, :);
					msk = uA.(subset){condID,scoreID}==true;
					psthGo = psthGo(msk, :);
				end
				psthNogo = mean(psthNogo, 1);
				psthGo = mean(psthGo, 1);
				deltaMA = psthNogo - psthGo;
				
				subplots{end+1} = subplot(3, uA.condCount, condID);
				hold on;
				axis tight square;
				pltMA = patch([psthCenters flip(psthCenters)], ...
					[psthGo flip(psthNogo)], 'b', 'edgecolor', 'none');
				alpha(pltMA, alphaValue);
				pltNogo = plot(psthCenters, psthNogo, 'r', ...
					'linewidth', 1.5);
				pltGo = plot(psthCenters, psthGo, 'g', ...
					'linewidth', 1.5);
				
				% mark target duration
				markTarget(a);

				xticks(viewBounds(1):1:viewBounds(2));
				xlim(viewBounds);
				ylabel('Firing rate (1/s)');
				xlabel('Time (s)');
				legend([pltNogo, pltGo], {'Nogo', 'Go'});
				title(['{\Delta}MA ' ...
					num2str(uA.targetLevels(condID-1), '%d dB')])
				
				
				%% delta MP = passive nogo - passive go
				psthNogo = vertcat(uP.psth{1,scoreID});
				psthGo = vertcat(uP.psth{condID,scoreID});
				if ~strcmpi(subset, 'all')
					msk = uP.(subset){1,scoreID}==true;
					psthNogo = psthNogo(msk, :);
					msk = uP.(subset){condID,scoreID}==true;
					psthGo = psthGo(msk, :);
				end
				psthNogo = mean(psthNogo, 1);
				psthGo = mean(psthGo, 1);
				deltaMP = psthNogo - psthGo;
				
				subplots{end+1} = ...
					subplot(3, uP.condCount, condID+uP.condCount);
				hold on;
				axis tight square;
				pltMA = patch([psthCenters flip(psthCenters)], ...
					[psthGo flip(psthNogo)], 'b', 'edgecolor', 'none');
				alpha(pltMA, alphaValue);
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
				title(['{\Delta}MP ' ...
					num2str(uP.targetLevels(condID-1), '%d dB')])
				
				
				%% delta M = delta MA / delta PA
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
				title(['{\Delta}M ' ...
					num2str(uP.targetLevels(condID-1), '%d dB')])
			end
			
			% skip to the end
			error('my:break', '');
			
		elseif strcmpi(plotName, 'delta/behav')
			%% delta AP versus behavioral d'
			plotTitle = '{\Delta}AP vs behavioral d'' plots';
			if ~strcmpi(a.type, 'summary')
				error('Only for summary analysis');
			end
			if a.unitCount~=2 || ...
					~strcmpi(a.units{1}.label, 'Active MMR') || ...
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
					condsStr{end+1} = sprintf('%gk %gdB', freq, level);
				end
			end
			
			plots = zeros(condCount,1);
			
			getShade = @(condID)[.7 .7 .7] * ...
					(1-(condID-1)/(condCount-1)) + [0 0 .3];
			
			ax = subplot(1,1,1);
			axis square tight;
			hold on;
			f = fopen('AnalysisNJIT/deltaAP-behav.csv', 'w');
			fprintf(f, ['sessionID, conditionID, conditionLabel, ' ...
				'dPrimeBehav, deltaAP\n']);
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
				
				for i = 1:length(deltaAP)
					fprintf(f, '%d, %d, %s, %g, %g\n', ...
						sessionIDs(find(groups==i, 1)), condID, ...
						condsStr{condID}, dpBehav(i), deltaAP(i));
				end
				
				plots(condID) = plot(dpBehav, deltaAP, '.', ...
						'markersize', 15, ...
						...'color', getColor(condID));
						'color', getShade(condID));
			end
			fclose(f);
			
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

		if strcmpi(a.units{1}.type, 'single')
			unitFrom = (pageID-1)*16+1;
			unitTo = min([pageID*16, a.unitCount]);
		else
			unitFrom = 1;
			unitTo = a.unitCount;
		end
		
		for unitID = unitFrom:unitTo
			u = a.units{unitID};
			
			if ~isfield(u, 'viewBounds') % for older analysis results
				u.viewBounds = [-1, 2];
			end
			
			% 	if f.targetFreqs(1) == 0; f.targetFreqs(1) = .5; end
			condsStr = {'Nogo'};
			for freq = u.targetFreqs
				for level = u.targetLevels
					condsStr{end+1} = sprintf('%gk %gdB', freq, level);
				end
			end
			freqsStr      = cellfun(@(a)num2str(a,'%g'    ),...
				num2cell(u.targetFreqs ),'un',0);
			freqsStrHz    = cellfun(@(a)num2str(a,'%g kHz'),...
				num2cell(u.targetFreqs ),'un',0);
			levelsStr     = cellfun(@(a)num2str(a,'%g'    ),...
				num2cell(u.targetLevels),'un',0);
			levelsStrdB   = cellfun(@(a)num2str(a,'%g dB' ),...
				num2cell(u.targetLevels),'un',0);
			levelsNogo    = [min(u.targetLevels)-10, ...
				u.targetLevels];                   % add nogo to beginning
			levelsNogoStr = ['Nogo', levelsStr];   % add nogo to beginning
			levelsNogoStrdB = ['Nogo', levelsStrdB];% add nogo to beginning

			if any(strcmpi(a.type, {'session', 'datafile'}))
				if strcmpi(a.units{1}.type, 'single')
					pos = unitID-(pageID-1)*16;
				elseif strcmpi(a.version, 'neurobehavior@nyu')
					pos = a.channels(unitID);
				else
					pos = channelMappingA4x4(a.channels(unitID));
				end
				unitCount = 16;
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
							'markersize',1, 'color',getColor(condID));
					end
					yCenters(condID) = ySum + trialCount/2;
					ySum = ySum + trialCount + 1;
					if condID ~= u.condCount
% 						line([-1,2], [ySum ySum], 'color','k', ...
% 							'linewidth',1.5)
					end
				end
				
				% mark target duration
				rect = rectangle( ...
					'position', [0 0 u.targetDuration ySum], ...
					'facecolor', targetRectColor, 'linestyle', 'none');
				uistack(rect, 'bottom');
				
% 				xticks(u.psthCenters(1:50:length(u.psthCenters)));
				xticks(u.viewBounds(1):1:u.viewBounds(2));
				xlim(u.viewBounds);
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
				yticklabels(['Nogo', freqsStr]);
				set(gca, 'ydir', 'normal');
				set(gca, 'ycolor', 'black');
				set(gca, 'ticklength', [0,0]);
				ylabel('Freq (kHz)');
				lim = ylim();

				% right axis shows target levels
				yyaxis right
				ylim(lim);
				yticks(2:u.condCount);
				yticklabels(repmat(u.targetLevels, 1, ...
					length(u.targetFreqs)));
				set(gca, 'ydir', 'normal');
				set(gca, 'ycolor', 'black');
				set(gca, 'ticklength', [0,0]);
				
				xlabel('Time (s)');
				ylabel(levelLabel);
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
						avg = mean(psth, 1);
						err = std(psth, 0, 1) / sqrt(size(psth, 1));
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
					if condID ~= 1 && ~strcmpi(a.type, 'summary')
						dPrime = u.dPrime{condID,scoreID};
						dPrimeOnset  = ...
							sqrt(sum(dPrime(onset).^2));% / sum(onset));
						dPrimePeri = ...
							sqrt(sum(dPrime(peri).^2));% / sum(peri));
						dPrimeOffset = ...
							sqrt(sum(dPrime(offset).^2));% / sum(offset));
						
						if dPrimeOnset > .3
							plot(0, ypos, '*', 'color', getColor(condID));
						end
						if dPrimePeri > .3
							plot(u.targetDuration/2, ypos, ...
								'*', 'color', getColor(condID));
						end
						if dPrimeOffset > .3
							plot(u.targetDuration, ypos, ...
								'*', 'color', getColor(condID));
						end
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
				
				% mark target duration
				rect = rectangle( ...
					'position', [0 0 u.targetDuration firingUL], ...
					'facecolor', targetRectColor, 'linestyle', 'none');
				uistack(rect, 'bottom');
				rect = rectangle( ...
					'position', [50e-3 0 u.targetDuration-100e-3 firingUL], ...
					'facecolor', targetRectColor, 'linestyle', 'none');
				uistack(rect, 'bottom');
				
				xticks(u.viewBounds(1):1:u.viewBounds(2));
% 				xticks(u.psthCenters(1:50:length(u.psthCenters)));
% 				xticklabels(-1:.5:2);
				xlim(u.viewBounds);
				ylim([0,firingUL]);
				ylabel('Firing rate (1/s)');
				xlabel('Time (s)');
				grid on;
				
				msk = plots~=0;
				legend(plots(msk), condsStr(msk), ...
					'location', 'northeastoutside');
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
						avg = mean(dp, 1);
						err = std(dp, 0, 1) / sqrt(size(dp, 1));
					else
						avg = dp;
					end

					if isempty(avg); continue; end
					
					col = getColor(condID);
					plots(condID) = plot(tab, avg, 'color', col, ...
						'linewidth', 3);
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
				
				% mark target duration
				rect = rectangle( ...
					'position', [0 -100 u.targetDuration 200], ...
					'facecolor', targetRectColor, 'linestyle', 'none');
				uistack(rect, 'bottom');
				rect = rectangle( ...
					'position', [50e-3 -100 u.targetDuration-100e-3 200], ...
					'facecolor', targetRectColor, 'linestyle', 'none');
				uistack(rect, 'bottom');
				
				xticks(u.viewBounds(1):1:u.viewBounds(2));
% 				xticks(u.psthCenters(1:50:length(u.psthCenters)));
% 				xticklabels(-1:.5:2);
				if strcmpi(a.type, 'summary')
					xlim([-.3, 1.3]);
% 					ylim([0, 0.05]);
				else
% 					xlim(u.viewBounds);
					xlim([-.3, 2]);
% 					ylim(ylimits);
% 					ylim([0 ylimits(2)]);
% 					ylim([0 .3]);
				end
				ylim([0 ylimits(2)]);
				
				ylabel('Sensitivity index (d'')');
				xlabel('Time (s)');
				msk = plots~=0;
				legend(plots(msk), condsStr(msk), ...
					'location', 'northeastoutside');
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
					col = getColor(freqID);
					x = u.targetLevels;
					if strcmpi(a.type,'summary')
						avg = zeros(size(condIDs));
						err = zeros(size(condIDs));
						for i = 1:length(condIDs)
							condID = condIDs(i);
							dPrime = u.dPrimeBehavior{condID};
							if ~strcmpi(subset, 'all')
								msk = u.(subset){condID,1}==true;
								dPrime = dPrime(msk);
							end
							avg(i) = mean(dPrime);
							err(i) = std(dPrime) / sqrt(length(dPrime));
						end
						
						patches(freqID) = patch([x fliplr(x)], ...
							[avg+err fliplr(avg-err)], ...
							col, 'edgecolor', 'none');
						alpha(patches(freqID), .2);
					else
						a = calculatePerformance(a);
						avg = [a.dPrimeBehavior{condIDs}];
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
				xticks(u.targetLevels);
				xticklabels(levelsStr);
				
				yLim = ([-0.15 0.15]);%ylim;
% 				ylim([0 yLim(2)]);
				
				xlabel(levelLabel);
				ylabel('Sensitivity index (d'')');
				legend(plots, freqsStrHz, 'location', 'northeastoutside');
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
						'color', getShade(condID));
				end
				
				xLim = xlim;
				xlim([0 xLim(2)]);
				yLim = ylim;
				ylim([0 yLim(2)]);
				xlabel('Behavioral d''');
				ylabel('Neurometric d''');
				msk = plots~=0;
				legend(plots(msk), condsStr(msk), ...
					'location', 'northeastoutside');
				title(u.label);

				
			% Vector strength as a function of level at 10 Hz
			elseif strcmpi(plotName, 'vector 10')
				plotTitle = 'Vector strength at 10 Hz';
				
				plots = zeros(u.condCount,1);
				patches = zeros(u.condCount,1);
				bins = 1:size(u.vectorBins,1);
				baseFreq = u.baseFreqs==10;
				for condID = 1:u.condCount
% 					if condID >= u.condCount-2; continue; end
					if strcmpi(a.type, 'summary')
						vs = vertcat(u.vectorStrength{ ...
							condID,scoreID}{:,baseFreq});
						if ~strcmpi(subset, 'all')
							msk = u.(subset){condID,scoreID}==true;
							vs = vs(:,msk);
						end
						avg = mean(vs, 2)';
						err = std(vs, 0, 2)' / sqrt(size(vs, 2));
						
						if isempty(avg); continue; end
						
						col = getColor(condID);
						plots(condID) = plot(bins, avg, ...
							'color', col, 'linewidth', 2);
						patches(condID) = patch([bins fliplr(bins)], ...
							[avg+err fliplr(avg-err)], ...
							col, 'edgecolor', 'none');
						alpha(patches(condID), .2);
					else
						if isempty(u.vectorStrength{condID,scoreID})
							strength = nan(size(bins));
							pval = nan(size(bins));
						else
							strength = [u.vectorStrength{ ...
								condID,scoreID}{:,baseFreq}];
							pval = [u.vectorPVal{ ...
								condID,scoreID}{:,baseFreq}];
						end
% 						zscore = [u.vectorZScore{ ...
% 							condID,scoreID}{:,baseFreq}];
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
% 				xlim([.5, bins(end)+.5]);
				xticks(bins);
				if strcmp(u.vectorBinNames{2}, 'Intra')
					u.vectorBinNames{2} = 'Peri';
				end
				xticklabels(u.vectorBinNames);
				ylim([0,vectorUL]);
				ylabel('Vector strength at 10 Hz');
				msk = plots~=0;
				legend(plots(msk), condsStr(msk), 'location', 'northeastoutside');
				title(u.label);

				
% 			Vector strength as a function of level at 10 Hz
% 			elseif data.plotID==3 || data.plotID==4 || data.plotID==5
% 				binID = data.plotID - 2;
% 				plotName = [u.vectorBinNames{binID} ...
% 					'-stimulus vector strength at 10 Hz'];
% 				
% 				for freqID = 1:length(p.targetFreqs)
% 					arr = [u.vectorStrength{1}{ ...
% 						binID}{u.baseFreqs==10}];    % Nogo
% 					for levelID = 1:length(p.targetLevels)
% 						condID = (freqID-1)*length(p.targetLevels) + ...
% 							levelID+1;
% 						arr(end+1) = u.vectorStrength{condID}{ ...
% 							binID}{u.baseFreqs==10};
% 					end
% 					plot(levelsNogo, arr);
% 				end
% 				
% 				axis square tight;
% 				xticks(levelsNogo);
% 				xticklabels(levelsNogoStr);
% 				ylim([0,.5]);
% 				
% 				xlabel(levelLabel);
% 				ylabel('Vector strength at 10 Hz');
% 				title(u.label);
% 				
% 				legend(freqsStrHz, 'location', 'northeastoutside');


			% Vector strength
			elseif strcmpi( plotName(1:min(length('vector'), ...
					length(plotName))), 'vector')
				if strcmp(u.vectorBinNames{2}, 'Intra')
					u.vectorBinNames{2} = 'Peri';
				end
				binID = find(strcmpi(u.vectorBinNames, ...
					plotName(length('vector')+2:end)));
				binName = u.vectorBinNames{binID};

				plotTitle = [binName '-stimulus vector strength'];
				
				plots = zeros(u.condCount,1);
				
				for condID = 1:u.condCount
					strength = [u.vectorStrength{condID,scoreID}{binID,:}];
					pval     = [u.vectorPVal{condID,scoreID}{binID,:}];
% 					zscore   = [u.vectorZScore{condID,scoreID}{binID,:}];
					sig      = pval < .001;
% 					thr      = abs(zscore) > 1;
					plots(condID) = plot(u.baseFreqs, strength, ...
						'color', getColor(condID));
% 					plot(u.baseFreqs(sig & ~thr), strength(sig & ~thr), ...
% 						'x', 'color', getColor(condID));
					plot(u.baseFreqs(sig), strength(sig), ...
						'*', 'color', getColor(condID));
				end

				axis square tight;
				ylim([0,vectorUL]);
				xlabel('Base frequency (Hz)');
				ylabel(['Vector strength (' binName ')']);
				legend(plots, condsStr, 'location', 'northeastoutside');
				title(u.label);

				
			% Plot RLF
			elseif strcmpi(plotName, 'rlf')
				plotTitle = 'RLF';
				
				for freqID = 1:length(u.targetFreqs)
					rlf = u.rlf{freqID,scoreID};
					rlf = [u.meanFiring{1,scoreID}, rlf]; % Add nogo
					plot(levelsNogo, rlf, 'color', getColor(freqID));
				end
				
				axis square tight;
				xticks(levelsNogo);
				xticklabels(levelsNogoStr);
				xlabel(levelLabel);
				ylabel('Mean firing rate (1/s)');
				legend(freqsStrHz, 'location', 'northeastoutside');
				title(u.label);

				
			% MTF
			elseif strcmpi(plotName, 'mtf')
				plotTitle = 'Peri-stimulus MTF';
				
				for condID = 1:u.condCount
					plot(u.mtfF{condID,scoreID}, ...
						10*log10(u.mtfS{condID,scoreID}), ...
						'color', getColor(condID));
				end
				
				axis square tight;
				xlabel('Frequency');
				ylabel('MTF power (Peri)');
				legend(condsStr, 'location', 'northeastoutside');
				title(u.label);

				
			% MTF at 10Hz as a function of level
			elseif strcmpi(plotName, 'mtf 10')
				plotTitle = 'Peri-stimulus MTF at 10 Hz';
				
				mtfF = u.mtfF{1,scoreID};    % Nogo
				if ~isempty(mtfF)
					fRange = 9.5<=mtfF & mtfF<=10.5;
					mtfS_nogo = mean(u.mtfS{1,scoreID}(fRange)); % Nogo
				else
					mtfS_nogo = nan;
				end

				for freqID = 1:length(u.targetFreqs)
					arr = [mtfS_nogo];
					for levelID = 1:length(u.targetLevels)
						condID = (freqID-1)*length(u.targetLevels) + ...
							levelID+1;
						mtfF = u.mtfF{condID,scoreID};
						if ~isempty(mtfF)
							fRange = 9.5<=mtfF & mtfF<=10.5;
							mtfS = mean(u.mtfS{condID,scoreID}(fRange));
						else
							mtfS = nan;
						end
						arr(end+1) = mean(mtfS);
					end
					plot(levelsNogo, 10*log10(arr), ...
						'color', getColor(freqID));
				end
				
				axis square tight;
				xticks(levelsNogo);
				xticklabels(levelsNogoStr);
				xlabel(levelLabel);
				ylabel('MTF power at 10 Hz (Peri)');
				legend(freqsStrHz, 'location', 'northeastoutside');
				title(u.label);

				
			% Plot mean and max firing rate
			elseif strcmpi(plotName, 'max firing') || ...
					strcmpi(plotName, 'mean firing')
				if strcmpi(plotName, 'max firing')
					plotTitle = 'Maximum firing rate';
				elseif strcmpi(plotName, 'mean firing')
					plotTitle = 'Mean firing rate';
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
					x = levelsNogo;
					if strcmpi(a.type,'summary')
						avg = zeros(size(condIDs));
						err = zeros(size(condIDs));
						for i = 1:length(condIDs)
							condID = condIDs(i);
							if strcmpi(plotName, 'max firing')
								firing = u.maxFiring{condID,scoreID};
							elseif strcmpi(plotName, 'mean firing')
								firing = u.meanFiring{condID,scoreID};
							end
							
							if ~strcmpi(subset, 'all')
								msk = u.(subset){condID,scoreID}==true;
								firing = firing(msk);
							end
							avg(i) = mean(firing);
							err(i) = std(firing) / sqrt(length(firing));
						end
						
						patches(freqID) = patch([x fliplr(x)], ...
							[avg+err fliplr(avg-err)], ...
							col, 'edgecolor', 'none');
						alpha(patches(freqID), .2);
					else
						if strcmpi(plotName, 'max firing')
							avg = [u.maxFiring{condIDs,scoreID}];
						elseif strcmpi(plotName, 'mean firing')
							avg = [u.meanFiring{condIDs,scoreID}];
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
				xticks(levelsNogo);
				xticklabels(levelsNogoStr);
% 				ylim([0,firingUL]);
				xlabel(levelLabel);
				ylabel([plotTitle ' (1/s)']);
				legend(plots, freqsStrHz, 'location', 'northeastoutside');
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
					col = getColor(freqID);
					x = levelsNogo;
					if strcmpi(a.type,'summary')
						avg = zeros(size(condIDs));
						err = zeros(size(condIDs));
						for i = 1:length(condIDs)
							condID = condIDs(i);
							mfsl = u.mfsl{condID,scoreID};
							if ~strcmpi(subset, 'all')
								msk = u.(subset){condID,scoreID}==true;
								mfsl = mfsl(msk);
							end
							avg(i) = mean(mfsl);
							err(i) = std(mfsl) / sqrt(length(mfsl));
						end
						
						patches(freqID) = patch([x fliplr(x)], ...
							[avg+err fliplr(avg-err)], ...
							col, 'edgecolor', 'none');
						alpha(patches(freqID), .2);
					else
						avg = [u.mfsl{condIDs,scoreID}];
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
				xticks(levelsNogo);
				xticklabels(levelsNogoStr);
				xlabel(levelLabel);
				ylabel('MFSL (ms)');
				legend(plots, freqsStrHz, 'location', 'northeastoutside');
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
					leg = legend(levelsStr);
					title(leg, levelLabel);
					
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
					xticks(u.targetLevels);
					xlabel(levelLabel);
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
			plotTitle = '>> ERROR <<';
			disp(getReport(err));
		end
	end
	
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
		
	elseif strcmp(a.type, 'units')
		mtitle = sprintf('Analysis %d/%d, Units', ...
			d.analysisID, length(d.analysis));
		
	elseif strcmpi(a.type, 'summary')
		sessionCount = length(unique(a.units{1}.sessionIDs{1}));
		animalNames = unique(a.animalNames);
		animalInfo = strjoin(animalNames, ', ');
		
		levelsNogoStrdB   = ['Nogo', cellfun(@(a)num2str(a,'%g dB' ),...
			num2cell(a.targetLevels),'un',0)];
		
		unitType = sprintf('%s-unit', a.units{1}.type);
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
			'%d target responding, %d tonic, %d phasic, ' ...
			'%d phasic suppressing, %d phasic enhancing & ' ...
			'%d phasic no-change units\n' ...
			'Unit count per condition: %s\n' ...
			'Plot %d/%d [\\uparrow\\downarrow], %s%s trials [1-5]'], ...
			unitType, plotTitle, sessionCount, ...
			length(animalNames), animalInfo, ...
			a.targetRespondingUnits, a.tonicUnits, ...
			a.phasicUnits, a.phasicSuppressingUnits, ...
			a.phasicEnhancingUnits, a.phasicNoChangeUnits, ...
			unitCount, d.plotID, length(d.plotNames), ...
			subsetInfo, d.scores{scoreID});
	else
		mtitle = 'Unknown analysis type';
	end
	
% 	mtitle = sprintf(strtrim(mtitle));
	mtitle = strtrim(mtitle);
% 	disp(mtitle);
	
	set(gcf, 'name', strrep(mtitle, newline, ', '));
	axes('Position',[0 0 1 1],'Visible','off');
	text(.5,1, strrep(mtitle, '_', '\_'), 'horizontalalignment', 'center', ...
		'verticalalignment', 'top', ...
		'fontweight', 'bold', 'fontsize',9, 'interpreter','tex');
	uistack(gca, 'bottom');
end


function markTarget(a)
	targetRectColor = [0 0 0 .1];
	ylimits = ylim;
	rect = rectangle( ...
		'position', [0 -100 a.targetDuration 200], ...
		'facecolor', targetRectColor, 'linestyle', 'none');
	uistack(rect, 'bottom');
	rect = rectangle( ...
		'position', [50e-3 -100 a.targetDuration-100e-3 200], ...
		'facecolor', targetRectColor, 'linestyle', 'none');
	uistack(rect, 'bottom');
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
