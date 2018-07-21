function [arm, trm, NumOfTradePerYear] = RiskMultiplier(ResultOfTrade, LengthOfData)

nYeas = LengthOfData/240;
TotalNumOfTrade = length(ResultOfTrade);
NumOfLoss = sum(ResultOfTrade<0);
TotalLoss = abs(sum(ResultOfTrade(ResultOfTrade<0)));
TotalProfit = abs(sum(ResultOfTrade(ResultOfTrade>0)));
NetProfit = TotalProfit-TotalLoss;
NumOfTradePerYear = TotalNumOfTrade/nYeas;
arm = (NetProfit/TotalNumOfTrade)/(TotalLoss/NumOfLoss);
trm = NumOfTradePerYear * arm;