clear all ; clc; close all;

%% 价格突破入场

dstruct = importdata('al888(日线).csv');  
% dstruct = importdata('白糖.csv');  
% display(dstruct.textdata(1,1));
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5);  atr = atrfunc(h,l,c,35);

tic

nCount = 0;
entryPos = zeros(size(c));
exitPos = zeros(size(c));
exitPrice = zeros(size(c));
profit = zeros(size(c));

Nperiod = 30; n1 = 2; n2 = 3; InMarket = [1e5,0];
for i = Nperiod:length(c)-1
    if (max(c(i-Nperiod+1:i)) == c(i)) && ((i<InMarket(1)) || (i>InMarket(2)))
        nCount = nCount+1;
        entryPos(nCount) = i+1;
        [exitPos(nCount),exitPrice(nCount)] = Exit_TrackStopLossn_func(o,c,entryPos(nCount),atr,n1,n2,'goLong');
        profit(nCount) = exitPrice(nCount) - o(entryPos(nCount));
        InMarket = [entryPos(nCount),exitPos(nCount)];
        continue;
    elseif (min(c(i-Nperiod+1:i)) == c(i)) && ((i<InMarket(1)) || (i>InMarket(2)))
        nCount = nCount+1;
        entryPos(nCount) = i+1;
        [exitPos(nCount),exitPrice(nCount)] = Exit_TrackStopLossn_func(o,c,entryPos(nCount),atr,n1,n2,'goShort');
        profit(nCount) = o(entryPos(nCount)) - exitPrice(nCount) ;
        InMarket = [entryPos(nCount),exitPos(nCount)];
        continue;
    end
end

toc

entryPos = entryPos(1:nCount);
exitPos = exitPos(1:nCount);
profit = profit(1:nCount);
tp = sum(profit) %#ok total profit

% return risk rito
rrr = mean(profit./(n1*atr(entryPos))) %#ok

pos1 = find(profit>=0); pos2 = find(profit<0);
re1 = profit(pos1); re2 = profit(pos2);

figure; mybar(profit./(n1*atr(entryPos)));

figure;plot(c); hold on; grid
for i = 1:length(pos1)
    plot([entryPos(pos1(i)),entryPos(pos1(i))],[c(entryPos(pos1(i))),c(entryPos(pos1(i)))+re1(i)],'r','LineWidth',2)
end
for i = 1:length(pos2)
    plot([entryPos(pos2(i)),entryPos(pos2(i))],[c(entryPos(pos2(i))),c(entryPos(pos2(i)))+re2(i)],'g','LineWidth',2)
end










































