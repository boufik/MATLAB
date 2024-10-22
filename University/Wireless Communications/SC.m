clc
clear all

time = 0:0.1:10;
random_range = [15 20];
SNR1 = 2 * cos(time) - time .* sin(time);
SNR2 = 0.5 * time .* cos(time) + sin(time);
SNR_SC = max(SNR1, SNR2);

plot(time, SNR1, 'blue');
hold on
plot(time, SNR2, 'green');
hold on
plot(time, SNR_SC, 'red');
title("SNR in Selection Combiner");
xlabel("Time");
ylabel("SNR");
legend("SNR antenna 1", "SNR antenna 2", "SNR SC (max)");