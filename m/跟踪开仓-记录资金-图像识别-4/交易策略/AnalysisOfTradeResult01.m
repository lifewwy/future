function [TotalProfit, TotalRateOfReturn, wr, arm, trm, NumOfTradePerYear] = ...
    AnalysisOfTradeResult01(o,h,l,c,TradePos, commission, UnitRisk, cUnit,...
    FigureFlag,TabHandles,PanelSize)

% TradePos1 = TradePos;
TradePos = TradePos(1:end-2,:);

ResultOfTrade = (o(TradePos(:,2))-o(TradePos(:,1))) ...
    .*TradePos(:,3)*cUnit-commission;

TotalProfit = sum(ResultOfTrade);
wr = sum(ResultOfTrade>0)/length(ResultOfTrade);
[arm, trm, NumOfTradePerYear] = RiskMultiplier(ResultOfTrade, length(o));

InitCaptial = 1e9; Capital = InitCaptial;
sizeTradePos = size(TradePos);
for i = 1:sizeTradePos(1)
    risk = Capital*0.01;
    Capital = Capital + risk / UnitRisk(TradePos(i,1)-1) * ResultOfTrade(i);
end
TotalRateOfReturn = Capital/InitCaptial;


% TradePos = TradePos1;
if FigureFlag == 1
    PanelWidth = PanelSize(1);
    PanelHeight = PanelSize(2);
    PlotOffset = PanelSize(3);
    i = PanelSize(4); SelectedTab = i;
    TabSelect(SelectedTab);
    tabHandle = TabHandles{i,1};
    pltfig(o,h,l,c,ResultOfTrade,TradePos,tabHandle,PanelWidth,PanelHeight,PlotOffset);
    
%     --------- 20180215 ◊¢ ÕµÙ“‘œ¬ƒ⁄»› --------------
%     figure;
%     subplot(2,2,1);% stem(ResultOfTrade);
%     stem(find(ResultOfTrade<0),ResultOfTrade(ResultOfTrade<0),...
%         'LineStyle','-.',...
%         'MarkerFaceColor',[0,1,1],...
%         'MarkerEdgeColor',[0,1,1])
%     hold on;
%     stem(find(ResultOfTrade>=0),ResultOfTrade(ResultOfTrade>=0),...
%         'LineStyle','-.',...
%         'MarkerFaceColor',[1, 0.2941, 0.2941],...
%         'MarkerEdgeColor',[1, 0.2941, 0.2941])
%     set(gca,'color',[0.1,0.1,0.1]*0);
%     
%     subplot(2,2,2); plot(cumsum(ResultOfTrade));
%     set(gca,'color',[0.1,0.1,0.1]*0);
%     
%     mino = min(o); maxo = max(o);
%     subplot(2,2,3:4);hold on;
%     for i = 1:length(TradePos)
%         plot([TradePos(i,1),TradePos(i,1)],[mino,maxo],'Color',[.1,.1,.1]*2);
%         if TradePos(i,2) ~=0
%             plot([TradePos(i,2),TradePos(i,2)],[mino,maxo], ...
%                 'Color',[.1,.1,.1]*2,'LineWidth',2);
%         end
%         
%         if TradePos(i,2)~=0
%             if (o(TradePos(i,2))-o(TradePos(i,1)))*TradePos(i,3)>0
%                 color = '--r';
%             else
%                 color = '--g';
%             end
%             plot([TradePos(i,1),TradePos(i,2)],[o(TradePos(i,1)),o(TradePos(i,2))], color);
%         end
%         
%     end
%     
%     %     candle(h, l, c, o);
%     myCandle([o,h,l,c]);
%     
%     set(gca,'color',[0.1,0.1,0.1]*0);
%     axis([1,length(o)+30,min([o;h;l;c]),max([o;h;l;c])]);
%     
%     warning off; %#ok
%     jFrame = get(handle(gcf),'JavaFrame');
%     pause(0.2);
%     jFrame.setMaximized(true);
%     % jFrame.setMaximized(false);
%     % jFrame.setMinimized(true);
%     % jFrame.setMinimized(false);
    
end



end











