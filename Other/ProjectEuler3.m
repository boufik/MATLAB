% The prime factors of 13195 are 5, 7, 13 and 29.
% What is the largest prime factor of the number 600851475143 ?

clear all
clc

N = 13195
% Create a vector, that will contain all the factors, first is number 1
f(1) = 1;
for i = 3:N/2
    if mod(N, i) == 0 && isprime(i)
        f(length(f)+1) = i;
    end
end
% f;
solution = f(length(f))
