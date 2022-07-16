function [segImage] = vesselSegPC(inputImage)

%filters image A with a 2-D Gaussian smoothing kernel 
%with standard deviation specified by sigma.
%Apply gaussian filter to the image where s=1.45
img3= imgaussfilt(inputImage(:,:,2) ,1.45);

%Generation of image mask
%converts the truecolor image RGB to a binary image.
mask = im2bw(inputImage,20/255);

%SE = strel('octagon',R) creates a flat, octagonal structuring element,
%identifies the pixel in the image being processed and defines the neighborhood
%used in the processing of each pixel
%where R specifies the distance from the structuring element origin to the sides of the octagon,
%as measured along the horizontal and vertical axes. R must be a nonnegative multiple of 3.

se = strel('octagon',24);
%Erosion is the counter-process of dilation. If dilation enlarges an image then erosion shrinks the image.
%The way the image is shrunk is determined by the structuring element
%J = imerode(I,SE) erodes the grayscale, binary,
%or packed binary image I using the structuring element SE.
%. If the input image is of class logical, then im2uint8 changes true-valued elements to 255.



%The erosion process will move the structuring element from left to right and top to bottom.
%At the center position, indicated by the center of the structuring element, the process will look for whether there is a complete overlap with the structuring element or not.
%If there is no complete overlapping then the center pixel indicated by the center of the structuring element will be set white or 0. 
erodedmask = im2uint8(imerode(mask,se));


%Finding lamda - principal curvature
lamda2=prinCur(img3);
maxprincv = im2uint8(lamda2/max(lamda2(:)));
%.*=Element-wise multiplication
maxprincvmsk = maxprincv.*(erodedmask/255);

%Contrast enhancement uses name-value pairs to control aspects of the contrast enhancement.
newprI = adapthisteq(maxprincvmsk,'numTiles',[8 8],'nBins',128);
thresh = isodata(newprI);
vessels = im2bw(newprI,thresh);

%Filtering out small segments
vessels = bwareaopen(vessels, 1500);
segImage = vessels;
