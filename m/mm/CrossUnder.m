function pos = CrossUnder(short,long)
% short 从上往下穿过 long 的位置
% clear all; clc; close all;

%% 导入数据
% dstruct = importdata('gold.csv'); 
% % dstruct = importdata('zn888.csv'); 
% display(dstruct.textdata(1,1))
% data = dstruct.data;
% o = data(:,1); h = data(:,2); l = data(:,3);
% c = data(:,4); v = data(:,5); atr = data(:,7);

% [short long] = movavg(c,20,120);

%% short 从上往下穿过 long 的位置

ds = diff(sign(short-long));
pos = find(ds==-2)+1;


% plot(short); hold on;  plot(long,'r');
% plot(pos,short(pos),'ro');















