function [reducedColorImage,reducedEnergyImage] = reduce_height(im,energyImage)
cumulativeEnergyMap = cumulative_minimum_energy_map(energyImage,'HORIZONTAL');
horizontalSeam = find_optimal_horizontal_seam(cumulativeEnergyMap);
row=size(im,1);
col=size(im,2);
dim=size(im,3);
reducedColorImage=zeros(row-1,col);
%reducedColorImage=uint(reducedColorImage);
reducedEnergyImage=zeros(row-1,col);
for i=1:dim
    for c=1:col
        reducedColorImage(:,c,i)=im([1:horizontalSeam(c)-1,horizontalSeam(c)+1:end],c,i);
        reducedEnergyImage(:,c,1)=energyImage([1:horizontalSeam(c)-1,horizontalSeam(c)+1:end],c,1);
    end
end
%display_seam(im,horizontalSeam,'VERTICAL');

end