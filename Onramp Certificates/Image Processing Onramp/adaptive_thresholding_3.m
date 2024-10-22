% 1. Load, grayscale, adjust
img = imread("IMG_001.jpg");
gs = im2gray(img);
gsAdj = imadjust(gs);
imshow(gsAdj)

% 2. Automatic image segmentation ("Global") - Same threshold for all the image
BW = imbinarize(gsAdj);
imshow(BW)

% 3. Adaptive image segmentation ("Adaptive") - Different threshold by regions
BWadapt = imbinarize(gsAdj, "adaptive");
imshowpair(gsAdj, BWadapt, "montage");

% 4. Adaptive image segmentation ("Adaptive") with foreground polarity
BWadapt = imbinarize(gsAdj, "adaptive", "ForegroundPolarity","dark");
imshowpair(gsAdj, BWadapt, "montage");

% 5. Same process for a different image
img2 = imread("IMG_005.jpg");
gs2 = im2gray(img2);
gsAdj2 = imadjust(gs2);
BWadapt2 = imbinarize(gsAdj2, "adaptive", "ForegroundPolarity","dark");
imshowpair(BWadapt, BWadapt2, "montage")
