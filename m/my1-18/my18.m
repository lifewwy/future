close all; clc; clear all;

%% 读复权数据
% clear all ; clc; close all;

dstruct = importdata('CF888(日线).csv');  
% display(dstruct.textdata(1,1));
data = dstruct.data;

o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5); 
atr = atrfunc(h,l,c,12); 

[a, b] = macd(c);
a(1:25) = a(26);  b(1:33) = b(34);

goldCross = CrossOver(a,b);
deadCross = CrossUnder(a,b);

flgGoLongOrShort = 'goLong'; Natr1 = 2; Natr2 = 2;
re = zeros(size(goldCross));
posExit = zeros(size(goldCross));
for i = 1:length(goldCross)
    posEntry = goldCross(i);
    [posExit(i) ,Rinit] = ExitRule90(flgGoLongOrShort,posEntry,c,atr,Natr1,Natr2);
    pos = find(deadCross>posEntry);
    if ~isempty(pos)
        posExit(i) = min(deadCross(pos(1)),posExit(i));
    end
    re(i) = (c(posExit(i))-c(posEntry))./Rinit;
end

%% figure; 
figure; plot(c); hold on; stem(goldCross,ones(length(goldCross),1)*max(c));
stem(posExit,ones(length(posExit),1)*max(c),'r'); 
hold on ; plot(5*a);  plot(5*b,'r'); plot(c); grid; 
% ylim([min(c) max(c)]);

figure; bar(re);

%% 
flgGoLongOrShort = 'goShort'; 
re = zeros(size(deadCross));
posExit = zeros(size(deadCross));
for i = 1:length(deadCross)
    posEntry = deadCross(i);
    [posExit(i) ,Rinit] = ExitRule90(flgGoLongOrShort,posEntry,c,atr,Natr1,Natr2);
    pos = find(goldCross>posEntry);
    if ~isempty(pos)
        posExit(i) = min(goldCross(pos(1)),posExit(i));
    end
    re(i) = (c(posEntry)-c(posExit(i)))./Rinit;
end

figure; plot(c); hold on; stem(deadCross,ones(length(deadCross),1)*max(c));
stem(posExit,ones(length(posExit),1)*max(c),'r'); 
hold on ; plot(5*a);  plot(5*b,'r'); plot(c); grid; 

figure; bar(re)











