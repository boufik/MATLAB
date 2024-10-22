clc
clear all

% 1. For a specific value of "n", I have to find all the 2*n poles

display('******** 1. n ********');
n = 2
p = [];
for k = 1 : 2*n
    p(k) = exp(i * pi * (1 / 2 + (2*(k-1)-1) / (2*n)));
end

display('******** 2. All the poles (p) of the square of norm: |Hn(s)|^2 ********');
p

% 2. Now, I have 2*n poles in the list p and I have to keep only those
% with the negative real part

poles = [];
for k = 1 : length(p)
    if real(p(k)) <= 0
        poles(length(poles)+1) = p(k);
    end
end

display('******** 3. The poles with the negative real part (poles) ********');
poles

% 3. Having the "poles" list, I have to calculate the Bn(s), then the
% coefficients and then to siplay the Hn(s) function as a transfer function
% here in Matlab
syms s
display('******** 4. Butterworth polynomial ********');
Bn = (s - poles(1)) * (s - poles(2))
display('******** 5. Coefficients of polynomial ********');
coefficients = coeffs(Bn, 's')

c = []
for index = 1:length(coefficients)
    c(index) = coefficients(index);
end

display('******** 6. Hn(s) = 1 / Bn(s) ********');
Hn = tf([1], c)