function a = calculatePerformance(a)
	a.behavDP = cell(1,a.condCount);
	
	if strcmpi(a.experimentMode, 'passive')
		a.behavDP(:) = {0};
		return;
	elseif strcmpi(a.experimentMode, 'poke training')
		fa = sum([a.trialLog.targetLevel] == 0 & strcmpi({a.trialLog.score}, 'hit'));
		cr = sum([a.trialLog.targetLevel] == 0 & strcmpi({a.trialLog.score}, 'miss'));
	else
		fa = sum(strcmpi({a.trialLog.score}, 'fa'));
		cr = sum(strcmpi({a.trialLog.score}, 'cr'));
	end
	if fa+cr == 0
		warning('[calculatePerformance] No nogo trials')
		a.behavDP(:) = {0};
		return;
	end
	faRate = fa / (fa+cr);
	faRate = max(.05, faRate);
	faRate = min(.95, faRate);
	faZ = erfinv(1-2*(1-faRate))*sqrt(2);  % z-score
	a.behavDP{1} = 0;
	
	for condID = 2:a.condCount
		freqID  = floor((condID-2) / length(a.targetLevels)) + 1;
		levelID = mod((condID-2), length(a.targetLevels)) + 1;
		freq    = a.targetFreqs (freqID );
		level   = a.targetLevels(levelID);
		msk     = strncmpi({a.trialLog.trialType}, 'go', 2) & ...
			[a.trialLog.targetLevel]==level & ...
			[a.trialLog.targetFreq]==freq;
		
		hit     = sum( msk & strcmpi({a.trialLog.score}, 'hit'));
		miss    = sum( msk & strcmpi({a.trialLog.score}, 'miss'));
		hitRate = hit / (hit+miss);
		hitRate = max(.05, hitRate);
		hitRate = min(.95, hitRate);
		hitZ    = erfinv(1-2*(1-hitRate))*sqrt(2); % z-score
		
		dPrime  = hitZ - faZ;
		
		a.behavDP{condID} = dPrime;
	end
end
