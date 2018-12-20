function main_csv888Refresh()

% clear; clc;  close all;

%% 历史数据更新 20180905
% N个交易日的JoinQuant Data 20180905
[fc,kDataJoinQuant] = JoinQuantData(10,1); 

futureCode = {'A','C','RB','M','P','J','ZN','Y','L','AG','TA' ...
    ,'SR','AU','FG','MA','RU','AL','OI','RM','CF','I','JM','CU','V','IF'};

h = 0;
for i = 1:length(futureCode)
    csv888Refresh(futureCode{i},h,fc,kDataJoinQuant);
end

















































