clc
clear all

x = linspace(0, 4*pi, 1001);
noise = randn(1, 1001);
subplot(2,2,1);
plot(x, noise);
title('Random signal');

y = x + noise;              % y = x function with noise
subplot(2,2,2);
plot(x, y);
title('y = x with the noise effect');

y2 = sin(x) + noise;
subplot(2,2,3);
plot(x, y2);
title('y = sinx with the noise effect');

% For y3, I will add 30 normal distribution ----> Gaussian curve
y3 = [];
counter = 0;
for i = 1:1001
    counter = counter + 1;
    value = 0;
    for j = 1:30
        value = value + randn();
    end
    y3(counter) = value;
end
subplot(2,2,4);
spots = 20;
hist(y3, spots);
title('y =  Ó(30 normal distributions)');