clear all; clc; close all;

dstruct = importdata('»Æ½ð.csv'); 
display(dstruct.textdata(1,1))
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5); atr = data(:,7);
ma1 = data(:,8); ma2 = data(:,9);

%% go long
ShortAveragePeriod = 14; LongAveragePeriod = 120;
[short, long] = movavg(c,ShortAveragePeriod,LongAveragePeriod);
g = gradient(short);
posEntry1 = find(g>0);
% posEntry1 = find(short-long>0);
% posTmp = find(posEntry1>=LongAveragePeriod,1,'first');
% posEntry1 = posEntry1(posTmp:end);
% posEntry1 = 1:length(c);

LlowPeriod = 20;  M = 2;
llv = llow(c,LlowPeriod); posEntry2 = find(c==llv);
posEntry2 = posEntry2(posEntry2<length(c)-M);
posEntry2 = posEntry2(posEntry2>M);
posEntry2 = posEntry2(c(posEntry2+M)>c(posEntry2-M))+M;
% posEntry2 = 1:length(c);

posEntry = intersect(posEntry1,posEntry2);

Nsim = length(posEntry);
% posEntry = zeros(Nsim,1); 
posExit = zeros(Nsim,1); 
Rinit = zeros(Nsim,1);
k = 1; nCount = 0;
index = zeros(Nsim,1);
N1  = 2; N2 = 3;
for m = 1:Nsim
    nCount = nCount+1;
    index(nCount) = k;

    Rinit(k) = N1*mean(atr(posEntry(k)-10:posEntry(k)));
    pMax = c(posEntry(k))-N2*mean(atr(posEntry(k)-10:posEntry(k)));
    for i=posEntry(k):length(c)
        if c(posEntry(k))-c(i)>=Rinit(k)
            posExit(k) = i;
            break;
        end
        s = c(i)-N2*mean(atr(i-10:i));
        if s>=pMax
            pMax = s;
        end
        if (c(i)<pMax)
            posExit(k) = i;
            break;
        end
    end
    if posExit(k)==0
        posExit(k) = length(c);
        break;
    end
    k = find(posEntry>posExit(k),1,'first');
    if isempty(k)
        break;
    end
end

posEntry = posEntry(index(1:nCount));
posExit = posExit(index(1:nCount));
re = (c(posExit)-c(posEntry)) ...
    ./Rinit(index(1:nCount));

ep = mean(re) %#ok
tp = ep*length(re) %#ok
vr = sum(re>0)/length(re) %#ok

%% »­Í¼
pos1 = find(re>=0);
pos2 = find(re<0);
figure; bar(pos1,re(pos1),.2,'r');
hold on; bar(pos2,re(pos2),.1)

figure; movavg(c,ShortAveragePeriod,LongAveragePeriod);

figure; plot(c); hold on;
stem(posEntry,ones(length(posEntry),1)*max(c));
stem(posExit,ones(length(posExit),1)*max(c),'r');

figure; hist(re,20);
plot(atr); hold on; plot(c); plot(ma1,'r'); plot(ma2,'k');
figure; movavg(c,20,240)































































