clear all
close all
clc

I = imread("pca_all.png");
[ROWS, COLS, CHANNELS] = size(I);
for row = 1 : ROWS
    for col = 1 : COLS
        r = I(row, col, 1);
        g = I(row, col, 2);
        b = I(row, col, 3);
        if r >= 250 && g >= 250 && b >= 250
            I(row, col, 1) = 240;
            I(row, col, 2) = 240;
            I(row, col, 3) = 240;
        end
    end
end
imshow(I);