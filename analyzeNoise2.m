folder = '../Data-Booth1/CMR04Left/';
files = {
	'CMR04Left_PositiveCMR_20180601_120921_Passive_Supermasker50dB_1kTone75dB.h5', 'A) Normal'
	'CMR04Left_PositiveCMR_20180604_185118_Passive_Supermasker50dB_1kTone75dB.h5', 'B) Normal'
	'CMR04Left_PositiveCMR_20180605_110308_Passive_Supermasker50dB_1kTone75dB.h5', 'C) Normal'
	'CMR04Left_PositiveCMR_20180606_160241_Passive_Supermasker50dB_1kTone75dB.h5', 'D) Isolate PC and dev2'
	'CMR04Left_PositiveCMR_20180606_161011_Passive_Supermasker50dB_1kTone75dB.h5', 'E) D + Lights off'
	'CMR04Left_PositiveCMR_20180607_135555_Passive_Supermasker50dB_1kTone75dB.h5', 'F) D + Shield Antennas'
	'CMR04Left_PositiveCMR_20180607_135936_Passive_Silence.h5'                   , 'G) F + Disconnect dev1'
	'CMR04Left_PositiveCMR_20180608_160625_Passive_Supermasker50dB_1kTone75dB.h5', 'H) F'
	'CMR04Left_PositiveCMR_20180608_161008_Passive_Silence.h5'                   , 'I) F + Disconnect dev1 & amp'
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
title('Noise analysis for ~1 minute of passive recording');
