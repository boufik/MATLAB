clc
clear all

% MAIN FUNCTION
% Given N = 100 for example, I will find the probabilities: If there are n people 
% in the same room, what's the p someone shares the birthday
N = 100;
possibilities = birthdayParadox(N);
display('In 23 people, the possibility someone shares his birthday: ');
disp(possibilities(23));

% AUXILIARY FUNCTION
function possibilities = birthdayParadox(N)
    possibilities = zeros(N, 1);
    p = 365/365;
    for n = 1:N
        possibilities(n) = 1-p;
        p = p * (365 - n) / 365;
    end
    plot(possibilities);
end

