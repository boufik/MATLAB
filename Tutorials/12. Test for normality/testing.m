clc
clear all

% I will generate 2 data lists, 1 coming from normal distribution
% and the other 1 from a uniform distribution
X1 = randn(1000, 1);
X2 = rand(1000, 1);

% I will run the 2 tests for normality: jbtest and kstest
display('0 means noraml distribution, 1 means the opposite');
display('************************************************');
display('X1 = randn(1000, 1)');
[h1, p1] = jbtest(X1)
[h1, p1] = kstest(X1)
display('************************************************');
display('X2 = rand(1000, 1)');
[h2, p2] = jbtest(X2)
[h2, p2] = kstest(X2)