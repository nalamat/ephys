function condID = getCondID(trialInfo, a)
	if strcmpi(trialInfo.trialType(1:2), 'GO')
		freqID  = find(a.targetFreqs  == trialInfo.targetFreq );
		levelID = find(a.targetLevels == trialInfo.targetLevel);

		condID = (freqID-1)*length(a.targetLevels)+levelID+1;
	else    % nogo is the first condition
		condID = 1;
	end
end
