function [x, y, z]= findmax(a)

r=size(a,1);
c=size(a,2);
s=r*c;
for i=1:c
 for j=1:r
  m=max(max(a));
  pos=i+j*c;
  if(a(pos)==m)
   x=m;
   y=i;
   z=j;
  end
 end
end

