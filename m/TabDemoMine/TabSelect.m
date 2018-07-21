function TabSelect(SelectedTab)
% SelectedTab = 5;

TabHandles = guidata(gcf);
NumberOfTabs = size(TabHandles,1)-2;
White = TabHandles{NumberOfTabs+2,2};            % White
BGColor = TabHandles{NumberOfTabs+2,3};          % Light Grey

%   Turn all tabs off
for TabCount = 1:NumberOfTabs
    set(TabHandles{TabCount,1}, 'Visible', 'off');
    set(TabHandles{TabCount,2}, 'BackgroundColor', BGColor);
end

%   Enable the selected tab
set(TabHandles{SelectedTab,1}, 'Visible', 'on');
set(TabHandles{SelectedTab,2}, 'BackgroundColor', White);

end



