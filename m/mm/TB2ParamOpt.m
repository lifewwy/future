clear ; clc; close all;
folder = 'C:\D\future\优化记录\';
%% 读数据
clc;  clearvars -except folder

filename = [folder '优化记录交易策略参数优化[au1706 - 1日线].csv'];
if exist(filename,'file')
else
    return;
end

dstruct = importdata(filename);
% display(dstruct.textdata(1,:));
data = dstruct.data;

data = sortrows(data);

%% 分析 TB 参数报告

param1 = data(:,1); param2 = data(:,2);
param1 = unique(param1);  param2 = unique(param2);

ar = data(:,3)./data(:,7)./(-data(:,30));
ar = reshape(ar,[],length(param1));

profit = data(:,3);
profit = reshape(profit,[],length(param1));

drawdown =  data(:,18);
if max(drawdown)>=90
    fprintf('Error！\n');
%     break;
end
drawdown = reshape(drawdown,[],length(param1));



%% 画图

figure;
subplot(2,2,1); surf(param1,param2,profit);view(2); axis tight;
% map = mycolormap(profit); colormap(map); colorbar;

subplot(2,2,2); surf(param1,param2,ar);  view(2); axis tight;
% map = mycolormap(ar); colormap(map); colorbar;

% subplot(2,2,3:4); contourf(param1,param2,profit); % colorbar
subplot(2,2,3); surf(param1,param2,drawdown);  view(2); axis tight;

%% profit 分层

% maxprofit = max(profit(:));
% minprofit = min(profit(:));
% nLayer = 100;
% deltaProfit = (maxprofit-minprofit)/nLayer;
% r = zeros(1,nLayer);
% for n = 1:nLayer
%     [pos1,pos2] = find(profit > maxprofit-(n-1)*deltaProfit);
%     r(n) = length(pos1)/numel(profit);
% end
% figure; plot(maxprofit-(0:nLayer-1)*deltaProfit, r);

































