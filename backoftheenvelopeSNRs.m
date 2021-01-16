% back of the envelope calculation to compare SNRs across studies
% comparing broadband nominal 0 dB SNR to narrowband nominal 0dB SNR 
% Result: A nominal 0 dB SRN with broadband noise is equivalent to 16 dB
% SNR with narrowband noise.
clear; close all; clc 
rms = inline('sqrt(mean(x.^2))','x');

Fs = 50e3;
t = 0:1/Fs:10;

% generate tone
x = sin(2*pi*1e3*t); x = x./rms(x);


%generate wideband noise
n = randn(size(t));
[b,a] = butter(3,20e3/(Fs/2),'low');
n = filtfilt(b,a,n);
n = filtfilt(b,a,n);
n = n./rms(n);


% generate narrowband noise as used in our work
[b2,a2] = butter(3,[1e3*2^(-1/3) 1e3*2^(1/3)]./(Fs/2),'bandpass');
% This would be the flanker, but note that the flanker energy, by design,
% does not affect the SNR within the critical band of the target. 
%[b3,a3] = butter(3,[4e3*2^(-1/3) 1e3*2^(1/3)]./(Fs/2),'bandpass');

n2 = filtfilt(b2,a2,n); n2 = n2./rms(n2);
%n3 = filtfilt(b3,a3,n); n3 = n3./rms(n3);
%n2 = n2 + n3; clear n3


% x and n have a 0 dB broadband SNR
% x and n2 also have a 0 dB SNR (broadband or narrowband)
% But what is the SNR that a neuron sees that is tuned to 2/3 octave width
% around the center frequency of the target?


% only look at narrowband energy in the broadband noise
nn = filtfilt(b2,a2,n);
% This happens to be a gain of 1 filter. But let's verify it, just to be on
% the safe side.
NN = fft(nn); N = fft(n);
f = linspace(0,Fs,length(t));
ind = find(f>10&f<Fs/2);
figure
hold on;plot(f(ind),20*log10(abs(N(ind))),'r');
hold on;plot(f(ind),20*log10(abs(NN(ind))),'b');


SNR_broad = 20*log10(rms(x))-20*log10(rms(nn));
disp(['For the wideband noise, the SNR in the 2/3 oct band surrounding the target equals ',...
    num2str(SNR_broad,'%.2f'),' dB.']);



SNR_narrow = 20*log10(rms(x))-20*log10(rms(n2))
disp(['For the narrowband noise with flanker, the SNR in the 2/3 oct band surrounding the target equals ',...
    num2str(SNR_narrow,'%.2f'),' dB.']);

% In Las et al. 2005,Fig. 5, nominal SNR from  -57 to -24 dB SNR therefore
% comparable to -41 to -8 dB SNR in our current work. Behavioral thresholds
% are at around -20 dB SNR. Using correlation as a measure of the similarity 
% between the neuronal response to noise alone, vs. tone in noise, 
% Las et al. find envelope locking suppression across all tested negative SNRs. 
% at nominal -40 dB SNR = -24 dB SNR, the first NC starts to deviate from
% noise alone
