clear all; clc ; close all; 


% f =  dir('*.xlsx');
% for i = 1:length(f)
%     filename = f(i).name;
% end

[ndata, text, alldata] =  xlsread('ta.xlsx');
nYeas = (datenum(text(end,7))-datenum(text(2,5)))/365;
ResultOfTrade = ndata(:,11);
TotalNumOfTrade = length(ndata);
NumOfLoss = sum(ResultOfTrade<0);
TotalLoss = abs(sum(ResultOfTrade(ResultOfTrade<0)));
TotalProfit = abs(sum(ResultOfTrade(ResultOfTrade>0)));
NetProfit = TotalProfit-TotalLoss;
NumOfTradePerYear = TotalNumOfTrade/nYeas;
ARM = (NetProfit/TotalNumOfTrade)/(TotalLoss/NumOfLoss);
TRM = NumOfTradePerYear * ARM;

A = ndata;

x = A(:,11);

lose = x(x<0);
win = x(x>0);

win = win/(sum(-lose)/sum(x<0))  ;   
lose = lose/(sum(-lose)/sum(x<0));

wr = sum(x>0)/length(x)  %#ok

losemean = mean(lose)    %#ok
losedev = std(lose)      %#ok

winmean = mean(win)      %#ok
windev = std(win)        %#ok

MAXDRAWDOWNTHRESHOLD = 0.8;
% POSIZE = 3e-2;

for POSIZE = 1e-3:1e-3:5e-2
    rob = pos_size_opt_func(MAXDRAWDOWNTHRESHOLD,wr,losemean,losedev,winmean,windev,POSIZE) %#ok
    if rob>=1e-3
        break;
    end
end

POSIZE         %#ok
AverageProfitRatePerYear = TRM*POSIZE     %#ok


















