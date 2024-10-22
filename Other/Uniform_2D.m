clear all
clc

LIMIT = 100;
X = linspace(-LIMIT, LIMIT, 2*LIMIT + 1);
Y = linspace(-LIMIT, LIMIT, 2*LIMIT + 1);
K = 100;
x = zeros(1, K);
y = zeros(1, K);
for i = 1 : K
  x(i) = X(randi([1, length(X)]));  
  y(i) = Y(randi([1, length(Y)])); 
end
x
y
scatter(-LIMIT, -LIMIT, 'blue');
hold on
scatter(-LIMIT, LIMIT, 'blue');
hold on
scatter(LIMIT, -LIMIT, 'blue');
hold on
scatter(LIMIT, LIMIT, 'blue');
hold on
scatter(0, 0, 'blue');
for i = 1 : K
  scatter(x(i), y(i), 'rx');
  hold on
end



