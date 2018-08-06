function [meanProfit,varProfit] = parallelCoordinates(data,pp,threshold)

[~,idata,~] = intersect(data(:,1:3),pp,'rows');
data1 = data(idata,1:4);

x = zeros(size(data1));

for i = 1:4
    x(:,i) = data1(:,i)/max(data(:,i));
end

meanProfit = mean(x(:,4));
varProfit = var(x(:,4));

if (meanProfit<threshold)&&(max(x(:,4))~=1)
    return;
end

figure; 

plot(x'); hold on; 
plot(x([1,end],:)','LineWidth',2,'Color','k');

for i=1:4
    plot([i,i],[0,1],'LineWidth',2);
end
plot([1,4],[0,0],'LineWidth',2,'Color','k');

set(gca,'XTickLabel',{'nPeriodBreak','','nATRExit','','nSingleAvg','','¾»ÀûÈó'})
grid;










