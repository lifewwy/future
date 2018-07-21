function myplotyy(X1,X2)

sizeX1 = size(X1); sizeX2 = size(X2);
l = 1:sizeX1(1);
[ax,~,~] = plotyy(l,X1(:,1),l,X2(:,1));
color = ['r','r','k','g','y'];

for i = 2:sizeX1(2)
    set(gcf,'CurrentAxes',ax(1)); hold on;
    plot(X1(:,i),'Color',color(i));
end

for i = 2:sizeX2(2)
    set(gcf,'CurrentAxes',ax(2)); hold on;
    plot(X2(:,i),'Color',color(i));
end

ylim(ax(1),[min(min(X1)),2*max(max(X1))-min(min(X1))]);
ylim(ax(2),[2*min(min(X2))-max(max(X2)),max(max(X2))]);

set(ax,'XGrid','on');
% set(ax,'YGrid','on');








