% Task 1
I = imread("IMG_001.jpg");

% Task 2
imshow(I)

% Task 3
I2 = imread("IMG_002.jpg");
imshow(I2)

% Task 4
imshowpair(I, I2, "montage")

% Further Practice
imwrite(I, "IMG_001.png")
I_new = imread("IMG_001.png");
imshow(I_new)
