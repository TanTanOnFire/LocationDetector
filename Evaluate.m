function [out,percum,pic]=Evaluate(FeatureTrain,FeatureTest,addFeaTest,addFeaTrain,mod)
scorr=zeros(size(FeatureTest,1),size(FeatureTrain,1));
count=0;
for i=1:size(FeatureTest,1)
    close all
    
    if(mod)
        im=imread(addFeaTest{i,1});
        imshow(im,[])
    end
    
    postionTest=addFeaTest{i,1};
    pic{i,1}=postionTest;
    str1=strsplit(postionTest,'\');
    str2=strsplit(str1{1,end},'_');
    posTest=str2double(str2{1,8});
    
    for j=1:size(FeatureTrain,1)
        scorr(i,j)=pdist2(FeatureTest(i,:),FeatureTrain(j,:));
    end
    [mag,ind]=sort(scorr(i,:));
    for k=1:30
        
        postionTrain=addFeaTrain{ind(k),1};
        address{k,1}=postionTrain;
        magg{k,1}=mag(k);
        str11=strsplit(postionTrain,'\');
        str22=strsplit(str11{1,end},'_');
        posTrain=str2double(str22{1,8});
        if(posTest-posTrain==0)
            if(mod)
                figure
                im1=imread(addFeaTrain{ind(k),1});
                imshow(im1,[])
            end
            count=count+1;
            out(1,i)=k;
            %break
        end
    end
    pic{i,2}=address;
    pic{i,3}=magg;
end
for l=1:30
    ind=out==l;
    per(l,1)=sum(ind)/size(out,2);
end
percum=cumsum(per);
plot(percum)