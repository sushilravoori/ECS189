function [outputImg, meanHues] = quantizeHSV(origImg, k)
img=imread(origImg);
hsv_img = rgb2hsv(img);
c=size(img,1);
r=size(img,2);
s=c*r;
imgVec=reshape(hsv_img,s, 3);
hue_Vec=imgVec(:,1);
[~,meanHues]=kmeans(hue_Vec,k);
imgVecnew=pdist2(hue_Vec,meanHues); 
[~,indMin]=min(imgVecnew,[],2);   

imgVecNewQ=meanHues(indMin,:);  

newImg=hsv_img;
%newImg(:,:,1)=imgVecNewQ;
newImg(:,:,1)=reshape(imgVecNewQ(:,1),size(img(:,:,1)));
outputImg=hsv2rgb(newImg);

%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


end

