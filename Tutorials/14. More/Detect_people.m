clc
clear all

I = imread('people.jpg');
detector = peopleDetectorACF();
[bboxes,scores] = detect(detector,I);
figure;
imshow(I);
labels = "person:"+scores;
% showShape('rectangle',bboxes,'Label',labels);