function toCondID = mapCondID(fromCondID, from, to)
	% map condition ID from 'from' to 'to'
	if fromCondID == 1
		toCondID = 1;    % nogo is the first condition
	else
		unitFreqID   = floor((fromCondID-2) / ...
			length(from.targetLevels)) + 1;
		unitLevelID  = mod((fromCondID-2), ...
			length(from.targetLevels)) + 1;
		freq         = from.targetFreqs (unitFreqID );
		level        = from.targetLevels(unitLevelID);
		mergeFreqID  = find(to.targetFreqs ==freq );
		mergeLevelID = find(to.targetLevels==level);
		if isempty(mergeFreqID) || isempty(mergeLevelID)
			toCondID = 0;
		else
			toCondID  = (mergeFreqID-1)*length(to.targetLevels) + ...
				mergeLevelID + 1;    % +1 for nogo
		end
	end
end

