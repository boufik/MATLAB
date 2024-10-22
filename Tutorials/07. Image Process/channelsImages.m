clc
clear all

% 1. Original Photo
A = imread('lena.png');
imageSize = size(A)
figure(1);
title('Original photo');
imshow(A);
% The 3rd dimension-number is: 1 = red channel, 2 = green, 3 = blue

% 2a. Display red channel - Red stays
R = A;
R(:, :, 2) = 0;     % Green = 0
R(:, :, 3) = 0;     % Blue = 0
figure(2);
title('Red Lena');
imshow(R);

% 2b. Display green channel - Green stays
G = A;
G(:, :, 1) = 0;     % Red = 0
G(:, :, 3) = 0;     % Blue = 0
figure(3);
title('Green Lena');
imshow(G);

% 2c. Display blue channel - Blue stays
B = A;
B(:, :, 1) = 0;     % Red = 0
B(:, :, 2) = 0;     % Green = 0
figure(4);
title('Blue Lena');
imshow(B);
%{
figure(5);
imshow(B(:, :, 1));
figure(6);
imshow(B(:, :, 2));
figure(7);
imshow(B(:, :, 3));
%}