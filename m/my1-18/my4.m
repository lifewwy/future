clear all; close all; clc; warning('off'); %#ok

MBload();
todaydate = datestr(today,'yyyy.mm.dd');
todaydate = str2double([todaydate(1:4) todaydate(6:7) todaydate(9:10)]);
% market = 'SH_FUTURES';
code = '010320';
if strcmp(code(1:2) , '01')
    market = 'SH_FUTURES';
elseif strcmp(code(1:2) , '02')
    market = 'DL_COMMODITY';
elseif strcmp(code(1:2) , '03')
    market = 'ZZ_COMMODITY';
end
MBGetName(market,code)
x =  MBGetKData(market,code, 1, 'D', 20051101, todaydate, 'Fresh');
MBUnload();


%% Construct financial time series object
fn = fieldnames(x);
lengthdata = length(x);
o = zeros(lengthdata,1);
h = zeros(lengthdata,1);
l = zeros(lengthdata,1);
c = zeros(lengthdata,1);
v = zeros(lengthdata,1);
year = zeros(lengthdata,1);
month = zeros(lengthdata,1);
day = zeros(lengthdata,1);
for i=1:lengthdata
    year(i) = x(i).Year;
    month(i) = x(i).Month;
    day(i) = x(i).Day;
    o(i) = x(i).OpenPrice;
    h(i) = x(i).HighPrice;
    l(i) = x(i).LowPrice;
    c(i) = x(i).ClosePrice;
    v(i) = x(i).Volume;
end
dates = datenum(year, month, day) ;
data = [o h l c v];
tsobj = fints(dates,data,{'Open' 'High' 'Low' 'Close' 'Volume'});
monod = issorted(tsobj);

[tmp pos] = sort(dates);
o = o(pos); h = h(pos); l = l(pos); c = c(pos); v = v(pos);
%% go long

AtrPeriod = 14; atr = atrfunc(h,l,c,AtrPeriod);

ShortAveragePeriod = 14; LongAveragePeriod = 120;
[short long] = movavg(c,ShortAveragePeriod,LongAveragePeriod);
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
k = 1;
nCount = 0;
index = zeros(Nsim,1);
N1  = 2;
N2 = 3;
for m = 1:Nsim
    nCount = nCount+1;
    index(nCount) = k;
    
    % posEntry(k) = 425;%randi([100,500],1,1);
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

%% DI

% N = 18;
% ah = buffer(h,N,N-1,'nodelay');
% al = buffer(l,N,N-1,'nodelay');
% ac = buffer(c,N,N-1,'nodelay');
% sizeah = size(ah);
% DX = zeros(length(h),1);
% pDI = zeros(length(h),1);
% nDI = zeros(length(h),1);
% DX(1:N-1) = NaN;
% pDI(1:N-1) = NaN;
% nDI(1:N-1) = NaN;
% for k = 1:sizeah(2)
%     
%     hh = diff(ah(:,k));
%     ll = diff(al(:,k));
%     
%     pDM = zeros(length(hh),1);
%     nDM = zeros(length(hh),1);
%     for i=1:length(hh)
%         if (hh(i)<0)&&(ll(i)>0)
%             pDM(i) = 0;
%             nDM(i) = 0;
%         end
%         if (hh(i)>0)&&(ll(i)>0)
%             pDM(i) = hh(i);
%             nDM(i) = 0;
%         end
%         
%         if (hh(i)<0)&&(ll(i)<0)
%             pDM(i) = 0;
%             nDM(i) = abs(ll(i));
%         end
%         
%         
%         if (hh(i)>0)&&(ll(i)<0)
%             if abs(hh(i))>=abs(ll(i))
%                 pDM(i) = hh(i);
%                 nDM(i) = 0;
%             else
%                 pDM(i) = 0;
%                 nDM(i) = abs(ll(i));
%             end
%         end
%         
%     end
%     
%     
%     % ATR
%     hl = ah(:,k)-al(:,k);
%     ch = abs(ac(1:end-1,k)-ah(2:end,k));
%     cl = abs(ac(1:end-1,k)-al(2:end,k));
%     TR = max([hl(2:end) ch cl],[],2);
%     ATR = sum(TR)/length(TR);
%     
%     pDI(N+k-1) = sum(pDM)/ATR;
%     nDI(N+k-1) = sum(nDM)/ATR;
%     
%     DX(N+k-1) = abs(pDI(N+k-1)-nDI(N+k-1))/abs(pDI(N+k-1)+nDI(N+k-1))*100;
%     
% end
% 
% [ADX1,ADX2] = movavg(DX,7,14);


%% »­Í¼
% plot(flipud(c));grid; axis tight;
% movavg(flipud(c),20,120); grid;
% plot(tsobj);
% chartfts(tsobj);
% figure; plot(c/1e3); hold on; plot(DX,'r'); grid;
% figure; plot(c/1e3); hold on; plot(pDI+150,'r'); plot(nDI+150,'k'); grid on;










