clear all
close all
clc

%% 1. Create the parameters
% 1a. Create 360 points of a circle
R = 100;
theta_moires = 0 : 359;
theta = theta_moires * pi/180;
x = R * cos(theta);    y = R * sin(theta);
Q = [x; y];
plot(x, y, 'blue');
hold on

% 1b. Select N points (by index) from this circle
NUM_POINTS = 10;
random_indices = randperm(length(theta), NUM_POINTS);
random_indices = sort(random_indices);
points = Q(:, random_indices);
x = points(1, :);
y = points(2, :);
plot(x, y, 'blacko');

% 1c. Logs
fprintf("There are %d points with index:\n\n", NUM_POINTS);
for i = 1 : NUM_POINTS
    fprintf("%d ---> [%.2f, %.2f]\n", random_indices(i), x(i), y(i))
end
fprintf("\n\n\n");


%% 2. Calculate areas
% 2a. Create the colors (3x7 array)
colors = [1 0 0; 0 1 0; 0 0 1; 0 1 1; 1 0 1; 1 1 0; 0 0 0]';
SIZE = size(colors, 2);

% 2b. Take the successive triangles
figure();
plot(x, y, 'blacko');
hold on
total_area = 0;
for i = 1 : NUM_POINTS-2
    which = [1 i+1 i+2];
    vector = points(:, which);
    area = heron(vector);
    total_area = total_area + area;
    fprintf("E%d = %.2f m^2\n", i, area);
    color_column = mod(i, SIZE) + 1;
    plot(points(1, which), points(2, which), 'Color', colors(:, color_column));
    hold on
    plot([points(1, 1) points(1, i+2)], [points(2, 1) points(2, i+2)], 'Color', colors(:, color_column));
end
fprintf("\nE = %.2f m^2 = %.2f acres", total_area, total_area/1000);



%% Auxiliary Functions
function area = heron(vector)
    % vector is ALWAYS 2x3, for the 3 points
    p1 = vector(:, 1);  p2 = vector(:, 2);  p3 = vector(:, 3);
    % Triangle sides
    a = dist(p1, p2);
    b = dist(p1, p3);
    c = dist(p2, p3);
    tau = (a+b+c) / 2;
    area = sqrt(tau * (tau-a) * (tau-b) * (tau-c));
end

function d = dist(p1, p2)
    x1 = p1(1);    x2 = p2(1);    y1 = p1(2);    y2 = p2(2);
    d = sqrt((x2-x1)^2 + (y2-y1)^2);
end
