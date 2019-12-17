function m = mergeUnits(units)
	% initialize merge unit analysis struct
	m               = struct();
	m.fs            = units{1}.fs;
	m.trialCount    = 0;
	m.maskerFile    = units{1}.maskerFile;
	m.maskerLevel   = units{1}.maskerLevel;
	m.targetFreqs   = [];
	m.targetLevels  = [];
	m.spikeLength   = units{1}.spikeLength;
	
	% get all target stimulus conditions from units
	for unitID = 1:length(units)
		u = units{unitID};
		if m.fs ~= u.fs || ~strcmp(m.maskerFile, u.maskerFile) || ...
				m.maskerLevel ~= u.maskerLevel || ...
				m.spikeLength ~= u.spikeLength
			error('All merging units must have similar parameters');
		end
		m.trialCount   = m.trialCount + u.trialCount;
		m.targetFreqs  = [m.targetFreqs , u.targetFreqs ];
		m.targetLevels = [m.targetLevels, u.targetLevels];
	end % unitID
	m.targetFreqs  = unique(m.targetFreqs);
	m.targetLevels = unique(m.targetLevels);
	% the `unique` function has a weird behavior that returns a 0x1 vector
	% when acting on empty vectors, next 2 lines fix this
	if isempty(m.targetFreqs ); m.targetFreqs  = []; end
	if isempty(m.targetLevels); m.targetLevels = []; end
	m.condCount    = length(m.targetFreqs) ...
		* length(m.targetLevels) + 1;    % +1 for nogo
	m.trialCountPerCond = zeros(1, m.condCount);
	
	m.spikeTimes             = cell(1, m.condCount);
	m.spikeTimesPerTrial     = cell(1, m.condCount);
	m.spikeIntervals         = cell(1, m.condCount);
	m.spikeIntervalsPerTrial = cell(1, m.condCount);
	
	for unitID = 1:length(units)
		u = units{unitID};
		for unitCondID = 1:u.condCount
			% map condition ID from unit to merge
			mergeCondID = mapCondID(unitCondID, u, m);
			
			% count trials per each condition
			m.trialCountPerCond(mergeCondID) = ...
				m.trialCountPerCond(mergeCondID) + ...
				u.trialCountPerCond(unitCondID);
			
			% append spike data
			m.spikeTimes{mergeCondID} = ...
				[m.spikeTimes{mergeCondID}, u.spikeTimes{unitCondID}];
			m.spikeTimesPerTrial{mergeCondID}(end+1:end+ ...
				length(u.spikeTimesPerTrial{unitCondID})) = ...
				u.spikeTimesPerTrial{unitCondID};
			
			m.spikeIntervals{mergeCondID} = ...
				[m.spikeIntervals{mergeCondID}, ...
				u.spikeIntervals{unitCondID}];
			m.spikeIntervalsPerTrial{mergeCondID}(end+1:end+...
				length(u.spikeIntervalsPerTrial{unitCondID})) = ...
				u.spikeIntervalsPerTrial{unitCondID};
		end % unitCondID
	end % unitID
end
