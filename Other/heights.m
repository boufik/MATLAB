clear all
close all
clc

%% 1. All the field
X_ALL = 20;
Y_ALL = 53;
LEN_X = 17;
LEN_Y = 28;

x_left = 0.3;
y_down = 10.5;
x_right = X_ALL - x_left;
y_up = Y_ALL - y_down;
I = linspace(-x_left, x_right, 2);
J = linspace(-y_down, y_up, 2);
K = zeros(1, 2);
L = ones(1, 2);

t1_x = I;               t1_y = - y_down * L;
t2_x = x_right * L;     t2_y = J;
t3_x = fliplr(I);       t3_y = y_up * L;
t4_x = -x_left * L;     t4_y = fliplr(J);

figure(1);
plot(t1_x, t1_y, 'red');
hold on
plot(t2_x, t2_y, 'red');
hold on
plot(t3_x, t3_y, 'red');
hold on
plot(t4_x, t4_y, 'red');
hold on


%% 2. Basket
spots_x = 4;
spots_y = 8;
step_x = LEN_X / spots_x;
step_y = LEN_Y / spots_y;

xx = 0 : step_x : LEN_X;
yy = 0 : step_y : LEN_Y;
X = length(xx);
Y = length(yy);

x = zeros(X, Y);
y = zeros(X, Y);
z = zeros(X, Y);

for i = 1 : X
    for j = 1 : Y
        x(i, j) = xx(i);
        y(i, j) = yy(j);
    end
end

x = x';
y = y';

I = linspace(0, LEN_X, 21);
J = linspace(0, LEN_Y, 21);
K = zeros(1, 21);
L = ones(1, 21);

t1_x = I;               t1_y = K;
t2_x = LEN_X * L;       t2_y = J;
t3_x = fliplr(I);       t3_y = LEN_Y * L;
t4_x = K;               t4_y = fliplr(J);

plot(t1_x, t1_y, 'blue--');
hold on
plot(t2_x, t2_y, 'blue--');
hold on
plot(t3_x, t3_y, 'blue--');
hold on
plot(t4_x, t4_y, 'blue--');
hold on

plot(x, y, 'blueo');
xlabel('x [m]');
ylabel('y [m]');
title('Field and basketball court');
grid on
set(gcf, 'Position',  [10, 10, LEN_X*24.5, LEN_Y*24.5]);
% set(gcf, 'Position',  [10, 10, X_ALL*14, Y_ALL*14]);

%% 3. z axis
z_cm = zeros(Y, X);
z_cm(1, :) = [161, 154, 146, 150, 154.5];
z_cm(2, :) = [161, 151, 144, 148.5, 156];
z_cm(3, :) = [160, 149, 143, 148.5, 156];
z_cm(4, :) = [159, 147.5, 143.5, 148.5, 155];
z_cm(5, :) = [158, 146, 142.5, 148.5, 155];
z_cm(6, :) = [158, 147, 142, 150, 155];
z_cm(7, :) = [158, 148, 142.5, 150, 158];
z_cm(8, :) = [159, 151, 145, 150, 160];
z_cm(9, :) = [160, 153, 148, 152, 161];

z = z_cm / 100;
MIN = min(min(z));
MAX = max(max(z));

% Reverse the heights
z = MAX - z;

figure(2);
plot3(x, y, z, 'blueo');
grid on
title('Basketball court');
xlabel('x [m]');
ylabel('y [m]');
zlabel('z [m]');
hold on

% Grid the points for a better view
for j = 1 : Y
    z_ = z(j, :);
    x_ = x(j, :);
    y_ = y(j, :);
    plot3(x_, y_, z_, 'blue--');
end

for i = 1 : X
    z_ = z(:, i);
    x_ = x(:, i);
    y_ = y(:, i);
    plot3(x_, y_, z_, 'blue--');
end

