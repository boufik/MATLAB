clc
clear all

% 1. Original Photo
A = imread('lena.png');
imageSize = size(A)
figure(1);
title('Original photo');
imshow(A);

% 2. Flip vertically
V = flipud(A);
figure(2);
title('Flipped vertically');
imshow(V);

% 3. Flip horizontally
H = fliplr(A);
figure(3);
title('Flipped horizontally');
imshow(H);