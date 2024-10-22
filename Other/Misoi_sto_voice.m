clc
clear all

% Main Function
nList = 2 : 2 : 20;
prob100List = zeros(1, length(nList));
for i = 1:length(nList)
    n = nList(i);
    k = n/2;
    prob100 = probabilityMisoi(n, k);
    prob100List(i) = prob100;
end
nList;
prob100List;
plot(nList, prob100List);
title('Probability of being chosen of a set length n, when n/2 are chosen');
xlabel('n = length of a set');
ylabel('Probability');

% Auxiliary Functions
function factorial = getFactorial(n)
    if n == 0 || n == 1
        factorial = 1;
    elseif n == 2
        factorial = 2;
    else
        factorialList = zeros(1, n);
        factorialList(1) = 1;
        factorialList(2) = 2;
        for i = 3:n
            factorialList(i) = i * factorialList(i-1);
        factorial = factorialList(n);
        end
    end
end

function result = c(n, k)
    if k <= n && mod(n, 2) == 0
        result = factorial(n) / (factorial(k) * factorial(n-k));
    end
end

function prob100 = probabilityMisoi(n, k)
    if k <= n && mod(n, 2) == 0
        prob100 = 100 * ((n-1) / c(n, k));
    end
end