clear all; clc; close all;

% µ¼ÈëÊý¾Ý
dstruct = importdata('au888.csv');   % »Æ½ð
% dstruct = importdata('zn888.csv'); % Ð¿
dstruct = importdata('er888.csv'); % µ¾ 
% dstruct = importdata('cu888.csv'); % Í­
% dstruct = importdata('pb888.csv'); % Ç¦
% dstruct = importdata('cf888.csv'); % ÃÞ»¨
% dstruct = importdata('c9888.csv'); % ÓñÃ×
% dstruct = importdata('ru888.csv');   % Ïð½º
% dstruct = importdata('j9888.csv');   % ½¹Ì¿
% dstruct = importdata('rb888.csv');   % ÂÝÎÆ¸Ö
dstruct = importdata('sr888.csv');   % °×ÌÇ
% dstruct = importdata('if888.csv');   % ¹ÉÖ¸

display(dstruct.textdata(1,1))
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5); atr = data(:,7);
% c = c(1:900);
%% go long
[aa,bb] = macd(c);
[short,long] = movavg(c,10,180);


%% figure;
figure; myplotyy([aa,bb,zeros(size(c))],[c,short,long]);

% figure; movavg(c,15,120);






















































