%profitval.m
%The module is used as estimation of profit/loss of market data
%in evaluating of neural network trading system. All position will
%enter at open price and exit at open price too.

close all; clear all; clc;
%%parameters
futureCode = 'a';
ContractFactor = 10;

%% read csv
filename = [futureCode, '888.csv'];
if exist(filename,'file')
else
    return;
end

dstruct = importdata(filename);
% display(dstruct.textdata(1,:));
contractDate = datenum(dstruct.textdata);
csvData = dstruct.data;
csvData = [contractDate, csvData];

%% calculate ATR
%parameters
AtrLength = 20;
%calulate TR
csvSize = size(csvData);
for i = 2:csvSize(1);
    TrSer(i,1) = max([csvData(i,3)-csvData(i,4);csvData(i,3)-csvData(i-1,5);...
        csvData(i-1,5)-csvData(i,4)]);
end
TrSer(1,1) = NaN;
for i = AtrLength+1:csvSize(1)
    AtrSer(i,1) = mean(TrSer(i-AtrLength+1:i,1));
end
AtrSer(1:AtrLength,1)=NaN;
csvData = [csvData AtrSer]; %ATR is an index which is ofter used.

%% Long position
%parameters
LongStopATR = 2;
for i = AtrLength+1 : csvSize(1)
    CurProLos = 0; %current profit or loss
    StopPrice = 0;
    OpenPrice = csvData(i,2);
    for j = i:csvSize(1)
        if j == i
            StopPrice = max(csvData(j,2),csvData(j,5))...
                - LongStopATR*csvData(j,8); %max(open,close)-n*atr
        else
            StopPrice = max(StopPrice,csvData(j,5)...
                -LongStopATR*csvData(j,8)); %max(stopprice,close-n*atr)           
        end
        if csvData(j,5) <= StopPrice %exit condition
            CurProLos = csvData(j,5) - OpenPrice; %profit and loss
            ProLos(i,1) = CurProLos * ContractFactor;
            break;
        end
        if j == csvSize(1)
            CurProLos = csvData(csvSize(1),5) - OpenPrice;
            ProLos(i,1) = CurProLos * ContractFactor;
        end
    end
end
csvData = [csvData ProLos];

%% Short position
%parameters
ShortStopATR = 2;
for i = AtrLength+1 : csvSize(1)
    CurProLos = 0; %current profit or loss
    StopPrice = 0;
    OpenPrice = csvData(i,2);
    for j = i:csvSize(1)
        if j == i
            StopPrice = min(csvData(j,2),csvData(j,5))...
                + LongStopATR*csvData(j,8); %max(open,close)-n*atr
        else
            StopPrice = min(StopPrice,csvData(j,5)...
                +LongStopATR*csvData(j,8)); %max(stopprice,close-n*atr)           
        end
        if csvData(j,5) >= StopPrice %exit condition
            CurProLos = OpenPrice - csvData(j,5); %profit and loss
            ProLos(i,1) = CurProLos * ContractFactor;
            break;
        end
        if j == csvSize(1)
            CurProLos = OpenPrice - csvData(csvSize(1),5);
            ProLos(i,1) = CurProLos * ContractFactor;
        end
    end
end
csvData = [csvData ProLos];






