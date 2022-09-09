%% Generate a (6x3) Matrix within Specific Intervals for Exercise 6

clc
clear

A=[0 0 0; randsample(20:50,3);randsample(45:70,3); randsample(75:90,3); randsample(100:110,3); randsample(120:150,3)];
A6 = floor(A/10)*10;
