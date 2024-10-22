clear all
clc

x = cos(0.5 * [1:1:20]);
h = 0.1 * abs([1:1:20] - 10);
y = conv(x, h)    % 39 deigmata = 20+20-1

plot(x, 'red');
hold on
plot(h, 'blue');
hold on
plot(y, 'black')

X = fft(x);
H = fft(h);             % Complex me 20 deigmata
Ytest = X .* H;         % Diastasi = 20
figure
plot(abs(X), 'red');
hold on
plot(abs(H), 'blue');
hold on
plot(abs(Ytest), 'black');
% Nai, alla to mauro fasma Ytest einai o DFT tou y = x synelixi h?
% Kati tetoio den isxyei
% Tha to dw to lathos me ifft 
ytest = ifft(Ytest);
plot(ytest, '+');
% To ytest einai lathos exei 20 anti 39

% ZERO PANTING = SWSTO
xx = zeros(1,39);
xx(1:20) = x;
figure
plot(xx, 'red');

hh = zeros(1,39);
hh(1:20) = h;
hold on
plot(hh, 'blue');

XX = fft(xx);
HH = fft(hh);
figure
plot(abs(XX), 'red');
hold on
plot(abs(HH), 'blue');
YY = XX .* HH;
plot(abs(YY), 'black');
% Tha dw me ton ifft kati me 39 deigmata kai sygkekrimena ayto to mauto tou
% figure1
yy = real(ifft(YY));    % Gia ypologistikes astoxies to real()
plot(yy, '*')