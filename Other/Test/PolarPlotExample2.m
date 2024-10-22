clear all
clc

theta = 0: 0.01: 2*pi;
rho = 1-cos(theta);
polarplot(theta, rho);