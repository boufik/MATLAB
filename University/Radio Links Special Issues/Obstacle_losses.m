clear all
clc

% MAIN FUNCTION
Fc = 626 * 10^6;
c = 3 * 10^8;
lamda = c / Fc
h = 69;
d1 = 1500;
d2 = 8500;
losses = calculate(h, lamda, d1, d2);

% Obstacle
function losses = calculate(h, lamda, d1, d2)
    v = h * sqrt((2/lamda) * (1/d1 + 1/d2))
    J_v = 6.9 + 20*log10( sqrt((v-0.1)^2 + 1) + (v-0.1) );
    losses = J_v
end