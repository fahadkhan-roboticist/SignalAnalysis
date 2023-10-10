% Clear the command window, workspace, and close all figures
clc;
clear all;
close all;

% Load an image (replace '.png' with the actual image file path and name)
I = imread('barbara_gray.png');

% Display the original image
figure;
imshow(I);
title('Original Image');

% Create a disk-shaped structuring element with a radius of 15 pixels
se = strel('disk', 15);

% Perform erosion on the original image
er = imerode(I, se);

% Display the result after erosion
figure;
imshow(er);
title('Image after Erosion');

% Perform dilation on the eroded image
dl = imdilate(er, se);

% Display the result after dilation
figure;
imshow(dl);
title('Image after Dilation');

% Calculate the top-hat transform by subtracting the dilated image from the original
eg = I - dl;

% Display the result after the top-hat transform
figure;
imshow(eg);
title('Image after Top-Hat Transform');

% Convert the original image to a binary image
binaryI = imbinarize(I);

% Display the binary image
figure;
imshow(binaryI);
title('Binary Image from Original Image');

% Convert the top-hat transformed image to a binary image
binaryEg = imbinarize(eg);

% Display the binary image from the top-hat transformed image
figure;
imshow(binaryEg);
title('Binary Image from Top-Hat Transformed Image');
