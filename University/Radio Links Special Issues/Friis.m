clear all
clc

% MAIN FUNCTION
Gr_dB = 15;
Pr_dBm = -50;
Fc = 626 * 10^6;
EIRP_dB_list = [42, 38, 22];
for i = 1:length(EIRP_dB_list)
    EIRP_dB = EIRP_dB_list(i);
    disp('EIRP_dB = ');
    disp(EIRP_dB);
    dmax = calculate_dmax(EIRP_dB, Gr_dB, Pr_dBm, Fc);
end

% Calculation
function dmax = calculate_dmax(EIRP_dB, Gr_dB, Pr_dBm, Fc)
    EIRP = 10^(EIRP_dB / 10);
    Gr = 10^(Gr_dB / 10);
    Pr_dB = Pr_dBm - 30;
    Pr = 10^(Pr_dB / 10);
    % Pr = (Pt*Gt) * Gr * (ë/4ðd)^2
    c = 3 * 10^8;
    lamda = c / Fc;
    % Apply to the formula solving for d_max
    dmax = (lamda/4/pi) * sqrt(EIRP*Gr / Pr)
end