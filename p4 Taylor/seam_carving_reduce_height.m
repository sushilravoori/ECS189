im=imread('IMG3.jpg');
energyImage = energy_image(im);
[reducedColorImage,reducedEnergyImage] = reduce_height(im,energyImage);
for i=2:100
    [reducedColorImage,reducedEnergyImage]=reduce_height(uint8(reducedColorImage),reducedEnergyImage);
end
%imagesc(im);
figure,imshow(uint8(reducedColorImage));
imwrite(uint8(reducedColorImage),'outputReduceHeightIMG3.png');
%save(uint8(reducedColorImage),' outputReduceWidthMall.png');
