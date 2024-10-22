clear all
clc

% MAIN FUNCTION
h1List = [687, 1524, 1210, 1539];
h2List = [145, 120, 410, 570];
for i = 1:length(h1List)
    h1 = h1List(i);
    h2 = h2List(i);
    dmax = calculate(h1, h2);
end

% Auxiliary Function
% Data
function dmax = calculate(h1, h2)
    h1_antenna = 25;
    h1_all = h1 + h1_antenna;
    h2_antenna = 6;
    h2_all = h2 + h2_antenna;
    % Formula: tan(ø) = (h1_all + h2_all) / d
    syms d
    d1 = d * (h1_all / (h1_all + h2_all));
    d2 = d * (h2_all / (h1_all + h2_all));
    h1_tonos = h1_all - d1^2 / 12.7;
    h2_tonos = h2_all - d2^2 / 12.7;
    % LOS
    d_LOS = 3.57 * (sqrt(h1_tonos) + sqrt(h2_tonos));
    eqn = d_LOS == d;
    % Solving
    dmax = solve(eqn, d);
    dmax = vpa(dmax)
end
