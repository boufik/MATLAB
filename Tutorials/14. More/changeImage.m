clc
clear all

% MAIN FUNCTION
A = imread('lena.png');
[M, N, rgb] = size(A);
limit1 = -50;
limit2 = 50;

offset = 0
A2 = changeLenaImage(A, M, N, limit1, limit2);
A3 = changeLenaImage(A, M, N, limit1, limit2);
A4 = changeLenaImage(A, M, N, limit1, limit2);
% Concatenate 3D objects = images
figure();
A_array = cat(4, A, A2, A3, A4);
montage(A_array);

% Auxiliary Function
function A_new = changeLenaImage(A, M, N, limit1, limit2)
    offset = randi([limit1 limit2])
    for i = 1:M
        for j = 1:N
            A_new(i, j, 1) = A(i, j, 1) + offset;
            A_new(i, j, 2) = A(i, j, 2) + offset;
            A_new(i, j, 3) = A(i, j, 3) + offset;
        end
    end
    A_new;
end