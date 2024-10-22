clear all
clc

% Data
avg = 10;
sigma = 1;
N = 10^4;
values = avg + sigma .* randn(1, N);
figure();
histogram(values, 100);
title('100 intervals histogram');

% For the 2nd histogram
mult = 3;
offset = - mult;
edges = zeros(1, 2 * mult + 1);
for i = 1 : length(edges)
    edges(i) = avg + offset * sigma;
    offset = offset + 1;
end
edges;

% Statistics
% 1. Numbers per edges first
num = zeros(1, 2*mult);
for i = 1 : length(values)
    value = values(i);
    for j = 1 : length(edges) - 1
        if value > edges(j) && value < edges(j+1)
            num(j) = num(j) + 1;
        end
    end
end
num;

% 2. Percentages
perc = zeros(1, mult);
for i = 1 : length(perc)
    perc(i) = 100 * (num(i) + num(2*mult + 1 - i)) / N;
end
perc = fliplr(perc);
for i = 1 : length(perc)
    disp("Values in interval [ì-" + num2str(i) + "*ó, ì + " + num2str(i) + "*ó] : " + num2str(perc(i)) + " %");
end
perc;
figure();
histogram(values, edges);
title('Histogram');