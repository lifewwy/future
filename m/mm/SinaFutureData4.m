clear all ; clc; % close all;

%% 新浪期货数据

t1 = '13';
t2 = ['01'; '02'; '03'; '04'; '05'; '06'; '07'; '08'; '09'; '10'; '11'; '12'];

url = 'http://stock2.finance.sina.com.cn/futures/api/json.php/IndexService.getInnerFuturesDailyKLine?symbol=RU';

url = [url ,t1 , t2(1,:)];

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

kData = kData';
Kdata1 = kData;

getData = ['Kdata', t1, t2(1,:) ,'= kData'];
eval( getData )











































































































