folder = '../Data/Ground/';
files = {
	'Ground_PositiveCMR_20171121_174919.h5', 'A) Normal'
	'Ground_PositiveCMR_20171121_175227.h5', 'B) Lights off'
	'Ground_PositiveCMR_20171121_175517.h5', 'C) Box off'
	'Ground_PositiveCMR_20171121_175739.h5', 'D) Box adapter unplugged'
	'Ground_PositiveCMR_20171121_180215.h5', 'E) Distance wires'
	'Ground_PositiveCMR_20171121_180424.h5', 'F) TBSI adapter replaced'
	'Ground_PositiveCMR_20171121_180925.h5', 'G) Grounded to heater'
	'Ground_PositiveCMR_20171121_181146.h5', 'H) Grounded to NI DAQ'
	'Ground_PositiveCMR_20171121_181419.h5', 'I) Grounded to a screw'
	'Ground_PositiveCMR_20171121_181826.h5', 'J) Ground wire loose'
	};

stds = zeros(length(files),1);
legends = files(:,2);
for f=1:length(files)
	%% read h5 file
	file = strcat(folder, files{f, 1});
	info = hdf5info(file);
	root = info.GroupHierarchy.Groups(1).Name;

	% read in the raw physiology data
	data     = hdf5read (file, strcat(root, '/data/physiology/raw'));
	data_fs  = h5readatt(file, strcat(root, '/data/physiology/raw'), 'fs');
	data     = double(data) * 1000;
	data     = data(:,2:end);             % exclude channel 1
	stds(f)  = mean(std(data)) / size(data,2);
end

bar(categorical(legends), stds);
ylabel('Mean STD of all channels');
title('Noise analysis for 1 minute of recording with all channels grounded');