%% set data path and file before running

% dataPath = '../Data/';
dataPath = '../Data-Booth1-EARS/';
% dataPath = 'SampleData/';

% dataFile = 'C07Right/C07Right_PositiveCMR_20171116_160010.h5';
% dataFile = ['CMR03Left/' ...
% 'CMR03Left_PositiveCMR_20180710_134708_Active_Supermasker40dB_1kTone.h5'];
% dataFile = ['CMR02Head/' ...
% 'CMR02Head-20180906-103121-MMR-Physiology-Active-1kToneSupermasker.h5'];
% dataFile = ['CMR02Left/' ...
% 'CMR02Left-20181224-144458-MMR-Physiology-Passive-1kToneSupermasker.h5'];
% dataFile = 'CMR02Left/CMR02Left-20181226-161424-MMR-Physiology-Passive.h5';
% dataFile = 'CMR02Left/CMR02Left-20181228-120430-MMR-Physiology-Passive.h5';
% dataFile = 'CMR05Left/CMR05Left-20190116-141507-MMR-Physiology-Passive.h5';
% dataFile = 'CMR05Head/CMR05Head-20190123-161100-MMR-Physiology-Passive.h5';
% dataFile = ['CMR05Fluffy/' ...
% 'CMR05Fluffy-20190420-130127-MMR-Physiology-Passive-1kToneSupermasker.h5'];
% dataFile = ['CMR05Fluffy/' ...
% 'CMR05Fluffy-20190422-121943-MMR-Physiology-Active-1kTon eSupermasker.h5'];
dataFile = ['CMR05Fluffy/' ...
'CMR05Fluffy-20190511-150044-MMR-Physiology-Passive-1kToneSupermasker.h5'];
% 'CMR05Fluffy-20190723-160012-MMR-Physiology-Active-1kToneSupermasker.h5'];
% dataFile = ['CMR05Tail/' ...
% 'CMR05Tail-20190603-161221-MMR-Physiology-Passive-1kToneSupermasker.h5'];
% dataFile = ['CMR05Tail/' ...
% 'CMR05Tail-20190625-143603-MMR-Physiology-Passive-1kToneSupermasker.h5'];


%% load h5 file
warning('off', 'MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');

fprintf('Loading data from %s\n', dataFile);

d = struct();
d.dataPath  = dataPath;
d.dataFile  = dataFile;
d.channels  = 'all';
d.excludeTrials = [];
d.excludeNoisy = false;
d.viewBounds = [-1, 2];

[trialView, d] = readTrialView(d);
d.trialView    = trialView;

d.channelCount      = length(d.channels);
d.spikeThreshold    = d.noiseFloor * 4.8;
d.spikeDuration     = 2e-3;
d.spikeLength       = round(d.spikeDuration * d.fs);
if mod(d.spikeLength,2); d.spikeLength = d.spikeLength+1; end
d.artifactThreshold = d.noiseFloor * 30;
d.artifactDuration  = 10e-3;
d.artifactLength    = round(d.artifactDuration * d.fs);
if mod(d.artifactLength,2); d.artifactLength = d.artifactLength+1; end

d.fileCount = 1;
d.fileID    = 1;
d.trialID   = 1;

%% show figure
fig = figure;
drawnow;
fig.JavaFrame.setMaximized(1);

set(fig, 'WindowKeyPressFcn', @figKeyPress);
guidata(fig, d);
refreshPlot(fig);

%% functions
function figKeyPress(fig, e)
	d = guidata(fig);
	trialID = d.trialID;
	
	switch e.Key
% 		case 'leftarrow'
% 			data.fileID = max([data.fileID-1, 1]);
% 			refresh = true;
% 		case 'rightarrow'
% 			data.fileID = min([data.fileID+1, data.fileCount]);
% 			refresh = true;
		case 'leftarrow' %'uparrow'
			d.trialID = max([d.trialID-1, 1]);
		case 'rightarrow'  %'downarrow'
			d.trialID = min([d.trialID+1, d.trialCount]);
		case 'pageup'
			d.trialID = max([d.trialID-10, 1]);
		case 'pagedown'
			d.trialID = min([d.trialID+10, d.trialCount]);
		case 'home'
			d.trialID = 1;
		case 'end'
			d.trialID = d.trialCount;
		case 'r'
			refreshPlot(fig);
		case 'e'
			fig = figure();
			drawnow;
			size = [1000, 1000];
			screen = get(0, 'screensize');
			fig.OuterPosition = [(screen(3:4)-size)/2 size];
			refreshPlot(fig, d);
	end
	if trialID ~= d.trialID
		guidata(fig, d);
		refreshPlot(fig);
	end
