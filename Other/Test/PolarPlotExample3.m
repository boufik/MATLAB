clear all
clc

theta = 0: 0.01: 2*pi;
rho = (2.*cos(theta)) + exp(-sin(theta)) + log(theta.^2);
polarplot(theta, rho);