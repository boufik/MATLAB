clear all
clc

N = 100;
f(1) = 0;
f(2) = 1;
for i = 3:N
    f(i) = f(i-1) + f(i-2);
end
f(1:20)