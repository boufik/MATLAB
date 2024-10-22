clear all
clc

RF_in = [-40, -30, -20, -10, -5, 0, 2, 5, 6, 7];
noise = -75;
IF_out = [-58:10:-28 -23 -17 -15 -12 -11 -10];
intermodulation = [noise noise noise noise -72 -59 -54 -49 -44 -41];
plot(RF_in, IF_out, 'red');
title('Intermodulation products');
hold on
plot(RF_in, intermodulation, 'blue');
hold on
% Proektaseis
RF_in_new = [-5:1:35];
y1 = 1.074*RF_in_new - 12.35;
y2 = 2.498*RF_in_new - 54.41;
plot(RF_in_new, y1, 'y--');
hold on
plot(RF_in_new, y2, 'g--');
xlabel('P_{in} (dBm)');
ylabel('P_{out} (dBm)');
legend('Measured IF_{out}', 'Measured IM_3', 'Linear IF_{out}', 'Linear IM_3');