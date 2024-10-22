clc
clear all

[male, Fs1] = audioread('thomas.mp3');
sizeMale = size(male)
[female, Fs2] = audioread('adele.mp3');
sizeFemale = size(female)

% Dimensions are N 2
% 2 because we have 2 channels (stereo), left and right, we select left
m = male(:, 1);
f = female(:, 1);
M = fft(male);
F = fft(female);

subplot(2,1,1);
plot(real(M));
title('Male Voice');
subplot(2,1,2);
plot(real(F));
title('Female Voice');