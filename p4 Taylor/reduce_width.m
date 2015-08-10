function [reducedColorImage,reducedEnergyImage] = reduce_width(im,energyImage)
cumulativeEnergyMap = cumulative_minimum_energy_map(energyImage,'VERTICAL');
verticalSeam = find_optimal_vertical_seam(cumulativeEnergyMap);
row=size(im,1);
col=size(im,2);
dim=size(im,3);
reducedColorImage=zeros(row,col-1);
%reducedColorImage=uint(reducedColorImage);
reducedEnergyImage=zeros(row,col-1);
for i=1:dim
    for r=1:row
        reducedColorImage(r,:,i)=im(r,[1:verticalSeam(r)-1,verticalSeam(r)+1:end],i);
        reducedEnergyImage(r,:,1)=energyImage(r,[1:verticalSeam(r)-1,verticalSeam(r)+1:end],1);
    end
end
display_seam(im,verticalSeam,'VERTICAL');
end

