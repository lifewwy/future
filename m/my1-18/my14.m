clear all; clc; close all;

% 导入数据
dstruct = importdata('au888.csv');   % 黄金
% dstruct = importdata('zn888.csv'); % 锌
% dstruct = importdata('er888.csv'); % 稻 
% dstruct = importdata('cu888.csv'); % 铜
% dstruct = importdata('pb888.csv'); % 铅
% dstruct = importdata('cf888.csv'); % 棉花
dstruct = importdata('c9888.csv'); % 玉米
% dstruct = importdata('ru888.csv');   % 橡胶
% dstruct = importdata('j9888.csv');   % 焦炭
% dstruct = importdata('rb888.csv');   % 螺纹钢
% dstruct = importdata('sr888.csv');   % 白糖
% dstruct = importdata('if888.csv');   % 股指
% dstruct = importdata('m9888.csv');   % 豆粕

display(dstruct.textdata(1,1))
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5); atr = data(:,7);
% c = c(1:900);
%% go long
% 入场
N = 20; EntryPos = EntryRule1(c,N,'hh');
% N1 = 10; N2 = 1.4; EntryPos = EntryRule2(h,l,c,N1,N2,'up');

% 出场
natr1 = 1.5;  natr2 = 1.5;
[posEntry, posExit, Rinit] = ExitRule1('goLong',EntryPos,c,atr,natr1,natr2);

% 结果分析
re = (c(posExit)-c(posEntry))./Rinit;

ep = mean(re); 
tp = sum(re);
op = length(re)*240/length(c);
vr = sum(re>0)/length(re); 
display(['平均收益风险比: ' num2str(ep) '   总收益: ' num2str(tp) ...
    '    交易机会: ' num2str(op) '次/年    胜率: ' num2str(vr)]);

pos1 = find(re>=0); pos2 = find(re<0);


%% figure;
% figure; myplotyy([aa,bb,zeros(size(c))],[c,short,long]);
% figure; movavg(c,15,120);
% figure; plot(c); hold on; plot(pos,c(pos),'r.');
figure; plot(c);
figure; bar(pos1,re(pos1),.2,'r'); hold on; bar(pos2,re(pos2),.1)

% figure; plot(c); hold on; stem(posEntry,ones(length(posEntry),1)*max(c));
% stem(posExit,ones(length(posExit),1)*max(c),'r'); ylim([min(c) max(c)]);




















































