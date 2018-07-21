clear all; clc; close all;

% 导入数据
dstruct = importdata('黄金.csv');   % 黄金
% dstruct = importdata('zn888.csv'); % 锌
% dstruct = importdata('er888.csv'); % 稻 
% dstruct = importdata('cu888.csv'); % 铜
% dstruct = importdata('pb888.csv'); % 铅
% dstruct = importdata('cf888.csv'); % 棉花
% dstruct = importdata('c9888.csv'); % 玉米
% dstruct = importdata('ru888.csv');   % 橡胶

display(dstruct.textdata(1,1))
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5); atr = data(:,7);
%% macd
[a,b] = macd(c);
% plot(c); hold on;  plot(a*20,'g'); plot(b*20,'r'); grid;
tmp = zeros(size(c));
pos = CrossOver(a,b);
pos = pos(abs(a(pos))<.2);
pos1 = CrossOver(b,tmp);
pos1 = pos1(a(pos1)>0);
pos = union(pos,pos1);

plot(c); hold on; plot(pos,c(pos),'r.')
figure; plot(a);hold on; plot(b,'g'); plot(pos1,a(pos1),'r.');grid;
%% go long
nStart = 50;
posEntry =  nStart:length(c)-1;
posExit = zeros(size(posEntry));
Rinit = zeros(size(posEntry));

for posEntry1 = posEntry
    [posExit(posEntry1-nStart+1),Rinit(posEntry1-nStart+1)] = ExitRule90('goLong',posEntry1,c,atr,3,4);
end

% 结果分析
re = (c(posExit)-c(posEntry));%./Rinit';

ep = mean(re); 
op = length(re)*240/length(c);
vr = sum(re>0)/length(re); 
display(['平均收益风险比: ' num2str(ep) ...
    '    交易机会: ' num2str(op) '次/年    胜率: ' num2str(vr)]);

pos1 = posEntry(re>=0); pos2 = posEntry(re<0);
re1 = re(re>=0); re2 = re(re<0);



%% 画图
figure;plot(c,'LineWidth',2); hold on; grid
for i = 1:length(pos1)
    plot([pos1(i),pos1(i)],[c(pos1(i)),c(pos1(i))+re1(i)],'r')
end

for i = 1:length(pos2)
    plot([pos2(i),pos2(i)],[c(pos2(i)),c(pos2(i))+re2(i)],'g')
end

lead = 15; lag = 120;
[short,long] = movavg(c,lead,lag);
short(1:lead-1) = NaN; long(1:lag-1) = NaN;
plot(short,'k','LineWidth',2); plot(long,'r','LineWidth',2);

%% go short
% clearvars -except c atr
% 入场规则
nStart = 50;
posEntry =  nStart:length(c)-1;
posExit = zeros(size(posEntry));
Rinit = zeros(size(posEntry));

for posEntry1 = posEntry
    [posExit(posEntry1-nStart+1),Rinit(posEntry1-nStart+1)] = ExitRule90('goShort',posEntry1,c,atr,3,4);
end

% 结果分析

re = (c(posEntry)-c(posExit));%./Rinit;

ep = mean(re); 
op = length(re)*240/length(c);
vr = sum(re>0)/length(re); 
display(['平均收益风险比: ' num2str(ep) ...
    '    交易机会: ' num2str(op) '次/年    胜率: ' num2str(vr)]);

pos1 = posEntry(re>=0); pos2 = posEntry(re<0);
re1 = re(re>=0); re2 = re(re<0);
%% 画图
figure;plot(c,'LineWidth',2); hold on; grid
for i = 1:length(pos1)
    plot([pos1(i),pos1(i)],[c(pos1(i)),c(pos1(i))-re1(i)],'r')
end

for i = 1:length(pos2)
    plot([pos2(i),pos2(i)],[c(pos2(i)),c(pos2(i))-re2(i)],'g')
end
lead = 15; lag = 120;
[short,long] = movavg(c,lead,lag);
short(1:lead-1) = NaN; long(1:lag-1) = NaN;
plot(short,'k','LineWidth',2); plot(long,'r','LineWidth',2);


















































