clear all
close all
clc

%% 1. Calculate the maximum money
A = 10^4;
N = 100;
nums = 1 : N;
x = 1 ./ nums;
SUM1 = sum(x);
max_money1 = A * SUM1;

syms t
func = 1 / t;
SUM2 = int(func, t, 1, N);
SUM2 = vpa(floor(10^4 * SUM2) / 10^4);
max_money2 = A * SUM2;

fprintf("<strong>With sum of " + num2str(N) + "-term series:</strong>\n")
SUM1
max_money1 = vpa(max_money1)
fprintf("\n<strong>With integral from 1 to " + num2str(N) + ":</strong>\n")
SUM2
max_money2 = vpa(max_money2)
fprintf("\n\n")



%% 2. Fit data - Approach the 100-term series as a polynomial
y = aggregate(x);

[xData, yData] = prepareCurveData(nums, y);
ft = fittype('poly8');
[fitresult, gof] = fit(xData, yData, ft, 'Normalize', 'on');

figure('Name', 'untitled fit 1');
h = plot(fitresult, xData, yData);
legend(num2str(N)+" Real points", "Fit with poly8", num2str(N)+"-term Series")
hold on
plot(nums, y, 'blue')



%% AUXILIARY FUNCTION
function agg = aggregate(vec)
    agg(1) = vec(1);
    for i = 2 : length(vec)
        agg(i) = agg(i-1) + vec(i);
    end
end