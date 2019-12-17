function pos = channelMappingA4x4(channel)
	% electrode channel placement map
	% each column represents a shank
	% each row represents channels at the same depth
	map = [
		15, 10, 2, 3;
		13, 12, 4, 1;
		8, 11, nan, 7;
		9, 14, 5, 6 ];
	
	pos = find(map'==channel);
end
