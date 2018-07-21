clear all; clc; close all;

% 导入数据
dstruct = importdata('黄金.csv'); 
% dstruct = importdata('zn888.csv'); 
% dstruct = importdata('er888.csv'); % 稻 
% dstruct = importdata('cu888.csv');
% dstruct = importdata('pb888.csv'); % 铅
% dstruct = importdata('cf888.csv'); % 棉花
% dstruct = importdata('c9888.csv'); % 玉米

display(dstruct.textdata(1,1))
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5); atr = data(:,7);

%% go long
% macd
[a,b] = macd(c);
% plot(c); hold on;  plot(a*20,'g'); plot(b*20,'r'); grid;
tmp = zeros(size(c));
pos = CrossOver(a,b);
posEntry = pos(abs(a(pos))<mean(abs(a(33:end)))*.2);

% plot(c); hold on; plot(pos,c(pos),'r.')
% figure; plot(a);hold on; plot(b,'g'); plot(pos1,a(pos1),'r.');grid;


% % 入场规则 
% ShortAveragePeriod = 20; LongAveragePeriod = 240;
% [short long] = movavg(c,ShortAveragePeriod,LongAveragePeriod);
% % g = gradient(short);
% % posEntry1 = find(g>0);
% posEntry1 = find(short-long>0);
% % posTmp = find(posEntry1>=LongAveragePeriod,1,'first');
% % posEntry1 = posEntry1(posTmp:end);
% % posEntry1 = 1:length(c);
% 
% % 入场规则  
% posEntry2 = LongAveragePeriod:length(c);
% 
% % 入场规则 
% posEntry3 = CrossOver(c,short);
% 
% % 入场规则 
% g = gradient(short);
% posEntry4 = find(g<0);
% 
% % 入场规则 
% fitLength = 30;
% tmp = buffer(long,fitLength,fitLength-1,'nodelay');
% slope = zeros(size(c));
% for i = 1:length(tmp)
%     p = polyfit((1:fitLength)',tmp(:,i),1);
%     slope(i+fitLength-1) = p(1);
% end
% posEntry5 = find(slope>0);
% 
% % 入场规则 
% posEntry = intersect(posEntry1,posEntry2);
% posEntry = intersect(posEntry,posEntry3);
% posEntry = intersect(posEntry,posEntry5);

% 出场
[posEntry ,posExit ,Rinit] = ExitRule1('goLong',posEntry,c,atr,3,4);

% 结果分析
re = (c(posExit)-c(posEntry))./Rinit;

ep = mean(re); 
op = length(re)*240/length(c);
vr = sum(re>0)/length(re); 
display(['平均收益风险比: ' num2str(ep) ...
    '    交易机会: ' num2str(op) '次/年    胜率: ' num2str(vr)]);

%% go short
% clearvars -except c atr
% 
% % 入场规则 
% ShortAveragePeriod = 20; LongAveragePeriod = 240;
% [short long] = movavg(c,ShortAveragePeriod,LongAveragePeriod);
% % g = gradient(short);
% % posEntry1 = find(g>0);
% posEntry1 = find(short-long<0);
% % posTmp = find(posEntry1>=LongAveragePeriod,1,'first');
% % posEntry1 = posEntry1(posTmp:end);
% % posEntry1 = 1:length(c);
% 
% % 入场规则  
% posEntry2 = LongAveragePeriod:length(c);
% 
% % 入场规则 
% posEntry3 = CrossUnder(c,short);
% 
% % 入场规则 
% g = gradient(short);
% posEntry4 = find(g>0);
% 
% % 入场规则 
% fitLength = 30;
% tmp = buffer(long,fitLength,fitLength-1,'nodelay');
% slope = zeros(size(c));
% for i = 1:length(tmp)
%     p = polyfit((1:fitLength)',tmp(:,i),1);
%     slope(i+fitLength-1) = p(1);
% end
% posEntry5 = find(slope<0);
% 
% % 入场规则 
% posEntry = intersect(posEntry1,posEntry2);
% posEntry = intersect(posEntry,posEntry3);
% posEntry = intersect(posEntry,posEntry5);
% 
% % 出场
% [posEntry posExit Rinit] = ExitRule1('goShort',posEntry,c,atr,2,3);
% 
% % 结果分析
% re = (c(posEntry)-c(posExit))./Rinit;
% 
% ep = mean(re); 
% op = length(re)*240/length(c);
% vr = sum(re>0)/length(re); 
% display(['平均收益风险比: ' num2str(ep) ...
%     '    交易机会: ' num2str(op) '次/年    胜率: ' num2str(vr)]);
%% 画图
pos1 = find(re>=0);
pos2 = find(re<0);
figure; subplot(2,2,1); bar(pos1,re(pos1),.2,'r');
hold on; bar(pos2,re(pos2),.1)

subplot(2,2,2); plot(c); hold on;
stem(posEntry,ones(length(posEntry),1)*max(c));
stem(posExit,ones(length(posExit),1)*max(c),'r');
ylim([min(c) max(c)]);

% subplot(2,2,3); movavg(c,ShortAveragePeriod,LongAveragePeriod);

% figure; hist(re,20);

% figure; plot(atr); hold on; plot(c); plot(short,'r'); plot(long,'k');
figure; movavg(c,20,240); hold on; plot(atr(240:end)+min(c)*.9);

% figure; plot(c); hold on; plot(short,'r'); 
% plot(posEntry3,c(posEntry3),'ro');

figure; plot(c); hold on; stem(posEntry,ones(length(posEntry),1)*max(c));
stem(posExit,ones(length(posExit),1)*max(c),'r'); ylim([min(c) max(c)]);

% figure; xrange = LongAveragePeriod+fitLength-1:length(c);
% plotyy(xrange,slope(xrange),xrange,long(xrange)); grid;

























































