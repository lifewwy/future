function pltfig(o,h,l,c,ResultOfTrade,TradePos,tabHandle,PanelWidth,PanelHeight,PlotOffset)

% tabHandle = TabHandles{1,1};
% PlotOffset = 40;

haxes2 = axes('Parent', tabHandle, ...
    'Units', 'pixels', ...
    'Position', [PlotOffset PlotOffset ...
    PanelWidth/2-2*PlotOffset PanelHeight/2-2*PlotOffset]);

% load abc;
stem(haxes2,find(ResultOfTrade<0),ResultOfTrade(ResultOfTrade<0),...
    'LineStyle','-.',...
    'MarkerFaceColor',[0,1,1],...
    'MarkerEdgeColor',[0,1,1])
hold on;
stem(haxes2,find(ResultOfTrade>=0),ResultOfTrade(ResultOfTrade>=0),...
    'LineStyle','-.',...
    'MarkerFaceColor',[1, 0.2941, 0.2941],...
    'MarkerEdgeColor',[1, 0.2941, 0.2941]);
set(gca,'color',[0.1,0.1,0.1]*0);

% -------------------------------------------------
PlotOffset = 40;
haxes2 = axes('Parent', tabHandle, ...
    'Units', 'pixels', ...
    'Position', [PanelWidth/2 PlotOffset ...
    PanelWidth/2-PlotOffset PanelHeight/2-2*PlotOffset]);

plot(haxes2,cumsum(ResultOfTrade));
set(gca,'color',[0.1,0.1,0.1]*0);

% --------------------------------------------------------------------------
PlotOffset = 40;
haxes2 = axes('Parent', tabHandle, ...
    'Units', 'pixels', ...
    'Position', [PlotOffset  PanelHeight/2 ...
    PanelWidth-2*PlotOffset PanelHeight/2-PlotOffset]);

mino = min(o); maxo = max(o);
% subplot(2,2,3:4);
hold on;
for i = 1:length(TradePos)
    plot(haxes2,[TradePos(i,1),TradePos(i,1)],[mino,maxo],'Color',[.1,.1,.1]*2);
    if TradePos(i,2) ~=0
        plot(haxes2,[TradePos(i,2),TradePos(i,2)],[mino,maxo], ...
            'Color',[.1,.1,.1]*2,'LineWidth',2);
    end
%     if i== 54
%         1
%     end
    if TradePos(i,2)~=0
        if (o(TradePos(i,2))-o(TradePos(i,1)))*TradePos(i,3)>0
            color = '--r';
        else
            color = '--g';
        end
        plot(haxes2,[TradePos(i,1),TradePos(i,2)],[o(TradePos(i,1)),o(TradePos(i,2))], color);
    end
    
end


% candle(h, l, c, o);
myCandle([o,h,l,c]);

set(gca,'color',[0.1,0.1,0.1]*0);
axis([1,length(o)+30,min([o;h;l;c]),max([o;h;l;c])]);

end




