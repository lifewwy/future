clear all ; clc; close all;
folder = 'D:\future\Data5Min\';
%% 5分钟线数据分析


filename = [folder,'沪铝20140321（5Min）.csv'];
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    c = data(:,4);
end

% 同时开一个多单和空单，并分别设置好止损和止盈
% 如果止损和止盈没有触发，则在收盘时平仓。

c0 = c(1); % 开盘价（开仓价格）
a = 4e-3;  % 止盈
b = 2e-3;  % 止损

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

r = r1+r2 %#ok


% bar(c/c0); grid ; axis([1,length(c),0.99,1]);
figure; plot(c/c0);













