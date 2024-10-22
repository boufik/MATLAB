% 1. Read, grayscale, adjust, binarize
I = imread("IMG_006.jpg");
gs = im2gray(I);
gsAdj = imadjust(gs);
BW = imbinarize(gsAdj,"adaptive","ForegroundPolarity","dark");
imshowpair(I,BW,"montage")

I2 = imread("IMG_005.jpg");
gs2 = im2gray(I2);
gs2Adj = imadjust(gs2);
BW2 = imbinarize(gs2Adj);
imshowpair(I2,BW2,"montage")

% 2. Sum of rows to understand if this image is a receipt
S = sum(BW, 2);
plot(S);
S2 = sum(BW2, 2);
plot(S2);

% 3. Further practice
I = imread("IMG_018.jpg");
gs = im2gray(I);
gsAdj = imadjust(gs);
BW = imbinarize(gsAdj);
S = sum(BW, 2);
plot(S);
imshow(BW);
