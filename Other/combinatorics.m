clc
clear all

% MAIN FUNCTION
LIMIT = 20;
FAC = all_factorials(LIMIT);
a = 7;
b = 12;
n_list = a:b;
for i = 1:length(n_list)
    n = n_list(i);
    [x, y] = plotting(n, LIMIT, FAC);
    disp("n = " + num2str(n));
    disp(num2str(y));
    display(' ');
    hold on
end
title("Combinations k from n");
xlabel('k');
ylabel('C(n,k)');
titles_list = [];
for i = a:b
    titles_list = [titles_list "n = " + num2str(i)];
end
legend(titles_list);


% Auxiliary Functions
function factorials_list = all_factorials(n)
    factorials_list = zeros(1, n);
    factorials_list(1) = 1;
    factorials_list(2) = 1;
    factorials_list(3) = 2;
    for i = 4 : n
        factorials_list(i) = (i-1) * factorials_list(i-1);
    end
end

function y = c(n, k, FAC)
    y = FAC(n+1) / (FAC(k+1) * FAC(n-k+1));
end

function [x, y] = plotting(n, LIMIT, FAC)
    x = 0:n;
    y = zeros(1, n+1);
    if n > LIMIT
        y = -1;
        return;
    end
    for i = 0:n
        y(i+1) = c(n, i, FAC);
    end
    plot(x, y);
end