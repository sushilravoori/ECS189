function [outputImg, meanColors] = quantizeRGB(origImg, k)
img=imread(origImg);
c=size(img,1);
r=size(img,2);
s=c*r;
imgVec=reshape(img,s, 3);
[~,meanColors]=kmeans(double(imgVec),k);
imgVecnew=pdist2(imgVec,meanColors);  
[~,indMin]=min(imgVecnew,[],2);   

imgVecNewQ=meanColors(indMin,:);  
outputImg=img;
outputImg(:,:,1)=reshape(imgVecNewQ(:,1),size(img(:,:,1)));
outputImg(:,:,2)=reshape(imgVecNewQ(:,2),size(img(:,:,1)));
outputImg(:,:,3)=reshape(imgVecNewQ(:,3),size(img(:,:,1)));
    
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


end

