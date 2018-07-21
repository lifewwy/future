function PosStatus = StrategyMainFunc01(PltFlg)

% clear; close all; clc;

Fn = {'al', 'cf', 'cu', 'if' , 'j',  'l', ...
    'ma', 'p', 'rb', 'ru', 'sr', 'ta', 'y', 'zn','au','m'};

plotFlg = PltFlg;
lenFn = length(Fn);
h = waitbar(0,'Please wait...');
steps = lenFn;
nCount = 0;
PosStatus = [];

if plotFlg == 1
    NumberOfTabs = lenFn;
    TabLabels = Fn';
    PlotOffset = 40;
    [TabHandles,PanelWidth,PanelHeight] = TabDemo(NumberOfTabs,TabLabels);
else
    TabHandles = []; PanelWidth = []; PanelHeight = []; PlotOffset = [];
end

for i = 1:lenFn   
%     if Fn{i} == 'if'
%         1
%     end
    if strcmp(Fn{i},'au') || strcmp(Fn{i},'m')
        PosStatusTmp = StrategyFunc_DualMA([Fn{i},'888'],...
            plotFlg,TabHandles,[PanelWidth,PanelHeight,PlotOffset,i]);
    else
        PosStatusTmp = StrategyFunc([Fn{i},'888'],...
            plotFlg,TabHandles,[PanelWidth,PanelHeight,PlotOffset,i]);
        % waitbar(i / steps,h,sprintf('%s',Fn{i}));
    end
    if length(PosStatusTmp) == 4
        nCount = nCount+1;
        PosStatus(nCount).a = [Fn{i},num2str(PosStatusTmp(1))];
        PosStatus(nCount).b = PosStatusTmp(4);
    end
        
    waitbar(i / steps);
end
close(h)

fprintf('\n策略加载完成！\n');

end





