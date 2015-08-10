
%get the first 30 figures


 %matrix=zeros(180000,128);
%matrix(i:j,:)=b;


%matrix=[new;matrix];

% This script is to illustrate a couple of the provided functions,
% and to demonstrate loading a data file.

addpath('./provided_code/');

siftdir = '\\coe-itss-bfs.engr.ucdavis.edu\Classdata\ECS189\Materials\sift\';
framesdir = '\\coe-itss-bfs.engr.ucdavis.edu\Classdata\ECS189\Materials\frames\';

% Get a list of all the .mat files in that directory.
% There is one .mat file per image.
fnames = dir([siftdir '/*.mat']);

fprintf('reading %d total files...\n', length(fnames));

N = 30;  % to visualize a sparser set of the features

    
% Loop through all the data files found
start=1;
frame=60;
matrix=zeros(180000,128);
mvec=zeros(180000,1);
for i=1:6000
     % load that file
    fname = [siftdir '/' fnames(i).name];
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    numfeats = size(descriptors,1);
    if(numfeats<30)
        frame=frame+1;
        clear descriptors positions scales orients im
        continue;
    end
    
    endm=start+29;
    fprintf('reading frame %d of %d\n', i+59, length(fnames));
    index = randsample(1:size(descriptors,1), N);
    b = descriptors(index,:);
   
    matrix(start:endm,:)=b;
    mvec(start:endm,1)=frame;
    start=start+30;
    
    clear descriptors positions scales orients im
    frame=frame+1;
end
%run kmeans on this

matrix=matrix(1:179190,:);
mvec=mvec(1:179190,:);
[member,kmeans,rms]=kmeansML(1500,matrix');
kmean=kmeans';

count = 0;

for i=1:600
    fname = [siftdir '\' fnames(i).name];
    load(fname, 'imname', 'descriptors', 'positions', 'scales', 'orients');
    
    comparedis=dist2(kmeans(200,:), descriptors);
    [minValue,index]=min(comparedis);
  
    
    if minValue < 0.50
        count = count + 1;
        imname = [framesdir '/' imname]; % add the full path
        im = imread(imname);
        im = getPatchFromSIFTParameters(positions(index,:), scales(index), orients(index), rgb2gray(im)); % a provided function
        subplot(4,5,count);
        imshow(im);
        
    end
    
    clear descriptors positions scales orients im
    if count == 20
        break
    end
 
end
