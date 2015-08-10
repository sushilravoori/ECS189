function [histEqual, histClustered] = getHueHists(origImg, k)
    im=imread(origImg);
    hsv=rgb2hsv(im);
    c=size(hsv,1);
    r=size(hsv,2);
    s=c*r;
    imgVec=reshape(hsv,s, 3);
    hue_Vec=imgVec(:,1);
    f1=figure;
    hist(hue_Vec,k);
    histEqual = hist(hue_Vec,k);
    saveas(f1,'z_1.jpg','jpg');
    
   
    [~,meanHues]=kmeans(hue_Vec,k);
    kbin=sort(meanHues);
    f2=figure;
    hist(hue_Vec,kbin);
    saveas(f2,'z2_2.jpg','jpg');
    histClustered=hist(hue_Vec,kbin);

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


end

