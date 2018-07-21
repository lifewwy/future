clear all; clc; close all;

% 导入数据
% dstruct = importdata('au888.csv');   % 黄金
% dstruct = importdata('zn888.csv'); % 锌
dstruct = importdata('橡胶.csv'); %  
% dstruct = importdata('cu888.csv'); % 铜
% dstruct = importdata('pb888.csv'); % 铅
% dstruct = importdata('cf888.csv'); % 棉花
% dstruct = importdata('c9888.csv'); % 玉米
% dstruct = importdata('ru888.csv');   % 橡胶
% dstruct = importdata('j9888.csv');   % 焦炭
% dstruct = importdata('rb888.csv');   % 螺纹钢
% dstruct = importdata('sr888.csv');   % 白糖
% dstruct = importdata('if888.csv');   % 股指

display(dstruct.textdata(1,1))
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5); atr = data(:,7);
% c = c(1:900);
%% go long
% % 入场规则 
% % Perform decomposition at level 3 of s using db5. 
wavename = 'db5'; N = 5;
for i = 1:300
    [cc,ll] = wavedec(c(1:i),N,wavename);
    a = wrcoef('a',cc,ll,wavename,N);
    plot(a); hold on;
end
% postmp1 = find(diff(sign(gradient(a1)))==2)+1;
%% 小波



%% figure;
% plot(a); hold on; plot(c,'r');
% figure; plot(c); hold on; plot(a,'r'); plot(a1,'g'); grid;
% figure; plot(a1); hold on; plot(a2,'r')






















































