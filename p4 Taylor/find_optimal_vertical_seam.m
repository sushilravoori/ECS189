function verticalSeam = find_optimal_vertical_seam(cumulativeEnergyMap) 
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
r=size(cumulativeEnergyMap,1);
c=size(cumulativeEnergyMap,2);
for i=r:-1:1
    % disp(i);
     
     if(i==r)
        Row=cumulativeEnergyMap(r,:);
     	minNub=min(Row);
     	[~,c2]=find(minNub==Row);
        c2=c2(1);
     else
        if(c2==1)
            Row=cumulativeEnergyMap(i,c2:c2+1);
        elseif(c2==c)
            Row=cumulativeEnergyMap(i,c2-1:c2);
        else
            Row=cumulativeEnergyMap(i,c2-1:c2+1);
        end
        %minNub=min([cumulativeEnergyMap(r,c2-1),cumulativeEnergyMap(r,c2),cumulativeEnergyMap(r,c2+1)]);
	    minNub=min(Row);
        %disp(c2);
        %disp(minNub);
        [~,c3]=find(minNub==Row);
        if (size(c3,2)>1)
            c3=c3(1,1);
        end
        if(c2==1)
            c2=c2+c3-1;
        else
            c2=c2+c3-2;
        end
     end
     verticalSeam(i,1)=c2;
end
	        
            
end

