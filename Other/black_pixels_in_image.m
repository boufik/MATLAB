clear all
close all
clc

% 1. Basics
I = imread("IMG_01.jpeg");
I2 = I;     I3 = I;
[rows, cols, channels] = size(I);
pixels = rows * cols;

% 2. Coordinates to be altered
pososto = 0.2;
converted = floor(pososto * pixels);
coords = zeros(converted, 2);
coords(:, 1) = randi([1 rows], converted, 1);
coords(:, 2) = randi([1 cols], converted, 1);

% 3. Convertions
desired = [255, 255, 255];                  % White
for i = 1 : converted
    row = coords(i, 1);
    col = coords(i, 2);
    I2(row, col, :) = desired;
end

for i = 1 : converted
    row = coords(i, 1);
    col = coords(i, 2);
    I3(row, col, :) = randi([0 255], 1, 3);
end


% 4. Plots
figure();
imshowpair(I, I2, "montage");
title(num2str(100*pososto) + "% of pixels changed to " + mat2str(desired))
figure();
imshowpair(I, I3, "montage");
title(num2str(100*pososto) + "% of pixels changed to random colors")