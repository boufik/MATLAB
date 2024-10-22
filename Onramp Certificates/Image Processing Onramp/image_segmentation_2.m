% 1. Load image, convert to grayscale, adjust
img = imread("IMG_001.jpg");
gs = im2gray(img);
gsAdj = imadjust(gs);
imshow(gsAdj)

% 2. Image Segmentation - Threshold = 128
BW = gsAdj > 255/2;
imshow(BW)

% 3. See the histogram
imhist(gsAdj)

% 4. New image segmentation
BW = gsAdj > 200;
imshow(BW)
