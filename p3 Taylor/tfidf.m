function [stoplist,out] = tfidf( hist )
 
% get term frequencies
n=size(hist, 1);
m=size(hist, 2);
c=1;
stoplist=zeros(10,m);
fH=zeros(n,1);
for i=1:n
    
    H = hist(i, :);    
    sumhist = sum( H );
    
    
    if sumhist == 0
        hist(i, :) = 0;
    else
        
        hist(i, :) = H / sum(H);
    end
end

ZZ = zeros(n, 1);
 

for j=1:n
    
    
    nonezero = nnz( hist(:, j) );
    fH(j,1)=sum(hist(:, j));
    if fH>4000;
        stoplist(c,:)=hist(j,:);
        c=c+1;
    end
    if nonezero
        ZZ(j) = log( m / nonezero );
    end
    
end
 
% apply weights for each document
for j=1:m
    hist(:, j) = hist(:, j)*ZZ(j);
end
 
out = hist;
 
end

 
 


