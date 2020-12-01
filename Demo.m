clear;clc;close all

    addTrain='ImageCoordinateDB\Train';
    addTest='ImageCoordinateDB\Test';
    [FeatureTrain,addFeaTrain]=ExtractFeature(addTrain);
   [FeatureTest,addFeaTest]=ExtractFeature(addTest);
    %load('tfeat.mat');
    [out,percum,pic]=Evaluate(FeatureTrain,FeatureTest,addFeaTest,addFeaTrain,false);
    pre=matchFeatureGabor(pic,true);
    
