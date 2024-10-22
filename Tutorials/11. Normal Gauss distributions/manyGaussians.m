clc
clear all

% MAIN FUNCTION
meanList = [0, 0, 0, -2];
sigma_squared_List = [0.2, 1, 5, 1];
x_min = -5;
x_max = 5;
N = 1001;
for i = 1:length(meanList)
    mean = meanList(i);
    sigma_squared = sigma_squared_List(i);
    [X, Y] = full_gaussian(mean, sigma_squared, x_min, x_max, N);
    hold on
end
title('4 Gaussian functions');
xlabel('x');
ylabel('y = f(x | ì,ó)');
legend('ì = 0, ó^2 = 0.2', 'ì = 0, ó^2 = 1', 'ì = 0, ó^2 = 5', 'ì = -2, ó^2 = 1');

% FUNCTION 1
function y = my_gaussian(x, mean, sigma_squared)
    y = (1/sqrt(2*pi*sigma_squared)) * exp(-(x-mean)^2 / (2*sigma_squared));
end

% FUNCTION 2
function [X, Y] = full_gaussian(mean, sigma_squared, x_min, x_max, N)
    X = linspace(x_min, x_max, N);
    Y = zeros(N, 1);
    for i = 1:N
        x = X(i);
        y = my_gaussian(x, mean, sigma_squared);
        Y(i) = y;
    end
    plot(X, Y);
end