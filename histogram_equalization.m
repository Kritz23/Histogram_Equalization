clc;
clear;
close all;
img=imread('lena.jpg');
img=rgb2gray(img);

subplot(2,2,1),imshow(uint8(img)),title('Original image');

histArray=zeros(1,256);
%histogram+linear array
k=1;
[m n]=size(img);
for i=1:m
    for j=1:n
        imgcol(k)=img(i,j);
        k=k+1;
    histArray(1,img(i,j)+1)=histArray(1,img(i,j)+1)+1;
    end
end
subplot(2,2,2),bar(histArray),title('histogram of original image');
%histogram equalization

bin=255;
siz=n*m;
cumArray=cumsum(histArray);
Histeq_Array=cumArray*bin/siz;
Histeq_Array=round(Histeq_Array);
Resuult=Histeq_Array(imgcol+1);

%histogram+2d
k=1
histArray=zeros(1,256);
[m n]=size(img);
for i=1:m
    for j=1:n
         img1(i,j)=Resuult(k);
        k=k+1;
    histArray(1,img1(i,j)+1)=histArray(1,img1(i,j)+1)+1;
    end
end
subplot(2,2,3),
imshow(uint8(img1)),title('histogram equalised image');
subplot(2,2,4)
bar(histArray),title('histogram equalization');
