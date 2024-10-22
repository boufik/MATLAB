clear all
clc

% Data
RF_in = [-6:6 6.5 7];
IF_out = [-17.2:-7.2 -6.4 -5.7 -5.4 -5.2];
IF_expected = [-17.2:-5.2 -4.7 -4.2];
plot(RF_in, IF_out, 'red');
hold on
plot(RF_in, IF_expected, 'blue');
title('1-dB Compression point')
legend('Real output', 'Expected (linear)');