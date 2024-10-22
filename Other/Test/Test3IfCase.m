clear all
clc

degree = randi(100);
if degree <= 33
    rank = 'low';
elseif degree <= 67
    rank = 'medium';
else
    rank = 'high';
end    
display(degree);
display(rank);
        