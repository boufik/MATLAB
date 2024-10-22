clear all
clc

H = [sqrt(3/2)+i sqrt(3/2)-i -sqrt(3/2)*i;
     1+sqrt(3/2)*i -1+sqrt(3/2)*i sqrt(3/2)];
A = H * H'
[U, L, V_H] = svd(H)
