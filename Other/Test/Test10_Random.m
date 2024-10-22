clear all
clc

a = rand()
b = rand(3)
c = rand(5,2)
d = randi(10000)
e = randi(100, 6)
f = randi(10,3, 4)
% Randn function
aa = randn()
bb = randn(3)
cc = randn(3, 7)
% Plot session
f = []; 
for i=1:30
    f(i) = randi(10);
end
plot(1:30, f, 'o')
title('Randomness')