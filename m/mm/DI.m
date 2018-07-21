clear all; close all; clc; warning('off'); %#ok

MBload();
todaydate = datestr(today,'yyyy.mm.dd');
todaydate = str2double([todaydate(1:4) todaydate(6:7) todaydate(9:10)]);
market = 'SH_FUTURES';
code = '010020';
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
%% DI

N = 18;
ah = buffer(h,N,N-1,'nodelay');
al = buffer(l,N,N-1,'nodelay');
ac = buffer(c,N,N-1,'nodelay');
sizeah = size(ah);
DX = zeros(length(h),1);
pDI = zeros(length(h),1);
nDI = zeros(length(h),1);
DX(1:N-1) = NaN;
pDI(1:N-1) = NaN;
nDI(1:N-1) = NaN;
for k = 1:sizeah(2)
    
    hh = diff(ah(:,k));
    ll = diff(al(:,k));
    
    pDM = zeros(length(hh),1);
    nDM = zeros(length(hh),1);
    for i=1:length(hh)
        if (hh(i)<0)&&(ll(i)>0)
            pDM(i) = 0;
            nDM(i) = 0;
        end
        if (hh(i)>0)&&(ll(i)>0)
            pDM(i) = hh(i);
            nDM(i) = 0;
        end
        
        if (hh(i)<0)&&(ll(i)<0)
            pDM(i) = 0;
            nDM(i) = abs(ll(i));
        end
        
        
        if (hh(i)>0)&&(ll(i)<0)
            if abs(hh(i))>=abs(ll(i))
                pDM(i) = hh(i);
                nDM(i) = 0;
            else
                pDM(i) = 0;
                nDM(i) = abs(ll(i));
            end
        end
        
    end
    
    
    % ATR
    hl = ah(:,k)-al(:,k);
    ch = abs(ac(1:end-1,k)-ah(2:end,k));
    cl = abs(ac(1:end-1,k)-al(2:end,k));
    TR = max([hl(2:end) ch cl],[],2);
    ATR = sum(TR)/length(TR);
    
    pDI(N+k-1) = sum(pDM)/ATR;
    nDI(N+k-1) = sum(nDM)/ATR;
    
    DX(N+k-1) = abs(pDI(N+k-1)-nDI(N+k-1))/abs(pDI(N+k-1)+nDI(N+k-1))*100;
    
end

[ADX1,ADX2] = movavg(DX,7,14);


%% »­Í¼
% plot(flipud(c));grid; axis tight;
% movavg(flipud(c),20,120); grid;
% plot(tsobj);
% chartfts(tsobj);
figure; plot(c/1e3); hold on; plot(DX,'r'); grid;
figure; plot(c/1e3); hold on; plot(pDI+150,'r'); plot(nDI+150,'k'); grid on;











