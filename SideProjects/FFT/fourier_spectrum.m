% This script computes the fourier transform of an audio.wav file
% and displays the fourier spectrum.

% Steps
%   1) Run the audio_sampler.py to record a .wav file
%   2) Run the script

clc
clear

info = audioinfo('/Users/.../fft_sample.wav'); % add directory
[y,Fs] = audioread('/Users/.../fft_sample.wav'); % add directory
sound(y,Fs)

t = 0:seconds(1/Fs):seconds(info.Duration); % 44100 samples a second so 1/44100 gives each sample
t = t(1:end-1);

figure('Name', 'Audio File Fourier Transform');
nexttile;
plot(t,y)
xlabel('Time')
ylabel('Audio Signal')

Y = fft(y);
N = length(y);
f = (0:N-1)*(Fs/N);

nexttile;
plot(f,Y)
xlabel('Frquency (Hz)')
ylabel('Magnitude')
