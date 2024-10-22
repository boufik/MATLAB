clear all
clc

% ******************************************************************
% 1. LATHOS TROPOS NA VRW TIN Y
% ******************************************************************

x = cos(0.5 * [1:1:20]);
h = 0.1 * abs([1:1:20] - 10);
y = conv(x, h)    	% 39 deigmata = 20+20-1 - SWSTO
X = fft(x);		% Complex me 20 deigmata opws kai h x[n]
H = fft(h);             % Complex me 20 deigmata opws kai h h[n]
Ytest = X .* H;         % Diastasi Ytest = 20, logw ginomenou X .* H
ytest = ifft(Ytest);    % Ytest me 20 ----> ytest me 20 ----> Lathos
Y = fft(y);

% PLOT 1
plot(x, 'red');
hold on
plot(h, 'blue');
hold on
plot(y, 'green')    		% Swsti h synelixi me 39
hold on
plot(ytest, 'black');       % Lathos me 20 stoixeia
title('Samples in time');
legend('red=sample1', 'blue=sample2', 'black=WRONG', 'green=CORRECT');

% PLOT 2
figure
plot(abs(X), 'red');
hold on
plot(abs(H), 'blue');
hold on
plot(abs(Ytest), 'black');
hold on
plot(abs(Y), 'green');
title('Black=ifft(fft(product)) vs Convolution');

% Nai, alla to mauro fasma Ytest einai o DFT tou y = x synelixi h?
% Kati tetoio den isxyei
% Tha to dw to lathos me ifft 
% To ytest einai lathos exei 20 anti 39


% ******************************************************************
% ZERO PANTING = SWSTOS TROPOS NA TO VRW
% ******************************************************************

xx = zeros(1,39);		% xx me 39 deigmata
xx(1:20) = x;
hh = zeros(1,39);		% hh me 39 deigmata
hh(1:20) = h;
XX = fft(xx);			% 39
HH = fft(hh);			% 39
YY = XX .* HH;			% 39
yy = real(ifft(YY));		% H yy exei kai ayti 39 (afou exei 39 kai h YY) = swsto = iso me tin synelixi tou plot 1 me to mauro
% Gia ypologistikes astoxies to real()

% PLOT 3
figure
plot(xx, 'red');
hold on
plot(hh, 'blue');
plot(yy, 'green')           % ******** PREPEI AYTIN H MAYRI yy tou plot 3 na einai idia me tin swsti SYNELIXI tou plot 1 ********
title('Zero padding (19)');

% PLOT 4
figure
plot(abs(XX), 'red');
hold on
plot(abs(HH), 'blue');
hold on
plot(abs(YY), 'green');
title('Zero padding CORRECT with ifft(fft(product))');
