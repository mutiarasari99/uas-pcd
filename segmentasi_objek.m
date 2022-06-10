clc; clear; close all; warning off all;

Img = imread('noda.jpg');
figure, imshow(Img);

Lab= rgb2lab(Img);
figure, imshow(Lab);

ab = double(Lab(:,:,2:3));
nrows = size(ab,1);
ncols=size(ab,2);
ab=reshape(ab, nrows*ncols, 2);

numberOfClasses=2;
indexes = kmeans(ab,numberOfClasses);
classImage = reshape(indexes, nrows, ncols);
figure, imshow(classImage, []);

area = zeros(numberOfClasses, 1);
for n=1:numberOfClasses
    area (n)= sum(sum(classImage==n));
end

[~, min_area]=min(area);
bw=classImage==min_area;
figure,imshow(bw);

R=Img(:,:,1);
G=Img(:,:,2);
B=Img(:,:,3);

bw2=~imbinarize(B);
figure, imshow(bw2);

R(~bw2)=0;
G(~bw2)=0;
B(~bw2)=0;
RGB = cat(3,R,G,B);
figure,imshow(RGB)