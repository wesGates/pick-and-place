function [BW,maskedImage, images] = segmentImage(RGB)
%segmentImage Segment image using auto-generated code from Image Segmenter app
%  [BW,MASKEDIMAGE] = segmentImage(RGB) segments image RGB using
%  auto-generated code from the Image Segmenter app. The final segmentation
%  is returned in BW, and a masked image is returned in MASKEDIMAGE.

% Auto-generated by imageSegmenter app on 29-Apr-2023
%----------------------------------------------------

tic
% Threshold image with global threshold
BW = imbinarize(im2gray(RGB));
m1 = BW;
figure, imshow(BW)

% Invert mask
BW = imcomplement(BW);
m2 = BW;
figure, imshow(BW)


% Clear borders
BW = imclearborder(BW);
m3 = BW;
figure, imshow(BW)


% Fill holes
BW = imfill(BW, 'holes');
m4 = BW;
figure, imshow(BW)


% Open mask with disk
radius = 3;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imopen(BW, se);
m5 = BW;
figure, imshow(BW)


% Remove small objects
BW = bwareaopen(BW, 500);
m6 = BW;
figure, imshow(BW)
toc

images = {m1, m2, m3, m4, m5, m6}; % m1, m2... etc. All for debugging
% figure, montage(images, 'Size', [2,3]);

% Create masked image.
maskedImage = RGB;
maskedImage(repmat(~BW,[1 1 3])) = 0;
end

