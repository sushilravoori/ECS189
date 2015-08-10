function [error] = computeQuantizationError(origImg,quantizedImg)
img=imread(origImg);
c=size(img,1);
r=size(img,2);
s=c*r;
imgVec=reshape(img,s, 3);
quanImgVec=reshape(quantizedImg,s, 3);
difVec=double(imgVec)-double(quanImgVec);
squareVec=difVec .* difVec;
error=sum(sum(squareVec));
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


end