end

function refreshPlot(fig, d)
	figure(fig);
	clf;
	
	% Unpack data
	if nargin < 2
		d = guidata(fig);
	end
	
	scale = 0.3;    % in mV
	
	
	noiseFloor = median(abs([d.trialView{d.trialID, :}]))/0.6745;
	noiseRatio = noiseFloor ./ d.noiseFloor;
	
	
	try
		ax = [];
		for channelID = 1:d.channelCount
			pos = channelMappingA4x4(d.channels(channelID));
			ax(channelID) = subplot(ceil(d.channelCount/4),4,pos);
			hold on;
			
			trace = d.trialView{d.trialID, channelID}';
			time = (1:length(trace))/d.fs - 1;
			plot(time, trace*1e3);    % convert to mV
			
			[spikeTimes, spikeIndices] = extractSpikesFromTrace(trace, ...
				d.fs, d.spikeThreshold(channelID), d.spikeLength, ...
				d.artifactThreshold(channelID), d.artifactLength);
			spikeTimes = spikeTimes + d.viewBounds(1);
			plot(spikeTimes, trace(spikeIndices)*1e3, ...
				'.', 'markersize', 20);
			
			xticks(-1:1:2);
			xticklabels(-1:1:2);
			xlim(d.viewBounds);
			ylim([-scale scale]);

			threshold = [1,1] * d.spikeThreshold(channelID) * 1e3; % to mV
			line(xlim(),  threshold, 'color', 'black', 'linestyle', ':');
			line(xlim(), -threshold, 'color', 'black', 'linestyle', ':');
			
% 			line([0,0], ylim(), 'color', 'black');
% 			line([1,1], ylim(), 'color', 'black');

			xlabel('Time (s)');
			ylabel('Voltage (mV)');
			
% 			noiseFloor1 = d.noiseFloor(channelID);
% 			noiseFloor2 = median(abs(trace))/0.6745;

% 			title(sprintf('Ch %d (%.4f, %.4f, %.2f)', ...
% 				d.channels(channelID), d.noiseFloor(channelID)*1e3, ...
% 				noiseFloor(channelID)*1e3, noiseRatio(channelID)));
			title(sprintf('Ch %d (%.2f)', d.channels(channelID), ...
				noiseRatio(channelID)));
			grid on;
		end
		
	catch err
		disp(getReport(err))
	end
	
	targetFile  = d.trialLog(d.trialID).targetFile;
	targetLevel = d.trialLog(d.trialID).targetLevel;
	maskerFile  = d.trialLog(d.trialID).maskerFile;
	maskerLevel = d.trialLog(d.trialID).maskerLevel;
	if maskerLevel < 0; maskerLevel = 0; end
	if targetLevel < 0; targetLevel = 0; end
	score = d.trialLog(d.trialID).score;
	
	% set master title for the figure
	mtitle = sprintf(['Trial: %d/%d, Target: %s @ %g dB SPL, ' ...
		'Masker: %s @ %g dB SPL, Score: %s, Noise ratio: %.2f\nData file: %s'], ...
			d.trialID, d.trialCount, targetFile, targetLevel, ...
			maskerFile, maskerLevel, score, mean(noiseRatio), d.dataFile);
% 	set(gcf, 'name', mtitle);
	axes('Position',[0 0 1 1],'Visible','off');
	text(.5,1, mtitle, 'horizontalalignment', 'center', ...
		'verticalalignment', 'top', ...
		'fontweight', 'bold', 'fontsize',9, 'interpreter','none');
	uistack(gca, 'bottom');
end
