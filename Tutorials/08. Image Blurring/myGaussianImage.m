clc
clear all

% MAIN FUNCTION
n = 500;
sigmaList = 0:10:100;
for i = 1:length(sigmaList)
    sigma = sigmaList(i)
    H = myGaussian(n, sigma);
    imshow(H);
    caption = strcat('Sigma=', num2str(sigma));
    title(caption);
end


% Auxiliary Function
function H = myGaussian(n, sigma)
    twoSigmaSquared = 2*sigma*sigma;
    for i =1:n
        for j=1:n
            x = i - n/2;
            y = j - n/2;
            H(i, j) = exp(-(x^2+y^2) / twoSigmaSquared);
        end
    end
    H;
end