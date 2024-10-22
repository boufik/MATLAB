clear all
clc

% Estw x[n], y[n] 2 akolouthies me 20 deigmata
% 1. Lathos
n = [0:1:19];
x = cos(2*pi*n);
h = 2*n + 3;

X = fft(x);
H = fft(h);
Y = X .* H;

yWrong = ifft(Y);
stem(n, abs(yWrong));


% 2. Swsto
x2 = [];
h2 = [];
for n=1:1:20
    x2(n) = cos(2*pi*n);
end
for nn = 21:1:39
    x2(n) = 0;
end
for n=1:1:20
    h2(n) = 2*n + 3;
end
for nn = 21:1:39
    h2(n) = 0;
end

X2 = fft(x2);
H2 = fft(h2);
Y2 = X2 .* H2;

yCorrect = ifft(Y2);
stem(n, abs(yCorrect));