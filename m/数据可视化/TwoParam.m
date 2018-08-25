clear; clc; close all;
% 2个参数

%% 读数据
folder = 'C:\D\xyz\future\优化记录\TwoParameters\';
filename = [folder '优化记录交易策略参数优化[IF - 1日线].csv'];

dstruct = importdata(filename);
td = dstruct.textdata(1,:)';
display(td);
data = dstruct.data;

data = sortrows(data);
%% 分析 TB 参数报告

param1 = data(:,1); param2 = data(:,2);
param1 = unique(param1);  param2 = unique(param2);


ar = data(:,3)./data(:,7)./(-data(:,30));
% ar(ar<max(ar)*0.5) = NaN;
ar = reshape(ar,[],length(param1));

profit1 = data(:,find(strcmp(td,'净利润'),1)-1);
profit1(profit1<max(profit1)*0) = NaN;
profit = reshape(profit1,[],length(param1));

MaxDown = data(:,find(strcmp(td,'最大资产回撤比率%'),1)-1);
MaxDown = reshape(MaxDown,[],length(param1));

wr = data(:,find(strcmp(td,'盈利比率'),1)-1);
wr = reshape(wr,[],length(param1));

odds = data(:,find(strcmp(td,'盈亏比'),1)-1); % 赔率
odds = reshape(odds,[],length(param1));
%% surf

figure('Name','净利润','NumberTitle','off');
surf(param1,param2,profit);view(2); axis tight;
map = mycolormap(profit); colormap(map);

% figure; surf(param1,param2,ar);  view(2); axis tight;
% map = mycolormap(ar); colormap(map);

figure('Name','最大资产回撤','NumberTitle','off');
surf(param1,param2,MaxDown);  view(2); axis tight;
% map = mycolormap(MaxDown); colormap(map);

figure('Name','胜率','NumberTitle','off');
surf(param1,param2,wr);  view(2); axis tight;

figure('Name','赔率','NumberTitle','off');
surf(param1,param2,odds);  view(2); axis tight;

% 在较理想的单边行情下，nPeriodBreak越小越好,当取1时就等于不止损。
% 如果单边行情结束，也会始终不止损。
% figure;  grid;hold on;
% for nPeriodBreak=1:10
%     plot(param2,profit(:,nPeriodBreak));
% end
% figure; plotyy(param2,wr(:,1),param2,odds(:,1)); grid;


% 一个参数固定
figure; grid; plot(param2,profit(:,param1==9)); grid;
figure; grid; plot(param1,profit(param2==3.4,:)); grid;



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




























