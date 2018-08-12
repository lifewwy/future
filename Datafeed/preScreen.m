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
for i = 3358:length(NASDAQ)
    i %#ok
    
    symbolName = NASDAQ{i,1};
    url = ['https://eodhistoricaldata.com/api/eod/',symbolName,'.US?api_token=',...
        token,'&period=d'];
    fileName = [directory,symbolName,'.US.csv'];
    
    % 捕获异常
    try
        outfilename = websave(fileName,url);
    catch ErrorInfo %捕获到的错误是一个MException对象
        disp(ErrorInfo);
        %发生错误时的其他动作
        1;
        continue;
    end

    if ~strcmp(fileName,outfilename)
        return;
    end
    
    N = 400;
    slopeThreshold = 0.001; rsq_adjThreshold = 0.9;
    plotThreshold = [slopeThreshold,rsq_adjThreshold];
    close all; 
    [slope,rsq_adj] = RegressionFunc(symbolName,N,plotThreshold);
    if (rsq_adj>plotThreshold(2))&&(slope>0)
        [slope,rsq_adj] %#ok
        1;
    else
        delete(fileName) ;
    end    
end













