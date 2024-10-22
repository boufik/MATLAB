clc
clear all

Z0 = 50;
L = 0.5 * 10^(-9);
d = 0.01;
N = 10;
% start_f = 0;
% stop_f = 1000;
% steps = 10;
% step_f = stop_f / steps;
% f = start_f : step_f : stop_f;
syms f

c = 3*10^8;
k = 2*pi*f / c; % γτ οταν παταμε το F δεν κανει fullscreen οπως σε αλλες πλατοφρομες
theta = k * d;
b = - Z0 / (2*pi*f * L);

A = cos(theta) - b/2 * sin(theta);
D = A;
B = i * (sin(theta) + b/2 * cos(theta) - b/2);
C = i * (sin(theta) + b/2 * cos(theta) + b/2);
ABCD = [A B; C D];

X = ABCD ^ N;
S11 = X(1, 1);
S12 = X(1, 2);
figure(1);
fplot(S11, [0, 30 * 10^9]);
figure(2);
fplot(S12, [0, 30 * 10^9]);