clc
clear all

% Main Function
N = 1001;
spots = 20;         % In histogram
x = linspace(0, 10, N);
times = [2, 5, 10, 20, 30, 50];
counter = 0;
for i = 1:length(times)
    counter = counter + 1;
    time = times(i);
    y = produce(N, time);
    subplot(3,2, counter);
    hist(y, spots);
    titleInPlot = strcat('Sum of: ', num2str(time), '  Gaussian distributions');
    title(titleInPlot);
end

% Auxiliary Function
function y = produce(N, time)
    y = [];
    counter = 0;
    for i = 1:N
        counter = counter + 1;
        value = 0;
        for j = 1:time
            value = value + randn();   % I add a sample with average = 0, std = 1
        end
        y(counter) = value;
    end
    y;
end