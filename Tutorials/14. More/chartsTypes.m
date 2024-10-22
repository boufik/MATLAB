clc
clear all

N = 1000;
counters = zeros(1, 5);     % This will count how many times each number appears
% I will create a vector with va;ues 1,2,3,4 and 5 following uniform distribution
for i = 1:N
    value = randi([1, 5]);
    counters(value) = counters(value) + 1;
end
legendsOfPie = {'1', '2', '3', '4', '5'};
pie(counters);
title("Possibilities of numbers' appearances");
legend(legendsOfPie);