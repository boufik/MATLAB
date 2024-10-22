clc
clear all

a = 20;
syms x
f = x^(2/3) + 0.9 * (5-x^2)^(1/2) * sin(a*pi*x);
stop = 2.2;
fplot(x, f, [-stop stop], 'red');
hold on
fplot(-x, f, [-stop stop], 'red');