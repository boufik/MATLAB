clear all
clc

% 1. Uniform Distribution
N = 1000;
x = 1 : N;
y = rand(1, N);
figure();
subplot(2, 1, 1);
scatter(x, y);
title(num2str(N) + " random spots (UNIFORM)");
subplot(2, 1, 2);
hist(y, 20);
title("Histogram of UNIFORM in [0, 1]");
print_stats(y, "UNIFORM");

% 2. Normal Distribution
N = 1000;
MEAN_N = 10;
STD_N = 2;
y = MEAN_N + randn(1, N) * STD_N;
id_x = linspace(MEAN_N - 4*STD_N, MEAN_N + 4*STD_N, N+1);
id_y = exp(-(id_x - MEAN_N).^2 / (2*STD_N^2));
figure();
subplot(2, 1, 1);
bar(id_x, id_y);
title("Ideal normal distribution with: x_{avg} = " + num2str(MEAN_N) + " and std = " + num2str(STD_N));
subplot(2, 1, 2);
hist(y, 20);
title("Histogram of NORMAL with: x_{avg} = " + num2str(MEAN_N) + " and std = " + num2str(STD_N));
print_stats(y, "NORMAL");


% Auxiliary Functions
function MEDIAN = median(x)
    LEN = length(x);
    if mod(LEN, 2) == 1
        MEDIAN = x((LEN+1)/2);
    else
        MEDIAN = 1/2 * (x(LEN/2) + x(LEN/2+1));
    end
end

function [RANGE, MAX, MIN] = range(x)
    MAX = max(x);
    MIN = min(x);
    RANGE = MAX - MIN;
end

function AAD = aad(x, MEAN)
    AAD = mean(abs(x - MEAN));
end

function MAD = mad(x, MEAN)
    y = abs(x - MEAN);
    MAD = median(y);
end

function pretty_print(number, name)
    disp(name + " = " + num2str(number));
end

function print_stats(x, distribution)
    MEAN = mean(x);
    STD = std(x);
    VAR = var(x);
    MEDIAN = median(x);
    [RANGE, MAX, MIN] = range(x);
    AAD = aad(x, MEAN);
    MAD = mad(x, MEAN);
    display('********************************************************');
    disp("      " + distribution);
    display(' ');
    pretty_print(MIN, "Min");
    pretty_print(MAX, "Max");
    pretty_print(RANGE, "Range");
    pretty_print(MEAN, "Mean");
    pretty_print(MEDIAN, "Median");
    pretty_print(VAR, "Variance");
    pretty_print(STD, "Std");
    pretty_print(AAD, "AAD");
    pretty_print(MAD, "MAD");
    display('********************************************************');
    display(' ');
end
