%Question 1
clc
clear all
close all
% Loading the grayscale image
img = imread('lena.tif');

%Question 2
% Calculating the histogram of pixel intensities
[pixelCounts, grayLevels] = imhist(img);

% Ploting the histogram
bar(grayLevels, pixelCounts);
title('Histogram of Pixel Intensities');
xlabel('Gray Level');
ylabel('Pixel Count');

% Calculating the probability of occurrence for each gray level
numPixels = numel(img);
probabilities = pixelCounts/numPixels


[codes, avg_length] = huffmandict(0:255, probabilities)

entropy = 0;
for i = 1:length(codes)
    if probabilities(i) ~= 0
    entropy = entropy - probabilities(i) .* log2(probabilities(i));
    end
end
entropy

efficiency = entropy / avg_length*100
