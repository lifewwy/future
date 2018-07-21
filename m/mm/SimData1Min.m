clear all ; clc; close all;

%% 1分钟线数据仿真
load ru888Data1MinFrom20121008To20140327Total335Days;

% 同时开一个多单和空单，并分别设置好止损和止盈
% 如果止损和止盈没有触发，则在收盘时平仓。

a = 1e-4;  % 止盈
b = 0.1e-2;  % 止损

Nsim = 350;
profit = zeros(1,Nsim);
for index = 1:Nsim
    
    c = X(index,2:end);
    c0 = c(1); % 开盘价（开仓价格）
    
    % 多单
    for i = 1:length(c)
        % 设置好止损和止盈
        if (c(i)-c0>c0*a)||(c0-c(i)>c0*b)
            break;
        end
    end
    r1 = c(i)-c0;
    
    % 空单
    for k = 1:length(c)
        % 设置好止损和止盈
        if (c0-c(k)>c0*a)||(c(k)-c0>c0*b)
            break;
        end
    end
    r2 = c0-c(k);
    
    profit(index) = r1+r2;
    
end


% bar(c/c0); grid ; axis([1,length(c),0.99,1]);
% figure; plot(c/c0); 
figure; bar(profit);













