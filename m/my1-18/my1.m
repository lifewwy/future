clear all; close all; clc; warning('off'); %#ok

MBload();
todaydate = datestr(today,'yyyy.mm.dd');
todaydate = str2double([todaydate(1:4) todaydate(6:7) todaydate(9:10)]);
market = 'SH_FUTURES';
code = '010520';
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
%% »­Í¼
plot(flipud(c));grid; axis tight; 
% movavg(flipud(c),20,120); grid;
% plot(tsobj);
% chartfts(tsobj);












