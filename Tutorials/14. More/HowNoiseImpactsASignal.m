clc
clear all

x = linspace(0, 4*pi, 1001);
s = sin(x);
A_signal = 10;              % Amplitude of signal
A_noise = 0.5;              % Amplitude of noise ----> it will be the std
s_noise = A_signal * s + A_noise * randn(1, 1001);
figure(1);
subplot(2,1,1);
plot(x, s);
title('Signal (sinx)');
subplot(2,1,2);
plot(x, s_noise);
title('Signal (sinx) with noise');

figure(2);
plot(x, A_signal * s, 'red');
hold on
plot(x, s_noise, 'blue');
title('Signal (sinx) with and without noise');
data = [s, s_noise];
legend({'No noise', 'Noise'});