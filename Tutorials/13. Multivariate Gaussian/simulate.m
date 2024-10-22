clc
clear all

mean = [0 0];       % A 1x2 vector
Sigma = [0.25 0.6; 0.6 2];
% Sigma is 2x2 with Sigma(1,2) = Sigma(2,1) and Sigma(1,1) = ó^2 of 1st
% dimension, Sigma(2,2) =  ó^2 of the 2nd dimension

x = -3: 0.1: 3;
y = -3: 0.1: 3;
[X, Y] = meshgrid(x, y);
% Now, I will create the function
F = mvnpdf([X(:) Y(:)], mean, Sigma);
F = reshape(F, length(Y), length(X));
surf(X, Y, F);

caxis([min(F(:)) - 0.5*range(F(:)), max(F(:))]);
xlabel('x');
ylabel('y');
zlabel('Probability Density');