clear all
clc

% Δεδομένα άσκησης
Zo = 50;
Z1 = 81.5;
Z2 = 80;
Z0 = 50;
Z3 = Z2;
Z4 = Z1;
Zs1 = 129.3;
Zs2 = 24;
Zs3 = 19.7;
Zs4 = Zs2;
Zs5 = Zs1;

N = 200; fmin = 0; fmax = 6e9; f0 = 3e9;
f = fmin: ((fmax - fmin)/N): fmax;
L = 1/8;        % Σημαίνει ότι L = lambda/8 for f=f0
beta_L = 2*pi*L*f/f0;

% L = λ0 / 8 για f = f0 = 3GHz
% Για νέα συχνότητα, έχω: λ = vp / f     ----> λ / λ0 = f0 / f
% ’ρα, έχω: βL = (2π/λ) * L = (2π/λ) * (λο / 8) = 2π * (1/8) * (f/f0)

% Ανοιχτοκυκλωμένη
Zin_s5 = -j*Zs5./tan(beta_L);
% Zin5 παράλληλα με τα 50Ω
ZL4 = (Zin_s5*Z0) ./ (Zin_s5 + Z0);
Zin4 = Z4 * (ZL4 + j*Z4*tan(beta_L)) ./ (Z4 + j*ZL4.*tan(beta_L));

Zin_s4 = -j*Zs4./tan(beta_L);
ZL3 = (Zin_s4 .* Zin4) ./ (Zin_s4 + Zin4);
Zin3 = Z3 * (ZL3 + j*Z3*tan(beta_L)) ./ (Z3 + j*ZL3.*tan(beta_L));

Zin_s3 = -j*Zs3./tan(beta_L);
ZL2 = (Zin_s3 .* Zin3) ./ (Zin_s3 + Zin3);
Zin2 = Z2 * (ZL2 + j*Z2*tan(beta_L)) ./ (Z2 + j*ZL2.*tan(beta_L));

Zin_s2 = -j*Zs2./tan(beta_L);
ZL1 = (Zin_s2 .* Zin2) ./ (Zin_s2 + Zin2);
Zin1 = Z1 * (ZL1 + j*Z1*tan(beta_L)) ./ (Z1 + j*ZL1.*tan(beta_L));

% 1ος κλαδωτής
Zin_s1 = -j*Zs1./tan(beta_L);
Zin = (Zin_s1 .* Zin1) ./ (Zin_s1 + Zin1);

% SWR
S11 =   (Zin - Z0) ./ (Zin + Z0);
S11_dB = 20 * log10(abs(S11));

plot(f, S11_dB);


