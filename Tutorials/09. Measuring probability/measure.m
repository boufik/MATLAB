clc
clear all

% I will load a 100x1 vector
R = csvread('random_integers.csv');
Length = length(R)
display('Even numbers are: ');
even = sum(mod(R, 2) == 0);
disp(even);
display('Odd numbers are: ');
odd = sum(mod(R, 2) == 1);
disp(odd);
display('Probabilities are: ');
probEven = even / Length;
probOdd = odd / Length;
disp([probEven, probOdd]);

display(' ');
display('Fives and minus_fives: ');
fives = sum(R == 5);
minusFives = sum(R == -5);
disp([fives, minusFives]);
display('Probability in abs(5): ');
abs5 = sum(abs(R) == 5) / Length;
disp(abs5);

