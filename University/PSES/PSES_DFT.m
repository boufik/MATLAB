f0 = 10;
Fs = 100;   % 5 times better than Nyquist

N1 = 50;
n = [0:1:N1-1];
Dt = 1/Fs;
t = n*Dt;
x = exp(i*2*pi*f0*t);
X = fft(x);
stem(n, abs(X));
figure(1);
hold on

N2 = 55;
n = [0:1:N2-1];
Dt = 1/Fs;
t = n*Dt;
x = exp(i*2*pi*f0*t);
X = fft(x);
stem(n, abs(X));


