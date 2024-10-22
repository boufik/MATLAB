clc
clear all

% MAIN FUNCTION
n = 100;
fullList = myfactorial(n);
xFac = fullList([1 : length(fullList)/2])
fac = fullList([length(fullList)/2+1 : length(fullList)])
% Display time
x = linspace(0, n, 1001)
y = zeros(1001);
counter = 0;
for i = 1:length(x)
    counter = counter + 1;
    y(counter) =  sqrt(2*pi*i) * (i/exp(1))^(i);
end
plot(x, y);


% AUXILIARY FUNCTION
function fullList = myfactorial(n)
    xFac = [];
    fac = [];
    fullList = [];
    if n == 0 || n == 1
        xFac(1) = 1;
        fac(1) = 1;
        fullList = [xFac(1) fac(1)];
    else
        xFac(1) = 1;
        fac(1) = 1;
        for i = 2:n
            xFac(i) = i;
            fac(i) = i * fac(i-1);
        end
        fullList = [xFac fac];
    end
    
end