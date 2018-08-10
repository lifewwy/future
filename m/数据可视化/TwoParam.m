clear; clc; close all;
% 2个参数

%% 读数据
folder = 'C:\D\xyz\future\优化记录\TwoParameters\';
filename = [folder '优化记录交易策略参数优化[y1901 - 1日线].csv'];

dstruct = importdata(filename);
td = dstruct.textdata(1,:)';
display(td);
data = dstruct.data;

data = sortrows(data);
%% 分析 TB 参数报告

param1 = data(:,1); param2 = data(:,2);
param1 = unique(param1);  param2 = unique(param2);


ar = data(:,3)./data(:,7)./(-data(:,30));
ar = reshape(ar,[],length(param1));

profit = data(:,find(strcmp(td,'净利润'),1)-1);
profit = reshape(profit,[],length(param1));

MaxDown = data(:,find(strcmp(td,'最大资产回撤比率%'),1)-1);
MaxDown = reshape(MaxDown,[],length(param1));
%% surf
figure; surf(param1,param2,profit);view(2); axis tight;
map = mycolormap(profit); colormap(map);
figure; surf(param1,param2,ar);  view(2); axis tight;
% map = mycolormap(ar); colormap(map);
figure; surf(param1,param2,MaxDown);  view(2); axis tight;
% map = mycolormap(MaxDown); colormap(map);
title('最大资产回撤')

%% 选定参数的雷达图
% [~,ind,~] = intersect(data(:,1:2),[10,2.6],'rows');
% indicator = {'最大资产回撤比率%',...
%     '连续亏损手数',...
%     '盈利比率'};
% MaxDown = data(ind,find(strcmp(td,indicator{1}),1)-1);
% N = data(ind,find(strcmp(td,indicator{2}),1)-1);
% WinRate = data(ind,find(strcmp(td,indicator{3}),1)-1)/100;
% 
% maxValue = [1 20 1];
% minValue = [0 0 0];
% h = spiderplot([MaxDown,N,WinRate]', maxValue, ...
%     minValue, ['r' 'g' 'b']',indicator);
% % set(h.axis, 'LineWidth', 2);
% set(h.plots(1), 'LineWidth', 2);




























