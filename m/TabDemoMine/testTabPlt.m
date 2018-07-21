clc;clear;close all;

NumberOfTabs = 6;
TabLabels = {'al'; 'p'; 'sr'; 'cu'; 'ru'; 'l'};
[TabHandles,PanelWidth,PanelHeight] = TabDemo(NumberOfTabs,TabLabels);

load zn;
PlotOffset = 40;
for i = 1:NumberOfTabs
    tabHandle = TabHandles{i,1};
    pltfig(o,h,l,c,ResultOfTrade,TradePos,tabHandle,PanelWidth,PanelHeight,PlotOffset)
end
