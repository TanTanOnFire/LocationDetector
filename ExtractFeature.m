function [Feature,addFea]=ExtractFeature(add)
imds = imageDatastore(add);
Feature=zeros(size(imds.Files,1),32);
for i=1:size(imds.Files,1)
    im=imread(imds.Files{i,1});
    hsvColorHistogram = hsvHistogram(im);
    Feature(i,:)=hsvColorHistogram;
    addFea{i,:}=imds.Files{i,1};
end
