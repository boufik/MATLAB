clear all
clc

x = [];
y = [];
for i=1:100
    x(i) = i
    y(i) = 10 + 2.*randn();
end
plt = plot(x, y);
xlabel('x');
ylabel('f(x) = 1/ó*sqrt(2ð) * e^(-x^2/2ó^2)', 'Interpreter', 'Latex');