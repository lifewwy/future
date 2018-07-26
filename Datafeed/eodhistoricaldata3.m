clear; clc; close all;

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

load NASDAQ;
for i = 1:length(NASDAQ)
    symbolName = NASDAQ{i,1};
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
    plot(c); title(NASDAQ{i,2});
end













