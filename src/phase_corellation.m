clear all;
close all;

originalImage = imread('Lenna.png');



 originalImagenoise=imnoise(originalImage,"gaussian",0.5);
 figure(5)
image(originalImagenoise)
 % Define the standard deviation for the Gaussian filter
filterStdDev = 1; % You can adjust this value based on your needs

% Create the Gaussian filter
gaussianFilter = fspecial('gaussian', [5 5], filterStdDev);

% Apply the filter to the noisy image
filteredImage = imfilter(originalImagenoise, gaussianFilter);

figure(6)
image(filteredImage)