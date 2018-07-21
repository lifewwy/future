function EntryPos = EntryRule1(c,N,hhllflag)
% 收盘价突破 N 天新高或新低
% clear all; clc; close all;
%% 导入数据
% dstruct = importdata('au888.csv');   % 黄金
% % display(dstruct.textdata(1,1))
% data = dstruct.data;
% o = data(:,1); h = data(:,2); l = data(:,3);
% c = data(:,4); v = data(:,5); atr = data(:,7);

%% 入场
% N = 20;
if strcmp(hhllflag,'hh')
    hh = hhigh(c,N);
    EntryPos = find(hh == c);
else
    
    ll = llow(c,N);
    EntryPos = find(ll == c);
    
end
