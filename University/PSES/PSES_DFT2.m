f0 = 100;
Fs = 250;
N = 170;
dt = 1 / Fs;
n = [0:1:N-1];
t = dt*n;
x = cos(2*pi*f0*t);
X = fft(x);
stem(n, abs(X));
hold on;

Fs = 270
N = 180;
dt = 1 / Fs;
n = [0:1:N-1];
t = dt*n;
x = cos(2*pi*f0*t);
X = fft(x);
stem(n, abs(X));


