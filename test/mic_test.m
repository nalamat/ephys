info = h5info('CMR02Left_PositiveCMR_20170429_120720.h5');
mic = h5read('CMR02Left_PositiveCMR_20170429_120720.h5', [info.Groups.Name '/data/microphone']);
mic = double(mic);
fs = info.Groups.Groups.Datasets(2).Attributes(6).Value;
[a,b] = butter(4, [100, 20e3]/(fs/2), 'bandpass');
mic2 = filtfilt(a,b,mic);
window = 30*fs:40*fs;
% plot((1:length(mic2(window)))/fs, mic2(window));
% grid on;

a = audioplayer(mic(window), fs);
play(a);

audiowrite('mic.wav', mic(window), fs);