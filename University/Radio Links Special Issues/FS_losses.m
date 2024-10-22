clear all
clc

% MAIN FUNCTION
Fc = 626 * 10^6;
d_km = 10;
losses = calculate(d_km, Fc);

% Data
function losses = calculate(d_km, Fc)
    c = 3 * 10^8;
    lamda = c / Fc;
    margin = 5;
    losses = 122 + 20*log10(d_km) - 20*log10(lamda*100)
end