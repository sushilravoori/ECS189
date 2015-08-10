function [centers] = detectCircles(im, radius, useGradient)%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


img=rgb2gray(im);

BW=edge(img,'Canny');
BW=double(BW);
H=zeros(size(BW));
[x,y]=find(BW);
[r,c]=size(BW);
%s=r*c;
if(useGradient==0)
    for i=1:length(x)
        %for r=1:radius
          for t=0:360
               theta=degtorad(t); 
                a=round(x(i)+radius*cos(theta));
                b=round(y(i)+radius*sin(theta));
      %       d=x(i)*cos(theta)+y(i)*sin(theta);
                if(a>0 && a<=r && b>0 && b<=c)
                    H(a,b)=H(a,b)+1;
                end
          end
    end
  
     
end

if(useGradient==1)
    [dy,dx] = gradient(double(img));
    dy=dy*(-1);
    grad = atan2(dy,dx);
    for i=1:length(x)
     theta=grad(x(i),y(i));
        %  theta=atan2(dy(y(i,1),dx(x(i,1))));
    %theta=degtorad(t); 
    %for t=theta-theta:2*theta
    for j=1:length(x)
        a=round(x(j)+radius*cos(theta));
        b=round(y(j)+radius*sin(theta));
        
                if(a>0 && a<=r && b>0 && b<=c)
                    H(a,b)=H(a,b)+1;
                end
    end
    end
end

    H = H/max(H(:));
   % [Y,X]=find(H==max(H(:)));
    %centers=zeros(1,2);
    %centers(1,1)=X;
    %centers(1,2)=Y;
    
    [Y,X]=find(H>0.85);
    centers=zeros(length(X),2);
    radi=zeros(length(X),1);
    centers(:,1)=X;
    centers(:,2)=Y;
    radi(:,1)=radius;
    
    
    %im(X,Y,:)=0;
    %a=figure;
    imshow(im);
    viscircles(centers, radi,'EdgeColor','r');
    saveas(a,'j.jpg','jpg');
    b=figure;
    imagesc(H);
    saveas(b,'h.jpg','jpg');

end

