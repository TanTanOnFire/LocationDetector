function [M]=featureMatch(feat,feat1)
F=reshape(feat,[48,80]);
for i=1:size(feat1,1)
    f=feat1(i,:);
    f=reshape(f,[48,80]);
    for j=1:size(f,1)
        for k=1:size(F,1)
            tempscor(j,k)=pdist2(f(j,:),F(k,:));
        end
    end
    M(i,1)=mean(min(tempscor'));
end
        
            
            