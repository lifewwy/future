function pos = CrossOver(short,long)
% short �������ϴ��� long ��λ��
% clear all; clc; close all;

%% ��������
% dstruct = importdata('gold.csv'); 
% % dstruct = importdata('zn888.csv'); 
% display(dstruct.textdata(1,1))
% data = dstruct.data;
% o = data(:,1); h = data(:,2); l = data(:,3);
% c = data(:,4); v = data(:,5); atr = data(:,7);

% [short long] = movavg(c,20,120);

%% short �������ϴ��� long ��λ��

ds = diff(sign(short-long));
pos = find(ds==2)+1;


% plot(short); hold on;  plot(long,'r');
% plot(pos,short(pos),'ro');















