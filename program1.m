% Clear the command window, workspace, and close all figures
clc;
clear all;
close all;

% Load an image (replace '.png' with the actual image file path and name)
img = imread('night.png');
I = rgb2gray(img);

% Display the original image
subplot(2, 3, 1);
imshow(img);
title('Original Image');

% Create a disk-shaped structuring element with a radius of 15 pixels
se = strel('disk', 5);

% Perform erosion on the original image
er = imerode(I, se);

% Display the result after erosion
subplot(2, 3, 2);
imshow(er);
title('Image after Erosion');

% Perform dilation on the eroded image
d1 = imdilate(I, se);
dl = imdilate(er, se);

% Display the result after dilation
subplot(2, 3, 3);
imshow(d1);
title('Image after Dilation');

% Calculate the top-hat transform by subtracting the dilated image from the original
eg = I - dl;

% Display the result after the top-hat transform
subplot(2, 3, 4);
imshow(eg);
title('Image after Top-Hat Transform');

% Convert the original image to a binary image
binaryI = imbinarize(I);

% Display the binary image
subplot(2, 3, 5);
imshow(binaryI);
title('Binary Image from Original Image');

% Convert the top-hat transformed image to a binary image
binaryEg = imbinarize(eg);

% Display the binary image from the top-hat transformed image
subplot(2, 3, 6);
imshow(binaryEg);
title('Binary Image from Top-Hat Transformed Image');
