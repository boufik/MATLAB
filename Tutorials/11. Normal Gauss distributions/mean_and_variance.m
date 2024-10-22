clc
clear all

R = csvread('random_integers.csv');
x = 1:length(R);
meanR = mean(R)
varR = var(R)
stdR = sqrt(varR)

plot(x, R, 'blue');
title('Statistical Analysis');
xlabel('x');
ylabel('y(x)');
hold on
meanList = zeros(length(R), 1);
for i = 1:length(meanList)
    meanList(i) = meanR;
end
plot(x, meanList, 'red');
legend('Random integers', 'Mean value');
