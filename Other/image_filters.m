clear all
close all
clc

% 1. Grayscale, adjust, binarize
I = imread("nature.jpg");
gs = im2gray(I);
gs = imadjust(gs);
BW = imbinarize(gs,"adaptive","ForegroundPolarity","dark");
figure(1);
imshowpair(gs,BW,"montage")

% 2. Grayscale, adjust, filter, binarize
H = fspecial("average", 3);
gssmooth = imfilter(gs, H);
BWsmooth = imbinarize(gssmooth,"adaptive","ForegroundPolarity","dark");
figure(2);
imshowpair(gssmooth, BWsmooth, "montage");

% 3. The above image contains an artificial border
gssmooth = imfilter(gs, H, "replicate");
BWsmooth = imbinarize(gssmooth,"adaptive","ForegroundPolarity","dark");
figure(3);
imshowpair(gssmooth, BWsmooth, "montage");

% 4. My new filter
[rows, cols, channels] = size(I);
N = 3;
I2 = I;
for row = 1 : rows
    for col = 1 : cols
        if (row > N) && (row < rows - N) && (col > N) && (col < cols - N)
            subI = I(row-N:row+N, col-N:col+N, :);
            r = mean(mean(subI(:, :, 1)));
            g = mean(mean(subI(:, :, 2)));
            b = mean(mean(subI(:, :, 3)));
            I2(row, col, :) = [r, g, b];
        end
    end
end

figure();
imshowpair(I, I2, "montage");