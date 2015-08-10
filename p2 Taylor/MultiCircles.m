function [centers] = MultiCircles(im, useGradient)%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [centers,rarray]=newdetectCircles(im,13,useGradient);
        c=centers;
        radi=rarray;
     radius=30
        [centers,rarray]=newdetectCircles(im,radius,useGradient);
        c=[centers;c];
        radi=[rarray;radi];
        
        radius=50
        [centers,rarray]=newdetectCircles(im,radius,useGradient);
        c=[centers;c];
        radi=[rarray;radi];
        
         radius=100
        [centers,rarray]=newdetectCircles(im,radius,useGradient);
        c=[centers;c];
        radi=[rarray;radi];
    
         a=figure;
        imshow(im);
        viscircles(c, radi,'EdgeColor','r');
saveas(a,'multi.jpg','jpg');


    
end
