clc
clear all

% 1. Fourier of sinx
x = linspace(0, 10*pi, 10001);
y = sin(x);
Y = fft(y);
figure(1);
plot(real(Y));
title('Fourier transform of a sine wave');

% 2. Linear increasement of frequency - Spectrogram
y2 = sin(x.*x);
figure(2);
subplot(2,1,1);
spectrogram(y2);

% 3. Window size
windowSize = 100;
subplot(2,1,2);
spectrogram(y2, windowSize);