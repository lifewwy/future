clear all ; clc; close all;
%% 1分钟线数据仿真
%% TB 日线数据
filename = 'ru888TB.csv';
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    date = datenum(dstruct.textdata(2:end,1));
    data = dstruct.data;
    data  = [date, data];
end

cc = data(:,5);

% [FastMA,SlowMA] = movavg(c,20,50);

% plot(c); hold on;plot(FastMA,'r'); plot(SlowMA,'g');

%% 日内波动性分析
load ru888Data1MinFrom20121008To20140327Total335Days;

 X1 = X(:,2:end);
 X1 = X1';
 maxX1 = max(X1);
 minX1 = min(X1);
 
v = (maxX1-minX1)./X1(1,:)*100;

figure; plot(v);

mean(v)
std(v)
sum(v>3)/length(v)*100  %#ok



%% 寻找最优参数

% load ru888Data1MinFrom20121008To20140327Total335Days;
% 
% Nsim = 350;
% SimResult = zeros(10,70);
% for N1 = 1:10
%     N1 %#ok
%     for N2 = 11:80
%         
%         
%         [FastMA,SlowMA] = movavg(cc,N1,N2);
%         profit = zeros(1,Nsim);
%         
%         StopLoss = 1e-2;
%         StopProfit = 3e-2;
%         for index = 2:Nsim
%             
%             c = X(index,2:end);
%             yestoday = X(index-1,1);
%             pos = find(date==yestoday);
%             
%             if FastMA(pos)>SlowMA(pos)
%                 % 多单
%                 c0 = c(1); % 开盘价（开仓价格）
%                 peak = 0;
%                 
%                 for i = 1:length(c)
%                     if c(i)>peak
%                         peak = c(i);
%                     end
%                     
%                     if c0-c(i)>StopLoss*c0
%                         break;
%                     end
%                     
%                     if peak-c(i)>StopLoss*c0
%                         break;
%                     end
%                     
%                     if c(i)-X(index-1,end)>StopProfit*X(index-1,end)
%                         % i
%                         break;
%                     end
%                     
%                 end
%                 profit(index) = c(i)-c0;
%             else
%                 % 空单
%                 c0 = c(1); % 开盘价（开仓价格）
%                 bottom = 1e5;
%                 
%                 for i = 1:length(c)
%                     if c(i)<bottom
%                         bottom = c(i);
%                     end
%                     
%                     if c(i)-c0>StopLoss*c0
%                         break;
%                     end
%                     
%                     if c(i)-bottom>StopLoss*c0
%                         break;
%                     end
%                     
%                     if X(index-1,end)-c(i)>StopProfit*X(index-1,end)
%                         % i
%                         break;
%                     end
%                     
%                 end
%                 profit(index) = c0-c(i);
%             end
% 
%         end
%         
%         SimResult(N1,N2-10) = sum(profit);
%         
%     end
% end
% 
% surf(11:80, 1:10, SimResult); view(2); colorbar;

%% 测试最优参数
close all; clc;

load ru888Data1MinFrom20121008To20140327Total335Days;

Nsim = 350;

[FastMA,SlowMA] = movavg(cc,4,35);
profit = zeros(1,Nsim);

StopLoss = 1.3e-2;
StopProfit = 3e-2;
for index = 2:Nsim
    
    c = X(index,2:end);
    yestoday = X(index-1,1);
    pos = find(date==yestoday);
    
    if FastMA(pos)>SlowMA(pos)
        % 多单
        c0 = c(1); % 开盘价（开仓价格）
        peak = 0;
        
        for i = 1:length(c)
            if c(i)>peak
                peak = c(i);
            end
            
            if c0-c(i)>StopLoss*c0
                break;
            end
            
            if peak-c(i)>StopLoss*c0
                break;
            end
            
            if c(i)-X(index-1,end)>StopProfit*X(index-1,end)
                i
                break;
            end
            
        end
        profit(index) = c(i)-c0;
    else
        % 空单
        c0 = c(1); % 开盘价（开仓价格）
        bottom = 1e5;
        
        for i = 1:length(c)
            if c(i)<bottom
                bottom = c(i);
            end
            
            if c(i)-c0>StopLoss*c0
                break;
            end
            
            if c(i)-bottom>StopLoss*c0
                break;
            end
            
            if X(index-1,end)-c(i)>StopProfit*X(index-1,end)
                i
                break;
            end
            
        end
        profit(index) = c0-c(i);
    end
    
end


% 胜率
vr = sum(profit>0)/Nsim %#ok

% 平均 R乘数
er = sum(profit)/Nsim/(-sum(profit(profit<0))/sum(profit<0)) %#ok

% 总收益
TotalProfit = sum(profit);

figure; subplot(2,2,1); bar(profit);
subplot(2,2,2); hist(profit,20); axis tight;

subplot(2,2,3); plot(cumsum(profit)); grid; 
title('资金曲线');

%% 概率分布分析

clearvars -except profit; 

mu = mean(profit);
sigma = var(profit);


pd1 = makedist( 'normal',0,0.3);
pd2 = truncate( pd1, -0.4, 1 );

x = -0.4:0.1:1;
pdf = pdf( pd2, x);

subplot(2,2,4); plot(x,pdf-0.4); 














