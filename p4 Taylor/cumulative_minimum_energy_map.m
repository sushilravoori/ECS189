function [cumuMatrix]=cumulative_minimum_energy_map(energyImage,seamDirection)

        if(strcmp(seamDirection,'VERTICAL'))
            input=energyImage;
        elseif(strcmp(seamDirection,'HORIZONTAL'))
            input=flip(energyImage',2);
        end
        r=size(input,1);
        c=size(input,2);
        cumuMatrix(1,:)=input(1,:);
            for i=2:r
                for j=1:c
                    if j-1<1
                        cumuMatrix(i,j)=input(i,j)+min([cumuMatrix(i-1,j),cumuMatrix(i-1,j+1)]);
                    elseif (j+1>c)
                        cumuMatrix(i,j)=input(i,j)+min([cumuMatrix(i-1,j-1),cumuMatrix(i-1,j)]);
                    else
                        cumuMatrix(i,j)=input(i,j)+min([cumuMatrix(i-1,j-1),cumuMatrix(i-1,j),cumuMatrix(i-1,j+1)]);
                    end
                end
            end
            if(strcmp(seamDirection,'HORIZONTAL'))
                cumuMatrix=rot90(cumuMatrix);
            end
end

