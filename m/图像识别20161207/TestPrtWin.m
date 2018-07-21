clear all ; clc;  close all; warning off; %#ok

a =  PrtWin;

tic
a(:,:,1) = flipud(a(:,:,1));
a(:,:,2) = flipud(a(:,:,2));
a(:,:,3) = flipud(a(:,:,3));
toc


imshow(a);