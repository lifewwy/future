function [OpenDate,CloseDate,parameter,ContractName] = TradingPosTB_AADualMA_01(ffilename,SelectedContract)
% clear; close all; clc;

if nargin == 0
    directory = 'C:\D\future\交易位置\';
    SelectedContract = '黄金';
    % filename = ['20170918交易位置.txt'];
    % yyyymmdd = datestr(now,'yyyymmdd');
    ffilename = [directory,'交易位置_AADualMA','.txt'];
end

if exist(ffilename,'file') == 2
    d1 = importdata(ffilename);
else
    fprintf(2,'------------ 无交易！------------\n');
    return;
end

cc = d1.textdata(:,2);
ContractName = unique(cc);

cctmp = cell(length(cc),1);
for i = 1:length(cc)
    cctmp(i) = {cc{i}(1:end-4)};
end
d = d1.textdata(strcmpi(cctmp,SelectedContract),:);
sized = size(d);
tradingAction = d(:,3);
nCount1 = 0;
nCount2 = 0;
OpenDate = cell(sized(1),2);
CloseDate = cell(sized(1),2);

for k = 1:length(tradingAction)
    if ~isempty(strfind(tradingAction{k},'开多'))
        nCount1 = nCount1 + 1;
        OpenDate(nCount1,1) = d(k,1);
        OpenDate(nCount1,2) = {1};
    end
    if ~isempty(strfind(tradingAction{k},'开空'))
        nCount1 = nCount1 + 1;
        OpenDate(nCount1,1) = d(k,1);
        OpenDate(nCount1,2) = {-1};
    end
    if ~isempty(strfind(tradingAction{k},'平多'))
        nCount2 = nCount2 + 1;
        CloseDate(nCount2,1) = d(k,1);
        CloseDate(nCount2,2) = {1};
    end
    if ~isempty(strfind(tradingAction{k},'平空'))
        nCount2 = nCount2 + 1;
        CloseDate(nCount2,1) = d(k,1);
        CloseDate(nCount2,2) = {-1};
    end
    if strcmp(tradingAction{k},'|')
        nATRExit = str2double(d{k,5});
        FastLength = str2double(d{k,8});
        SlowLength = str2double(d{k,11});
        nATR = d1.data(1);
        parameter = [nATRExit,FastLength,SlowLength,nATR];
    end
end  
OpenDate = OpenDate(1:nCount1,:);
CloseDate = CloseDate(1:nCount2,:);












