clear all; clc; close all;

%% 导入数据
% dstruct = importdata('au888.csv');   % 黄金
dstruct = importdata('zn888.csv'); % 锌
dstruct = importdata('er888.csv'); % 稻 
dstruct = importdata('cu888.csv'); % 铜
dstruct = importdata('pb888.csv'); % 铅
dstruct = importdata('cf888.csv'); % 棉花
dstruct = importdata('c9888.csv'); % 玉米
dstruct = importdata('ru888.csv');   % 橡胶
% dstruct = importdata('a9888.csv');
% dstruct = importdata('ta888.csv');

display(dstruct.textdata(1,1))
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5); atr = data(:,7);
%%
% pos1 = EntryRule4(c,20,2,'crossOver');
% pos2 = EntryRule3('long',c,10,60)
% pos = EntryRule1(c,30,'hh')
% pos = intersect(pos1,pos2);
pos = EntryRule5(c,atr,20,3,'crossOver');
[posEntry, posExit ,Rinit] = ExitRule1('goLong',pos,c,atr,3,3);
%%
% 结果分析
re = (c(posExit)-c(posEntry))./Rinit;

ep = mean(re); 
tp = sum(re);
op = length(re)*240/length(c);
vr = sum(re>0)/length(re); 
display(['平均收益风险比: ' num2str(ep) '   总收益: ' num2str(tp) ...
    '    交易机会: ' num2str(op) '次/年    胜率: ' num2str(vr)]);

pos1 = find(re>=0); pos2 = find(re<0);

figure; bar(pos1,re(pos1),.2,'r'); hold on; bar(pos2,re(pos2),.1)
%%
% pos1 = EntryRule4(c,20,2,'crossOver');
% pos2 = EntryRule3('long',c,10,60)
% pos = EntryRule1(c,30,'hh')
% pos = intersect(pos1,pos2);
pos = EntryRule5(c,atr,20,3,'crossUnder');
[posEntry, posExit ,Rinit] = ExitRule1('goShort',pos,c,atr,3,3);
%%
% 结果分析
re = (c(posEntry)-c(posExit))./Rinit;

ep = mean(re); 
op = length(re)*240/length(c);
vr = sum(re>0)/length(re); 
display(['平均收益风险比: ' num2str(ep) ...
    '    交易机会: ' num2str(op) '次/年    胜率: ' num2str(vr)]);

pos1 = find(re>=0); pos2 = find(re<0);

figure; bar(pos1,re(pos1),.2,'r'); hold on; bar(pos2,re(pos2),.1)



















