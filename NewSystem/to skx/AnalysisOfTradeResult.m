function [TotalProfit, TotalRateOfReturn, wr, arm, trm, NumOfTradePerYear,ss] = ...
    AnalysisOfTradeResult(o, TradePos, commission, UnitRisk, FigureFlag)

TradePos = TradePos(1:end-2,:);

ResultOfTrade = (o(TradePos(:,2))-o(TradePos(:,1))) ...
    .*TradePos(:,3)-commission;

TotalProfit = sum(ResultOfTrade);
wr = sum(ResultOfTrade>0)/length(ResultOfTrade);
[arm, trm, NumOfTradePerYear] = RiskMultiplier(ResultOfTrade, length(o));

InitCaptial = 1e9; Capital = InitCaptial; 
% sizeTradePos = size(TradePos);
% for i = 1:sizeTradePos(1)
%     risk = Capital*0.01;
%     Capital = Capital + risk / UnitRisk(TradePos(i,1)-1) * ResultOfTrade(i);
% end
TotalRateOfReturn = Capital/InitCaptial;


[~,sstmp] = polyfit(1:length(ResultOfTrade),ResultOfTrade',1);
ss = sstmp.normr;



if FigureFlag == 1
    figure; 
    subplot(2,2,1); stem(ResultOfTrade)
    subplot(2,2,2); plot(cumsum(ResultOfTrade));
    
    mino = min(o); maxo = max(o);
    subplot(2,2,3:4); plot(o); hold on;
    for i = 1:length(TradePos)
        plot([TradePos(i,1),TradePos(i,1)],[mino,maxo],'r');
        if TradePos(i,2) ~=0
            plot([TradePos(i,2),TradePos(i,2)],[mino,maxo],'k','LineWidth',2);
        end
        
        if TradePos(i,2)~=0
            if (o(TradePos(i,2))-o(TradePos(i,1)))*TradePos(i,3)>0
                color = '--r';
            else
                color = '--g';
            end
            plot([TradePos(i,1),TradePos(i,2)],[o(TradePos(i,1)),o(TradePos(i,2))], color);
        end
        
    end
    
end

end











