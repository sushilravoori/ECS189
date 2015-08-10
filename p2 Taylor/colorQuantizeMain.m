origImg='fish.jpg';
k=4;
k2=25;
[RGB1, meanColors] = quantizeRGB(origImg, k);
[HSV1, meanHues] = quantizeHSV(origImg, k);
error1 = computeQuantizationError(origImg,RGB1);
error2 = computeQuantizationError(origImg,HSV1);
[histEqual, histClustered] = getHueHists(origImg, k);

[RGB2, meanColors] = quantizeRGB(origImg, k2);
[HSV2, meanHues] = quantizeHSV(origImg, k2);
error1_1 = computeQuantizationError(origImg,RGB2);
error2_2 = computeQuantizationError(origImg,HSV2);
[histEqual2, histClustered2] = getHueHists(origImg, k2);










f=figure;
subplot(2,2,1);
imshow(RGB1);
title('RGB1,k=5');

subplot(2,2,2);
imshow(HSV1);
title('HSV1,k=5');

subplot(2,2,3);
imshow(RGB2);
title('RGB2,k=25');

subplot(2,2,4);
imshow(HSV2);
title('HSV2,k=25');

%saveas(f,'plot.jpg','jpg');