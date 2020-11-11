function condID = getCondID(trialInfo, a)
	if strncmpi(trialInfo.trialType, 'nogo', 4) || ...
			trialInfo.targetLevel == 0    % for low-effort mode
		condID = 1;     % nogo is the first condition
	elseif strncmpi(trialInfo.trialType, 'go', 2)
		freqID  = find(a.targetFreqs  == trialInfo.targetFreq );
		levelID = find(a.targetLevels == trialInfo.targetLevel);

		condID = (freqID-1)*length(a.targetLevels)+levelID+1;
	else
		error('[getCondID] Trial condition not defined');
	end
end
