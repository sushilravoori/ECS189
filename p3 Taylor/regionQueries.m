 addpath('./provided_code/');
% 
 siftdir = '\\coe-itss-bfs.engr.ucdavis.edu\Classdata\ECS189\Materials\sift\';
 framesdir = '\\coe-itss-bfs.engr.ucdavis.edu\Classdata\ECS189\Materials\frames\';
% 
% % Get a list of all the .mat files in that directory.
% % There is one .mat file per image.


fname = [siftdir '/' fnames(200).name];
load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    
    % read in the associated image
imname = [framesdir '/' imname]; % add the full path
im1 = imread(imname);
 


reg_dis=selectRegion(im1, positions);
selectdescip=descriptors1(dis,:);


r_distance=dist2(kmean, selectdescip);
[minvec,minindex]=min(r_distance,[],1);
r_n = histc(minindex,edge);
    
clear descriptors positions scales orients im;




r_vec=zeros(length(histogram_matrix),1);
for i=1:length(histogram_matrix)
    r_a=histogram_matrix(i,:);
    r_sim=(sum(r_n .* r_a))/(sqrt(sum(r_n.^2))*sqrt(sum(r_a.^2)));
    r_vec(i,1)=r_sim;
end

newsv=sort(r_vec,'descend');
[sortedValues,sortIndex] = sort(r_vec,'descend');  
ii=1;
TF=isnan(newsv(ii));
while (TF==1)
    ii=ii+1;
    TF=isnan(newsv(ii))
end
maxIndex = sortIndex(ii:ii+5);


  
  


figure;
for j=2:6
    i=maxIndex(j);
    
    fprintf('reading frame %d of %d\n', i, length(fnames));
    
    % load that file
    fname = [siftdir '/' fnames(i).name];
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    
    
    
    % read in the associated image
    imname = [framesdir '/' imname]; % add the full path
    im = imread(imname);
 
    subplot(5,1,j-1);
    imshow(im);
    
    
    
    clear descriptors positions scales orients im 
end   
   