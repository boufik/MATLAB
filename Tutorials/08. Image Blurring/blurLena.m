clc
clear all

% MAIN FUNCTION
A = imread('lena.png');
filter = gaussianFilter(25, 5);     % I need a filter that has smaller dimensions than the photo
figure();
% I need a 2D signal-channel
redChannel = A(:, :, 1);
denominatorList = [1e2, 500, 1e3, 5000, 1e4, 5*1e4, 1e5];
for i = 1:length(denominatorList)
    denominator = denominatorList(i)
    newImage = conv2(double(redChannel), filter / denominator);             % Typecast: uint8 ----> double
    imshow(newImage);
    caption = strcat('Filter divided by:', num2str(denominator));
    title(caption);
end


% My gaussian filter
function H = gaussianFilter(n, sigma)
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