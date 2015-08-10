%4a
load PS0_A.mat
b=A(:);
d=sort(b,'descend');
figure;
s=plot(d);
saveas(s,'descend.jpg','jpg');
%4b
figure;
h=histogram(A,20);
saveas(h,'histogram.jpg','jpg');
%4c
figure;
Z=A(51:100,1:50);
imshow(Z);
imwrite(Z, 'Z.jpg', 'jpg');
%4d
figure;
m=mean2(A);
W=A-m;
imshow(W);
imwrite(W, 'W.jpg','jpg');
%4e
figure;
o=zeros(100,100);
p=zeros(100,100);
r=find(A>m);
p(r)=255;
Y=cat(3,o,p,o);
imagesc(Y);
saveas(Y,'Y.jpg','jpg');
