clc
clear all

% MAIN FUNCTION
A = imread('lena.png');
filter = fspecial('gaussian', 25, 5);     % I need a filter that has smaller dimensions than the photo
figure();
% I need a 2D signal-channel
redChannel = A(:, :, 1);
denominatorList = [10, 50, 100, 500, 1000];
for i = 1:length(denominatorList)
    denominator = denominatorList(i)
    newImage = conv2(double(redChannel), filter / denominator);             % Typecast: uint8 ----> double
    imshow(newImage);
    caption = strcat('Filter divided by:', num2str(denominator));
    title(caption);
end
