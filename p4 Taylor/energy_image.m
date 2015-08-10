function [matrix]=energy_image(im)
G=rgb2gray(im);
doubleG=double(G);
[xg,yg]=imgradient(doubleG);
matrix=sqrt(xg.^2+yg.^2);
end