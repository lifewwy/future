clear; clc;  close all;

%% 合约的月份
cn = {'a';'c';'rb';'m';'p';'j';'zn';'y';'l';'ag';'TA';'SR';'au';'FG'; ...
    'MA';'ru';'al';'oi';'rm';'cf';'i';'jm';'cu';'ri';'v';'if'};


for i = 1:length(cn)
    clearvars -except cn i;
    futureCode = char(cn(i));
    filename = [futureCode, '888.csv'];
    if exist(filename,'file')
    else
        return;
    end
    
    dstruct = importdata(filename);
    % display(dstruct.textdata(1,:));
    contractDate = datenum(dstruct.textdata);
    csvData = dstruct.data;
    csvData = [contractDate, csvData]; %#ok;
    
    contract = [futureCode,num2str(csvData(end,end))];
    % disp(contract(1:end-4))
    disp(contract)
end







