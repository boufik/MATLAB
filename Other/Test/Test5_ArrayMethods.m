clear all
clc

A = [1 2 3; 4 5 6; 7 8 9; 2 3 4]
B = [8 9 10 11 12]
lenA = length(A)
sizeA = size(A)
sizeB = size(B)
isSortedA = issorted(A)
isSortedB = issorted(B)
a1 = ismatrix(A)
a2 = ismatrix(B)
a3 = isvector(A)
a4 = isvector(B)
C = [1 3 2; 5 8 7; 6 9 4]
sortC = sort(C)
D = [1 9 5; 4 2 6; 8 3 7]
flipD = flip(D)
rotateD = rot90(D)
transposeA = transpose(A)


