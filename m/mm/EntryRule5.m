function pos = EntryRule5(c,atr,nWindowSize,N,flgCrossOverOrUnder)

% 通道突破，通道是均线加减N倍的atr

% clear all; clc; close all;

%% 导入数据
% % dstruct = importdata('au888.csv');   % 黄金
% dstruct = importdata('zn888.csv'); % 锌
% dstruct = importdata('er888.csv'); % 稻 
% dstruct = importdata('cu888.csv'); % 铜
% dstruct = importdata('pb888.csv'); % 铅
% dstruct = importdata('cf888.csv'); % 棉花
% dstruct = importdata('c9888.csv'); % 玉米
% % dstruct = importdata('ru888.csv');   % 橡胶
% % dstruct = importdata('a9888.csv');
% % dstruct = importdata('ta888.csv');
% 
% display(dstruct.textdata(1,1))
% data = dstruct.data;
% o = data(:,1); h = data(:,2); l = data(:,3);
% c = data(:,4); v = data(:,5); atr = data(:,7);
%%
% nWindowSize = 50; N = 3;
[short,~] = movavg(c,nWindowSize,nWindowSize);
uppr = short+N*atr;
lowr = short-N*atr;

if strcmp(flgCrossOverOrUnder , 'crossOver')
    pos = CrossOver(c,uppr);
else
    pos = CrossUnder(c,lowr);
end




















