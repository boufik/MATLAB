% 1. Read, grayscale, adjust, binarize
I = imread("IMG_007.jpg");
gs = im2gray(I);
gs = imadjust(gs);
BW = imbinarize(gs,"adaptive","ForegroundPolarity","dark");
imshowpair(gs,BW,"montage")

% 2. Create and apply a 3x3 filter
H = fspecial("average", 3);
gssmooth = imfilter(gs, H);
BWsmooth = imbinarize(gssmooth,"adaptive","ForegroundPolarity","dark");
imshow(BWsmooth);

% 3. The above image contains an artificial border
gssmooth = imfilter(gs, H, "replicate");
BWsmooth = imbinarize(gssmooth,"adaptive","ForegroundPolarity","dark");
imshow(BWsmooth);

% 4. Compare the row sums
S2 = sum(BW, 2);
S3 = sum(BWsmooth, 2);
figure(1);
plot(S2, 'red')
hold on
plot(S3, 'green')
legend("No smooth", "Smooth")
