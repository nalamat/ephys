load('Analysis/CMR05Fluffy22.mat');

a = analysis{2};
u = a.units{10};
condID = 5;
psthBin = .1e-3;
psthWin = 20e-3;
% -1s before onset and +1s after offset of tone
psthEdges = -1-psthBin/2:psthBin:2+psthBin/2;
psthCenters = psthEdges(1:end-1)+psthBin/2;
psthBins = length(psthCenters);

trialCount = u.trialCountPerCond(condID);

psth = zeros(trialCount, psthBins);
win = gausswin(psthWin/psthBin);
% win = rectwin(psthWin/psthBin);
win = win / psthWin;

for trialID = 1:trialCount
	spikes = u.spikeTimesPerTrial{condID}{trialID};
	hist = histcounts(spikes, psthEdges);
	psth(trialID, :) = conv(hist, win, 'same');
end


figure(1);
subplot(211);
plot(psthCenters,psth');
xlim([0 0.25]);

subplot(212);
plot(u.psthCenters, u.psth{condID}');
xlim([0 0.25]);

% for trialID = 1:trials
% 	hist = histcounts(spikes{trialID}, psthEdges) / psthBin;
% 	hist = conv(hist, win, 'same');
% 	psth2(trialID, :) = hist;
% end
