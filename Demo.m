clear;clc;close all

    addTrain='E:\semester 8\vision\project\code_Kalatian\ImageCoordinateDB\Train';
    addTest='E:\semester 8\vision\project\code_Kalatian\ImageCoordinateDB\Test';
    [FeatureTrain,addFeaTrain]=ExtractFeature(addTrain);
   [FeatureTest,addFeaTest]=ExtractFeature(addTest);
    %load('tfeat.mat');
    [out,percum,pic]=Evaluate(FeatureTrain,FeatureTest,addFeaTest,addFeaTrain,false);
    pre=matchFeatureGabor(pic,true);
    