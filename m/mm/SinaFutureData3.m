clear all ; clc; % close all;

%% 新浪期货数据
url= 'http://stock2.finance.sina.com.cn/futures/api/json.php/IndexService.getInnerFuturesDailyKLine?symbol=RU0';
KLineData = urlread(url);
pos = find(KLineData=='"');

Data = zeros(length(pos)/2,1);
for i = 1:2:length(pos)
    % char(KLineData(pos(i)+1:pos(i+1)-1))
    if mod(i,12) == 1 % date
        Data((i+1)/2) = datenum(char(KLineData(pos(i)+1:pos(i+1)-1)));
    else % price
        Data((i+1)/2) = str2num(char(KLineData(pos(i)+1:pos(i+1)-1))); %#ok
    end
    
end

kData = reshape(Data,6,[]);
o = kData(2,:); h = kData(3,:); l = kData(4,:); c = kData(5,:);

Kdata1 = kData';
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

url = 'http://stock2.finance.sina.com.cn/futures/api/json.php/IndexService.getInnerFuturesDailyKLine?symbol=RU1409';
KLineData = urlread(url);
pos = find(KLineData=='"');

Data = zeros(length(pos)/2,1);
for i = 1:2:length(pos)
    % char(KLineData(pos(i)+1:pos(i+1)-1))
    if mod(i,12) == 1 % date
        Data((i+1)/2) = datenum(char(KLineData(pos(i)+1:pos(i+1)-1)));
    else % price
        Data((i+1)/2) = str2num(char(KLineData(pos(i)+1:pos(i+1)-1))); %#ok
    end
end

kData1403 = reshape(Data,6,[]);
o1403 = kData1403(2,:); h1403 = kData1403(3,:); 
l1403 = kData1403(4,:); c1403 = kData1403(5,:);

Kdata2 = kData1403';

%%  找出日期相同的位置 并 比较相同日期的价格是否相同。
% nCount = 0; SameDatePos = zeros(length(Kdata2),2);
% for i = 1:length(Kdata2)
%     tmp = find(Kdata1(:,1) == Kdata2(i,1));
%     if ~isempty(tmp)
%         nCount = nCount+1;
%         SameDatePos(nCount,1) = i;
%         SameDatePos(nCount,2) = tmp;
%     end
% end
% SameDatePos = SameDatePos(1:nCount,:);

[C,pos2,pos1] = intersect(Kdata1(:,1),Kdata2(:,1));
SameDatePos(:,1) = pos1;  SameDatePos(:,2) = pos2; 

SameDateAndPricePos1 = find(Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) == 0);
SameDateAndPricePos2 = find(Kdata1(SameDatePos(:,2),3) - Kdata2(SameDatePos(:,1),3) == 0);
SameDateAndPricePos3 = find(Kdata1(SameDatePos(:,2),4) - Kdata2(SameDatePos(:,1),4) == 0);
SameDateAndPricePos4 = find(Kdata1(SameDatePos(:,2),5) - Kdata2(SameDatePos(:,1),5) == 0);
SameDateAndPricePos = intersect( intersect(SameDateAndPricePos1,SameDateAndPricePos2), ...
    intersect(SameDateAndPricePos3,SameDateAndPricePos4) );

% 相同的日期和价格是否连续
if sum(sum(diff(SameDatePos(SameDateAndPricePos,:)))) == length(SameDateAndPricePos)*2-2
    disp('OK!');
end


% plot( Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) ); grid; .

figure; plot(Kdata1(:,2)); hold on;
plot(SameDatePos(SameDateAndPricePos,2),Kdata2(SameDatePos(SameDateAndPricePos,1),2),'r');










































































































