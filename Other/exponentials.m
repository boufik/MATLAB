clc
clear all

x = -1.2:0.01:1.2;
y1 = exp(x);
c = 2;
y2 = c * exp(x);
y3 = exp(c * x);

plot(x, y1);
hold on
plot(x, y2);
hold on
plot(x, y3);
hold on
legend("y_1 = e^x" ,"y_2 = c \cdot e^x", "y_3 = e^{c \cdot x}");