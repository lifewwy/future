% https://eodhistoricaldata.com/

% 具体见如下网页
% https://eodhistoricaldata.com/knowledgebase/api-for-historical-data-and-volumes/

% 5b58b853733183.22292691 该 token 一天能用 100000  次
% 付费用户 lifewwy  EOD Historical Data — US ONLY
token = '5b58b853733183.22292691';

% 数据存储目录
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = [fp(1:pp(end)),'eodhistoricaldata\'];

%% 数据文件存储
symbolName = 'BPI';
url = ['https://eodhistoricaldata.com/api/eod/',symbolName,'.US?api_token=',...
    token,'&period=d'];
fileName = [directory,symbolName,'.US.csv'];
outfilename = websave(fileName,url);

if ~strcmp(fileName,outfilename)
    return;
end

d = importdata(outfilename);
d = d.data;
c = d(:,5); % Adjusted_close
o = d(:,1).*(d(:,5)./d(:,4)); % Adjusted_open
h = d(:,2).*(d(:,5)./d(:,4)); % Adjusted_high
l = d(:,3).*(d(:,5)./d(:,4)); % Adjusted_low
plot(c);

%% 指定日期区间
startDate = datestr(today-50,'yyyy-mm-dd');
endDate = datestr(today,'yyyy-mm-dd');

url = ['https://eodhistoricaldata.com/api/eod/',...
    symbolName,'.US','?from=',startDate,'&to=',endDate,...
    '&api_token=',token,'&period=d'];

fileName = [directory,'tmp.csv'];
outfilename = websave(fileName,url);
if ~strcmp(fileName,outfilename)
    return;
end

d = importdata(outfilename);
%% 最后一天的收盘价
% url = ['https://eodhistoricaldata.com/api/eod/',...
%     'AAPL','.US?','api_token=',token,...
%     '&fmt=json&','filter=','last_close'];
























