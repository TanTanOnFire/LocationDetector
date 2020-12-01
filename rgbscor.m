
queryDir = fullfile(dataDir,'queries',filesep);
queryobj=imageSet(queryDir);
queryImage=(read(queryobj,2329));
%queryImage=imadjust(queryImage);
%H2 = rgbhist(queryImage,10,0);
orginalI=imageSet(dataDir);
H2 =hsvHistogram(queryImage);
%H2= waveletTransform(queryImage);
tic
for i=1:500
    %ims=read(orginalI,id(i));
    %ims=imadjust(ims);
    H1=feargb(id(i),:);
    %H1= rgbhist(ims,10,0);
    %H1=hsvHistogram(ims);
    %H1= waveletTransform(ims);
    scorr(i)=pdist2(H1,H2,'spearman');
end
toc
[mr,idd]=sort(scorr);
for j=1:100
ra1=read(dataobj,id(idd(j)));
imshowpair(queryImage,ra1,'montage')
filename=sprintf('C:\\Users\\ramin rahimi\\Desktop\\fazl\\bag of word\\image1\\ram%d.jpg',j);
imwrite(ra1,filename,'jpg');
end