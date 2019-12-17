%% set these parameters before running
% file = '../Data/C07Right/C07Right_PositiveCMR_20171116_160010.h5';
% file = '../Data/CMR04Tail/CMR04Tail_PositiveCMR_20180524_150858_Passive_Supermasker50dB_1kTone75dB.h5';
% file = '../Data-Booth1-EARS/CMR03Left/CMR03Left-20180809-140459-MMR-Physiology.h5';
% file = '../Data-Booth1-EARS/CMR02Head/CMR02Head-20180906-103121-MMR-Physiology-Active-1kToneSupermasker.h5';
file = '../Data-Booth1-EARS/CMR05Fluffy/CMR05Fluffy-20190531-134723-IM-Physiology-Passive-2kBeepGapFlatNoise.h5';

timeRange = [180, 200];


%% read h5 file
a = readTrialLog(file);

% EARS
if strcmp(a.version, 'ears')
	speakerNode = '/trace/mic';
% Neurobehavior@NJIT
elseif strcmp(version, 'neurobehavior@njit')
	speakerNode = [a.rootGroup '/data/trace/mic' ];
% Neurobheavior@NYU
elseif strcmp(a.version, 'neurobehavior@nyu')
	speakerNode = '';
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

%% prepare plot
channelHeight = 1;
if speakerT(end)<timeRange(1); error('Start time out of recording range'); end
if timeRange(end)<speakerT(1); error('End time out of recording range'  ); end
timeRange(1) = max(timeRange(1), speakerT(1));
timeRange(2) = min(timeRange(2), speakerT(end));
legends = {};

% plot speaker trace
figure(1);
hold on;
speakerRange = timeRange(1)<=speakerT & speakerT<=timeRange(2);
plot(speakerT(speakerRange), speaker(speakerRange)*2, 'y', 'linewidth',2);
legends{end+1} = 'Speaker';

xlabel('Time (s)');
ylabel('Recorded Signal');
xlim(timeRange);

return;

%% play the recodrings
a1 = audioplayer(speaker(speakerRange)*10^(-20/20), speakerFS);
play(a1);
pause;
stop(a1);
