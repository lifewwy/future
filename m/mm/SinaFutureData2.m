clear all ; clc; close all;

%% 新浪期货数据
url= 'http://stock2.finance.sina.com.cn/futures/api/json.php/IndexService.getInnerFuturesDailyKLine?symbol=RU0';
KLineData = urlread(url);
pos = find(KLineData=='"');

Data = zeros(length(pos)/2,1);
for i = 1:2:length(pos)
    %char(KLineData(pos(i)+1:pos(i+1)-1));
    Data((i+1)/2) = str2num(char(KLineData(pos(i)+1:pos(i+1)-1))); %#ok
end

kData = reshape(Data,6,[]);
o = kData(2,:); h = kData(3,:); l = kData(4,:); c = kData(5,:);

%% TB 数据
% filename = 'ru888TB.csv';
% if exist(filename,'file')
%     dstruct = importdata(filename);
%     display(dstruct.textdata(1,:));
%     data = dstruct.data;
% end
% 
% c = data(:,4);

%% 新浪月份合约数据

url = 'http://stock2.finance.sina.com.cn/futures/api/json.php/IndexService.getInnerFuturesDailyKLine?symbol=RU1405';
KLineData = urlread(url);
pos = find(KLineData=='"');

Data = zeros(length(pos)/2,1);
for i = 1:2:length(pos)
    %char(KLineData(pos(i)+1:pos(i+1)-1));
    Data((i+1)/2) = str2num(char(KLineData(pos(i)+1:pos(i+1)-1))); %#ok
end

kData = reshape(Data,6,[]);
o1403 = kData(2,:); h1403 = kData(3,:); l1403 = kData(4,:); c1403 = kData(5,:);

%% 

[ startPoint1, startPoint2, FragmentLength ] = findSameFragment( c(end-300:end),c1403 );









































































































