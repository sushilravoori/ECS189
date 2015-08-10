imo=imread('rainbow.jpg');
%a
Q=rgb2gray(imo);
imwrite(Q,'grayscale.jpg');

%b
N=imcomplement(Q);
imwrite(N,'negative.jpg');

%c
M=fliplr(imo);
imwrite(M,'mirror.jpg');

%d
r=imo(:,:,1);
g=imo(:,:,2);
b=imo(:,:,3);
im=imo;
im(:,:,1)=g;
im(:,:,2)=r;
imwrite(im,'swap.jpg');

%e
im1=im2double(imo);
im2=im2double(M);
ima=(im1+im2)/2;
imwrite(ima,'avg.jpg');

%f
r=randi(255,376,400);
im3=uint8(Q-uint8(r));
imwrite(im3,'subfromgray.jpg');

f=figure;
subplot(3,2,1);
imshow(Q);
title('grayscale');
subplot(3,2,2);
imshow(N);
title('negativegray');
subplot(3,2,3);
imshow(M);
title('mirror');
subplot(3,2,4);
imshow(im);
title('swap');
subplot(3,2,5);
imshow(ima);
title('avg');
subplot(3,2,6);
imshow(im3);
title('subFromGray')
saveas(f,'plot.jpg','jpg');