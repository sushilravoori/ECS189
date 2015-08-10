dis=selectRegion(im1, positions1);
selectdes1=descriptors1(dis,:);
distance=dist2(selectdes1, descriptors2);
[row,col]=find(distance<0.19);
patchp=positions2(col,:);
patchs=scales2(col);
patcho=orients2(col);

figure;
imshow(im2);
displaySIFTPatches(patchp, patchs, patcho, im2);