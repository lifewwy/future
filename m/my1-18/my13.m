clear all; clc; close all;

% ��������
dstruct = importdata('au888.csv');   % �ƽ�
% dstruct = importdata('zn888.csv'); % п
dstruct = importdata('er888.csv'); % �� 
% dstruct = importdata('cu888.csv'); % ͭ
% dstruct = importdata('pb888.csv'); % Ǧ
% dstruct = importdata('cf888.csv'); % �޻�
% dstruct = importdata('c9888.csv'); % ����
% dstruct = importdata('ru888.csv');   % ��
% dstruct = importdata('j9888.csv');   % ��̿
% dstruct = importdata('rb888.csv');   % ���Ƹ�
dstruct = importdata('sr888.csv');   % ����
% dstruct = importdata('if888.csv');   % ��ָ

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






















































