function [feat]=ExtractFeat(pic)

gab = Create_Gab_Kernels([10 10 10 10 10 10 10 10],80);%[10 10 10 10 10 10 10 10], 20
gab1 = Create_Gab_Kernels([10 10 10 10 10 10 10 10],160);%[10 10 10 10 10 10 10 10], 20
sizegab=size(gab,3);
sizegab1=size(gab1,3);
tempfeat=zeros(1,sizegab);

feat=zeros(size(pic,1),48*sizegab);
featSc=zeros(size(pic,1),12*sizegab1);

for i=1:size(pic,1)
    if(size(pic,1)==1)
        im=im2double(rgb2gray(imread(pic(i,:))));
        im1=im2double((imread(pic(i,:))));
    else
        im=im2double(rgb2gray(imread(pic{i,1})));
        im1=im2double((imread(pic{i,1})));
    end
    
    

    count=1;
    for k=1:6
        firstRow=((k-1)*80)+1;
        for j=1:8
            firstCol=((j-1)*80)+1;
            temp=im(firstRow:firstRow+79,firstCol:firstCol+79);
            im_gab= Compute_Gabbed_Image(im2double(temp),gab);
            firstfeat=((count-1)*sizegab)+1;
            tempfeat=0;
            for l=1:size(im_gab,2)
                imgab=im_gab{1,l};
                tempfeat(1,l)=mean(imgab(:));
            end
            feat(i,firstfeat:firstfeat+(sizegab-1))=tempfeat;
            count=count+1;
        end
    end
    
    
    count=1;
    for k=1:3
        firstRow=((k-1)*160)+1;
        for j=1:4
            firstCol=((j-1)*160)+1;
            temp=im(firstRow:firstRow+159,firstCol:firstCol+159);
            im_gab1= Compute_Gabbed_Image(im2double(temp),gab1);
            firstfeat=((count-1)*sizegab1)+1;
            tempfeat=0;
            for l=1:size(im_gab1,2)
                imgab=im_gab1{1,l};
                tempfeat(1,l)=mean(imgab(:));
            end
            featSc(i,firstfeat:firstfeat+(sizegab-1))=tempfeat;
            count=count+1;
        end
    end
   feat(i,3841:3840+960)=featSc(i,1:end);
end
