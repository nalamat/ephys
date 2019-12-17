%% set these parameters before running
% file = '../Data/C07Right/C07Right_PositiveCMR_20171116_160010.h5';
% file = '../Data/CMR04Tail/CMR04Tail_PositiveCMR_20180524_150858_Passive_Supermasker50dB_1kTone75dB.h5';
% file = '../Data-Booth1-EARS/CMR03Left/CMR03Left-20180809-140459-MMR-Physiology.h5';
% file = '../Data-Booth1-EARS/CMR02Head/CMR02Head-20180906-103121-MMR-Physiology-Active-1kToneSupermasker.h5';
% file = '../Data-Booth1-EARS/CMR05Fluffy/CMR05Fluffy-20190531-134723-IM-Physiology-Passive-2kBeepGapFlatNoise.h5';
file = '../Data-Booth1-EARS/CMR05Tail/CMR05Tail-20190623-155606-MMR-Physiology-Passive-Supermasker.h5';

timeRange = [0, 40];


%% read h5 file
s = readTrialLog(file);

% EARS
if strcmp(s.version, 'ears')
	speakerNode = '/trace/speaker';
	physNode    = '/trace/physiology';
% Neurobehavior@NJIT
elseif strcmp(s.version, 'neurobehavior@njit')
	speakerNode = [s.rootGroup '/data/trace/speaker' ];
	physNode    = [s.rootGroup '/data/physiology/raw'];
% Neurobheavior@NYU
elseif strcmp(s.version, 'neurobehavior@nyu')
	speakerNode = '';
	physNode    = [s.rootGroup '/data/physiology/raw'];
else
	error('[viewTraces] Unexpected data version');
end

% read in the speaker trace
speaker   = h5read   (file, speakerNode);
speakerFS = h5readatt(file, speakerNode, 'fs');
speaker   = double(speaker);
speakerT  = (1:length(speaker))/speakerFS; % generate speaker time vector
speaker   = speaker / std(speaker) / 20;   % scale
% speaker   = speaker / median(abs(speaker)) / 50;   % scale

% read in the raw physiology data
phys   = h5read   (file, physNode);
physFS = h5readatt(file, physNode, 'fs');
phys   = double(phys);
if strcmp(s.version, 'ears')
	phys = phys';                     % swap time and channel axes
elseif strcmp(s.version, 'neurobehavior@njit')
	phys = phys(:,2:16);              % skip the first channel
end
channelCount = size(phys,2);             % channel count
physT   = (1:size(phys,1))/physFS;    % generate the physiology time vector
% calculate and substract grand mean for each channel
for i = 1:channelCount
	grandMean = mean(phys,2) - phys(:,i)/channelCount;
	phys(:,i) = phys(:,i) - grandMean;
% 	phys(:,i) = phys(:,i);
end
% bandpass data from 300Hz to 6kHz
[b,a] = butter(6,[300 6e3]/(physFS/2),'bandpass');
physFilt = filtfilt(b, a, phys);
% physFilt = phys;
% scale
physFilt = physFilt / mean(std(physFilt)) / 20;
% physFilt = physFilt / median(abs(physFilt(:))) / 50;


%% prepare plot
channelHeight = 1;
if speakerT(end)<timeRange(1); error('Start time out of recording range'); end
if timeRange(end)<speakerT(1); error('End time out of recording range'  ); end
timeRange(1) = max(timeRange(1), speakerT(1));
timeRange(2) = min(timeRange(2), speakerT(end));
legends = {};

% plot speaker trace
figure;
hold on;
speakerRange = timeRange(1)<=speakerT & speakerT<=timeRange(2);
plot(speakerT(speakerRange), speaker(speakerRange)*2, 'y', 'linewidth',2);
legends{end+1} = 'Speaker';

% plot all channels within the specified time range
physRange = timeRange(1)<=physT & physT<=timeRange(2);
for i = 1:size(phys,2)
	plot(physT(physRange), physFilt(physRange,i) - i*channelHeight);
	legends{end+1} = ['Channel' num2str(i)];
end

xlabel('Time (s)');
ylabel('Recorded Signal');
xlim(timeRange);
legend(legends);

for i = 1:length(s.trialLog)
	start    = s.trialLog(i).targetStart;
	stop     = s.trialLog(i).targetStop;
	duration = s.trialLog(i).targetDuration;
	type     = s.trialLog(i).trialType;
	if length(type>=2) && strcmpi(type(1:2), 'go')
		col = [0,1,0,.5];
	elseif length(type>=4) && strcmpi(type(1:4), 'nogo')
		col = [1,0,0,.5];
	else
		fprintf('Invalid trial type %s\n', type);
	end
	if timeRange(1) <= stop || start <= timeRange(2)
		rectangle('position', [start, .75, duration, .75], ...
			'edgecolor', 'none', 'facecolor', col);
	end
end

return;

%% play the recodrings
a1 = audioplayer(physFilt(physRange,8), physFS);
% a2 = audioplayer(speaker*10^(-20/20), speakerFS);
play(a1);
% play(a2);
pause;
stop(a1);
% stop(a2);
