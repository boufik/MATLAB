clear all
clc

polya = poly([1 2])
polyb = poly([4 6])
polyc = poly([3 -4])
polyd = poly([1 1 1])
polye = poly([2 3 5])
rootsb = roots(polyb)
rootse = roots(polye)
sumPolyAandPolyB = polya+polyb

value = polyval([1 4 4], 3)
product = conv([1 2], [1 4])
integral = polyint([3 2 10])
diff = polyder([1 5 8])

% Polyfit
% I will create 5 points
for i = 1:5
    x(i) = i;
    y(i) = randi(10);
end
x
y
p = polyfit(x, y, 6)
for i = 1:5
    value = y(i)
    evaluation = polyval(p, i)
end

% Using the p fitting polynomial, I will create a plot
% based on spots
x2 = 1: 0.05: 5;
y2 = polyval(p, x2);
plot(x,y, 'o', x2,y2,'r--')
title('Plot of Data (Points) and Model (Line)')

