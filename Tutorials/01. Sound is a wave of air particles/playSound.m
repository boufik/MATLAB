clc
clear all

[wave_sound, Fs] = audioread('helloworld.mp3');
% Sound is the matrix and Fs = sampling frequency
[numOfSamples, dimensions] = size(wave_sound)
% Sound is a 2D matrix, 1st output of size is the number of samples
% Second one is 2, because we store stereo, left and right
plot(wave_sound);
% A sine wave
sound(wave_sound, Fs);