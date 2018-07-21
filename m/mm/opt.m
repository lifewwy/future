function [posEntryy,posExitt,re,tp]= opt(c,atr,nWindwoSize, Natr )

% clear all; clc; close all;

%% 导入数据
% dstruct = importdata('au888.csv');   % 黄金
% dstruct = importdata('zn888.csv'); % 锌
% % dstruct = importdata('er888.csv'); % 稻
% % dstruct = importdata('cu888.csv'); % 铜
% % dstruct = importdata('pb888.csv'); % 铅
% dstruct = importdata('cf888.csv'); % 棉花
% dstruct = importdata('c9888.csv'); % 玉米
% dstruct = importdata('ru888.csv');   % 橡胶
% % dstruct = importdata('j9888.csv');   % 焦炭
% % dstruct = importdata('rb888.csv');   % 螺纹钢
% dstruct = importdata('sr888.csv');   % 白糖
% % dstruct = importdata('if888.csv');   % 股指
% % dstruct = importdata('m9888.csv');   % 豆粕

% display(dstruct.textdata(1,1))
% data = dstruct.data;
% o = data(:,1); h = data(:,2); l = data(:,3);
% c = data(:,4); v = data(:,5); atr = data(:,7);
%% 交易
% nWindwoSize = 50; Natr = 3;

pos1 = EntryRule5(c,atr,nWindwoSize,Natr,'crossOver');
pos2 = EntryRule5(c,atr,nWindwoSize,Natr,'crossUnder');

posEntryy = zeros(length(pos1)+length(pos2),1);
posExitt = zeros(length(pos1)+length(pos2),1);

flgpos1 = ones(size(pos1));
flgpos2 = zeros(size(pos2));

pos = [pos1 ; pos2];
flgpos = [flgpos1 ; flgpos2];

[pos,i] = sort(pos);
flgpos = flgpos(i);

pospos = pos(pos>20);
if ~isempty(pospos)
pp = find(pos==pospos(1));
flgpos = flgpos(pp:end);
pos  = pospos;
else
    tp = 1;
    re = 1;
    return;
end

posEntry = pos(1); posEntryy(1) = pos(1);
re = zeros(size(pos)); nCount = 1; 

for i=1:length(pos)
    
    if flgpos(i)==1
        flgGoLongOrShort = 'goLong';
    else
        flgGoLongOrShort = 'goShort';
    end
    [posExit ,Rinit] = ExitRule90(flgGoLongOrShort,posEntry,c,atr,Natr,Natr);
    posExitt(nCount) = posExit;
    
    if flgpos(i)==1
        re(nCount) = (c(posExit)-c(posEntry))./Rinit;
    else
        re(nCount) = (c(posEntry)-c(posExit))./Rinit;
    end
    
    tmp = find(pos>posExit);
    if isempty(tmp)
        break;
    else
        posEntry = pos(tmp(1));
        nCount = nCount+1;
        posEntryy(nCount) = posEntry;
    end
end

%% 结果分析

posEntryy = posEntryy(1:nCount);
posExitt = posExitt(1:nCount);

re = re(1:nCount);
tp = sum(re);
% bar(re);


















