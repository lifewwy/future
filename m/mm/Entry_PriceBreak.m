clear all ; clc; close all;

%% 价格突破入场

dstruct = importdata('橡胶.csv');  
% display(dstruct.textdata(1,1))
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5);  atr = atrfunc(h,l,c,12);



%% 做多

hh = hhigh(c,30);
entryPos1 = find(hh == c);
entryPos1 = entryPos1+1; % 第二天开盘时入场
entryPos1 = entryPos1(entryPos1<length(c));


n1 = 3; n2 = 4;
exitPos1 = zeros(1,length(entryPos1));
exitPrice1 = zeros(1,length(entryPos1));

for i = 1:length(entryPos1)
    [exitPos1(i),exitPrice1(i)] = Exit_TrackStopLossn_func(o,c,entryPos1(i),atr,n1,n2,'goLong');
end

entryPrice1 = o(entryPos1);

% profit = (exitPrice'-entryPrice)./(n1*atr(entryPos));
profit1 = (exitPrice1'-entryPrice1);

pos11 = find(profit1>=0);
pos12 = find(profit1<0);

re11 = profit1(pos11); re12 = profit1(pos12);

figure; bar(profit1);

figure;plot(c,'LineWidth',2); hold on; grid
for i = 1:length(pos11)
    plot([entryPos1(pos11(i)),entryPos1(pos11(i))],[c(entryPos1(pos11(i))),c(entryPos1(pos11(i)))+re11(i)],'r')
end
for i = 1:length(pos12)
    plot([entryPos1(pos12(i)),entryPos1(pos12(i))],[c(entryPos1(pos12(i))),c(entryPos1(pos12(i)))+re12(i)],'g')
end

%% 做空

ll = llow(c,30);
entryPos2 = find(ll == c);
entryPos2 = entryPos2+1; % 第二天开盘时入场
entryPos2 = entryPos2(entryPos2<length(c));


n1 = 3; n2 = 4;
exitPos2 = zeros(1,length(entryPos2));
exitPrice2 = zeros(1,length(entryPos2));

for i = 1:length(entryPos2)
    [exitPos2(i),exitPrice2(i)] = Exit_TrackStopLossn_func(o,c,entryPos2(i),atr,n1,n2,'goShort');
end

entryPrice2 = o(entryPos2);

% profit = (exitPrice'-entryPrice)./(n1*atr(entryPos));
profit2 = (entryPrice2-exitPrice2');

pos21 = find(profit2>=0);
pos22 = find(profit2<0);

re21 = profit2(pos21); re22 = profit2(pos22);

figure; bar(profit2);

figure;plot(c,'LineWidth',2); hold on; grid
for i = 1:length(pos21)
    plot([entryPos2(pos21(i)),entryPos2(pos21(i))],[c(entryPos2(pos21(i))),c(entryPos2(pos21(i)))+re21(i)],'r')
end
for i = 1:length(pos22)
    plot([entryPos2(pos22(i)),entryPos2(pos22(i))],[c(entryPos2(pos22(i))),c(entryPos2(pos22(i)))+re22(i)],'g')
end

%% 存在的问题

intersect(exitPos1,entryPos2)

intersect(exitPos2,entryPos1)








































