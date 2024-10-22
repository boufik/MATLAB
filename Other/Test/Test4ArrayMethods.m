clear all
clc

A = zeros(2, 5)
B = ones(5, 2)
C = eye(6)
% Another way to create  an identity matrix
D = zeros(6, 6);
for i = 1:6
    D(i, i) = 1;
end
display(D)
randomMatrix = rand(3, 5)
maximumArray = max(randomMatrix)
maximumElement = max(randomMatrix, [], 'all')
% Another way to find the max element of a 2-D matrix
maximumElement2 = max(maximumArray)