function [per]=matchFeatureGabor(pic,mod)
S=0;
for i=1:size(pic,1)
    im=rgb2gray(imread(pic{i,1}));
    nextim=imread(pic{i,1});
    [feat]=ExtractFeat(pic{i,1});
    [feat1]=ExtractFeat(pic{i,2});
    temp=ones(size(pic{1,2},1),1)*feat;
    score1=sqrt(sum(((temp-feat1).^2),2));   
    score2=sqrt(sum(((temp(:,3841:end)-feat1(:,3841:end)).^2),2));
    score=score1+score2;
    %colorscor=cell2mat(pic{i,3});
    %score=score+2*colorscor;
    [~,index]=min(score);
    picture=pic{i,2};
    if(mod)
        close all
        
        figure('NumberTitle','off','Name','TestImage');
        imshow(nextim,[]);
        imMatch=imread(picture{index,1});
        figure('NumberTitle','off','Name','SimilarTrainImage');
        imshow(imMatch,[]);
    end
    
    
    postionTest=pic{i,1};
    str1=strsplit(postionTest,'\');
    str2=strsplit(str1{1,end},'_');
    posTest=str2double(str2{1,8});
    postionTest=picture{index,1};
    latTest=str2double(str2{1,4});%lat
    longTest=str2double(str2{1,5});%long
    %poss1=ell2xyz(latTest,longTest,0);
    %tabdil be xyz mamuli
    pos1=[latTest;longTest];
    str1=strsplit(postionTest,'\');
    str2=strsplit(str1{1,end},'_');
    posTrain=str2double(str2{1,8});
    latBest=str2double(str2{1,4});%lat
    longBest=str2double(str2{1,5});%long
    %poss2=ell2xyz(latBest,longBest,0);
    pos2=[latBest;longBest];
    
    
    diff(i,1)=norm(pos1-pos2)
    
    if(posTest-posTrain==0)
        S=S+1;
    end
    S
    i
end
per=S/size(pic,1);
mean(diff)

