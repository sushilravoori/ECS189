function horizontalSeam = find_optimal_horizontal_seam(cumulativeEnergyMap)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
r=size(cumulativeEnergyMap,1);
c=size(cumulativeEnergyMap,2);
for i=c:-1:1
     if(i==c)
        Col=cumulativeEnergyMap(:,c);
     	minNub=min(Col);
     	[r2,~]=find(minNub==Col);
        r2=r2(1);
     else
        if(r2==1)
            Col=cumulativeEnergyMap(r2:r2+1,i);
            minNub=min(Col);
            [r3,~]=find(minNub==Col);
            r3=r3(1);
            r2=r2+r3-1;
        elseif(r2==r)
            Col=cumulativeEnergyMap(r2-1:r2,i);
            minNub=min(Col);
            [r3,~]=find(minNub==Col);
            r3=r3(1);
            r2=r2+r3-2;
        else
            Col=cumulativeEnergyMap(r2-1:r2+1,i);
            minNub=min(Col);
            [r3,~]=find(minNub==Col);
            r3=r3(1);
            r2=r2+r3-2;
        end
        %minNub=min([cumulativeEnergyMap(r,c2-1),cumulativeEnergyMap(r,c2),cumulativeEnergyMap(r,c2+1)]);
	    
     end
     horizontalSeam(1,i)=r2;
end

end

