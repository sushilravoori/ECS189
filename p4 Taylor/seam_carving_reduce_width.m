im=imread('inputSeamCarvingPrague.jpg');
energyImage = energy_image(im);
[reducedColorImage,reducedEnergyImage] = reduce_width(im,energyImage);
for i=2:100
    [reducedColorImage,reducedEnergyImage]=reduce_width(uint8(reducedColorImage),reducedEnergyImage);
end
%imagesc(im);
figure,imshow(uint8(reducedColorImage));
%imwrite(uint8(reducedColorImage),' outputReduceWidthP2.png');
save(uint8(reducedColorImage),' outputReduceWidthPrague.png');
