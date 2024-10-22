clear all
close all
clc

% 1. Basics
prob = optimproblem("Description","Factory Location");
x = optimvar("x");
y = optimvar("y");
X = [5 40 70];
Y = [20 50 15];


% 2. Objective
d = sqrt((x - X) .^ 2 + (y -Y) .^ 2)        % 1 x 3 vector containing d1, d2, d3
dTotal = sum(d)
prob.Objective = dTotal;
show(prob)

% 3. Visualize
xvec = linspace(0,75);
yvec = linspace(0,75);
[x,y] = meshgrid(xvec,yvec);
distance = sqrt((x-X(1)).^2 + (y-Y(1)).^2)+...
    sqrt((x-X(2)).^2 + (y-Y(2)).^2)+...
    sqrt((x-X(3)).^2 + (y-Y(3)).^2);
contourf(x,y,distance)
ylabel("Y-Coordinate")
xlabel("X-Coordinate")
hold on
plot(X(1), Y(1), 'redX');
hold on
plot(X(2), Y(2), 'redX');
hold on
plot(X(3), Y(3), 'redX');
hold on
colorbar
