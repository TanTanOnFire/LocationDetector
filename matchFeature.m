function [per]=matchFeature(pic,mod)
sum=0;
for i=1:size(pic,1)
    im=rgb2gray(imread(pic{i,1}));
    points = detectFASTFeatures(im);
    [f,~] = extractFeatures(im,points);
    picture=pic{i,2};
    for j=1:size(picture,1)
        im1=rgb2gray(imread(picture{j,1}));
        points1= detectFASTFeatures(im1);
        [f1,~] = extractFeatures(im1,points1);
        [pair,metri] = matchFeatures(f,f1);
        if(isempty(metri))
            metric=100;
        else
            metric=mean(metri);%size(pair,1);
        end
        score(i,j)=metric;
    end
    close all
    [~,index]=min(score(i,:));
    if(mod)
        imshow(im,[])
        figure
        imMatch=imread(picture{index,1});
        imshow(imMatch,[])
    end
    
    
    postionTest=pic{i,1};
    str1=strsplit(postionTest,'\');
    str2=strsplit(str1{1,end},'_');
    posTest=str2double(str2{1,8});
    postionTest=picture{index,1};
    str1=strsplit(postionTest,'\');
    str2=strsplit(str1{1,end},'_');
    posTrain=str2double(str2{1,8});
    if(posTest-posTrain==0)
        sum=sum+1;
    end
end
per=sum/size(pic,1);

