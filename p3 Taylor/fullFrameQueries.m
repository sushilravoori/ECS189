addpath('./provided_code/');
% 
 siftdir = '\\coe-itss-bfs.engr.ucdavis.edu\Classdata\ECS189\Materials\sift\';
 framesdir = '\\coe-itss-bfs.engr.ucdavis.edu\Classdata\ECS189\Materials\frames\';
% 
% % Get a list of all the .mat files in that directory.
% % There is one .mat file per image.


% Loop through all the data files to build the histogram
edges=1:1500;
histogram_matrix=zeros(length(fnames),1500);
for i=1:length(fnames)
    
    fprintf('reading frame %d of %d\n', i, length(fnames));
    
    % load that file
    fname = [siftdir '/' fnames(i).name];
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    numfeats = size(descriptors,1);
    distance=dist2(kmean, descriptors);
    [minvec,minindex]=min(distance,[],1);
    n = histc(minindex,edge);
    
    histogram_matrix(i,:)=n;
    
    clear descriptors positions scales orients im
    
end




%[stoplist,histogram_matrix]=tfidf(histogram_matrix );
%apply tfidf for the histogram

%randome chose one by the user
find_hist=histogram_matrix(37 ,:);
sim_vec=zeros(length(histogram_matrix),1);
for i=1:length(histogram_matrix)
    a=histogram_matrix(i,:);
    sim=(sum(find_hist .* a))/(sqrt(sum(find_hist.^2))*sqrt(sum(a.^2)));
    %sim=(find_hist .* a) / sqrt((find_hist.* find_hist)*(a .* a));
    sim_vec(i,1)=sim;
end

newsv=sort(sim_vec,'descend');
[sortedValues,sortIndex] = sort(sim_vec,'descend');  
ii=1;
TF=isnan(newsv(ii));
while (TF==1)
    ii=ii+1;
    TF=isnan(newsv(ii))
end
maxIndex = sortIndex(ii:ii+6);


for j=2:6
    i=maxIndex(j);
    
    fprintf('reading frame %d of %d\n', i, length(fnames));
    
    % load that file
    fname = [siftdir '/' fnames(i).name];
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    
    
    
    % read in the associated image
    imname = [framesdir '/' imname]; % add the full path
    im = imread(imname);
 
    imshow(im);
  
    fprintf('hit a key to continue.\n');
    pause;
    
    clear descriptors positions scales orients im 
end   
   