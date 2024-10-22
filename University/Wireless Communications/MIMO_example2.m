clear all
clc

% Data
H = [3 1 1; -1 3 1];
A = H * H'
% Matrix L
eigenvalues = eig(A);
idiazouses = sqrt(eigenvalues);
L = [idiazouses(1) 0; 0 idiazouses(2)]
% Matrix U
[U, lamda] = eig(A);
U
% Matrix V
V = H' * U * inv(L)