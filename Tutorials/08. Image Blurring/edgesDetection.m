clc
clear all

A = imread('lena.png');
colors(1, :) = ' red ';
colors(2, :) = 'green';
colors(3, :) = ' blue';
figure();
% Next method is applied in 2D objects like color channels
for i = 1:3
    channel = A(:, :, i);
    E = edge(channel);
    imshow(E);
    caption = ['Edge detection in ' colors(i, :) ' channel'];
    title(caption);
end