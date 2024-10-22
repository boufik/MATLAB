%% 1. Preprocessing - Read, grayscale, adjust, binarize

% 1a. Read
I = imread("IMG_01.jpg");
% 1b. To grayscale
gs = im2gray(I);
% 1c. Adjust - Increase the contrast
gsAdj = imadjust(gs);
% 1d. Binarize - Adaptive thresholding
BW = imbinarize(gsAdj,"adaptive","ForegroundPolarity","dark");
imshowpair(I,BW,"montage")
% 1e. Find patterns
S = sum(BW,2);
plot(S)



%% 2. Preprocessing - Read, grayscale, adjust, filtering, binarize

% 2a. Read
I = imread("IMG_01.jpg");
% 2b. To grayscale
gs = im2gray(I);
% 2c. Adjust
gs = imadjust(gs);
% 2d. Filtering
H = fspecial("average",3);
gs = imfilter(gs,H,"replicate");
% 2e. Binarize
BW = imbinarize(gs,"adaptive","ForegroundPolarity","dark");
imshowpair(gs,BW,"montage")


%% 3. Preprocessing - Filtering, closing, background removal

% 3a. Read
I = imread("IMG_002.jpg");
% 3b. To grayscale
gs = im2gray(I);
% 3c. Adjust
gs = imadjust(gs);
% 3d. Filtering
H = fspecial("average",3);
gs = imfilter(gs,H,"replicate");
% 3e. Closing the image (make it brighter)
SEdisk = strel("disk",8);
Ibg = imclose(gs,SEdisk);
% 3f. Subtract images to remove background
gsSub =  Ibg - gs; 
% 3g. Invert the image
BW = ~imbinarize(gsSub);
imshowpair(I,BW,"montage")


%% 4. Adjust, filter, close, binarize function
function [signal,Ibw,stripes] = processImage(img)
    % This function processes an image using the algorithm 
    % developed in Image Processing Onramp.
    
    gs = im2gray(img);
    gs = imadjust(gs);
    
    H = fspecial("average",3);
    gssmooth = imfilter(gs,H,"replicate");
    
    SE = strel("disk",8);  
    Ibg = imclose(gssmooth, SE);
    Ibgsub =  Ibg - gssmooth;
    Ibw = ~imbinarize(Ibgsub);
    
    SE = strel("rectangle",[3 25]);
    stripes = imopen(Ibw, SE);
    
    signal = sum(stripes,2);
    
end
