clear all ; clc; close all;
%% 1分钟线数据仿真

load cu888Data1MinTotal289Days;

c = X(12,2:end);

[a,b] = macd(c);

figure; myplotyy([a',b',zeros(225,1)],c'); 

% % 胜率
% vr = sum(profit>0)/Nsim %#ok
% 
% % 平均 R乘数
% er = sum(profit)/Nsim/(-sum(profit(profit<0))/sum(profit<0)) %#ok
% 
% % 总收益
% TotalProfit = sum(profit);
% 
% figure; subplot(2,2,1); bar(profit);
% subplot(2,2,2); hist(profit,20); axis tight;
% 
% subplot(2,2,3); plot(cumsum(profit)); grid; 
% title('资金曲线');

%% 概率分布分析

% clearvars -except profit; 
% 
% mu = mean(profit);
% sigma = var(profit);
% 
% 
% pd1 = makedist( 'normal',0,0.3);
% pd2 = truncate( pd1, -0.4, 1 );
% 
% x = -0.4:0.1:1;
% pdf = pdf( pd2, x);
% 
% subplot(2,2,4); plot(x,pdf-0.4); 














