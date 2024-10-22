% 1. Basics

I = imread("IMG_001.jpg");
gs = im2gray(I);
gs = imadjust(gs);
H = fspecial("average",3);
gs = imfilter(gs,H,"replicate");
BW = imbinarize(gs,"adaptive","ForegroundPolarity","dark");
imshowpair(gs,BW,"montage")

% 2. Close the image (make it whiter-brighter) using a structuring element

SE = strel("diamond", 5);
SE = strel("disk", 8)
Ibg = imclose(gs, SE);
imshow(Ibg);

% 3. Having isolated the background, I can subtract the images, to remove the background
gsSub = Ibg - gs;
imshow(gsSub);

% 4. The new image has a black background now, so I have to invert the result
BW = imbinarize(gsSub);
BWsub = ~BW;
imshow(BWsub);

% 5. Compare the sum rows
S2 = sum(BW, 2);
S3 = sum(BWsub, 2);
figure(1);
plot(S2, 'red');
hold on
plot(S3, 'green');
legend("No closing", "Closing");

% 6. Image bottom hat preprocessing ----> "new" is the image after CLOSING and SUBTRACTING

new = imbothat(gs, SE);
BW_new = imbinarize(new);
BW_new = ~BW_new;
imshow(BW_new);
