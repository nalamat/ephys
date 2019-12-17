function [spikeTimes, spikeIndices] = ...
		extractSpikesFromTrace(trace, fs, spikeThreshold, ...
		spikeDuration, artifactThreshold, artifactDuration)

	if size(trace,2)==1
		trace = trace';
	end
	
	% round to even
	spikeLength = round(spikeDuration * fs);
	if mod(spikeLength,2)
		spikeLength = spikeLength+1;
	end
	
	% round to even
	artifactLength = round(artifactDuration * fs);
	if mod(artifactLength,2)
		artifactLength = artifactLength + 1;
	end

	% remove noise spikes
	for i = 1:length(trace)
		if abs(trace(i)) > artifactThreshold
			if i < artifactLength/2 + 1
				trace(i) = 0;
			elseif i > length(trace)-artifactLength/2
				trace(i) = 0;
			else
				trace(i-artifactLength/2:i+artifactLength/2) = ...
					zeros(1,artifactLength+1);
			end
		end
	end

	% perform spike detection
	% if the voltage amplitude is greater than the set voltage
	% threshold limit, it is declared to be a spike
	tracePulse = zeros(size(trace));
	for i = spikeLength/2+1:length(trace)-spikeLength/2
		if spikeThreshold < abs(trace(i)) && ...
				abs(trace(i)) < artifactThreshold && ...
				abs(trace(i)) == max(abs( ...
				trace(i-spikeLength/2:i+spikeLength/2)))
			tracePulse(i) = trace(i);
		end
	end

	% extact spikes
% 	cutPulse = {};
% 	for i = 1:length(trace)
% 		if tracePulse(i)~=0
% 			cutPulse{end+1} = ...
% 				trace(i-spikeLength/2:i+spikeLength/2);
% 		end
% 	end
	
	% realign spikes
% 	cutPulseRealigned = cell(size(cutPulse));
% 	for i=1:length(cutPulse)
% 		cutPulseRealigned{i} = zeros(1,spikeLength*2+3);
% 		[~, ind] = min(cutPulse{i});
% 		cutPulseRealigned{i}( ...
% 			spikeLength+2-ind:spikeLength*2+2-ind) = cutPulse{i};
% 	end

	% once spikes have been detected, calculate the arrival time 
	% of the corresponding spikes
	spikeIndices = find(tracePulse);

	% align spike times to seconds relative to tone onset
	spikeTimes = spikeIndices/fs;
	
	% peri-stimulus spike indices
% 	spikeIndicesPeri = ...
% 		spikeIndices(fs*1<=spikeIndices & spikeIndices<=fs*2);
	
	% intervals between each two consecutive spikes
	% the interval for the first spike of each trial is
	% measured compared to stimulus onset
% 	if ~isempty(spikeIndicesPeri)
% 		spikeIntervals = [spikeIndicesPeri(1), ...
% 			spikeIndicesPeri(2:end)-spikeIndicesPeri(1:end-1)];
% 	else
% 		spikeIntervals = [];
% 	end
	
end
