clear; clc; close all;

% 利润与胜率、赔率之间的关系 
% profit = (WinRate.*(1+odds)-1).*N.*abs(avgLoss);
% odds: 赔率
%% 读数据
folder = 'C:\D\xyz\future\优化记录\TwoParameters\';
filename = [folder '优化记录交易策略参数优化[y1901 - 1日线].csv'];

dstruct = importdata(filename);
td = dstruct.textdata(1,:)';
display(td);
data = dstruct.data;

data = sortrows(data);

%% 验证公式
profit = data(:,find(strcmp(td,'净利润'),1)-1);

indicator = {'平均盈利',...
    '平均亏损',...
    '盈利比率'};

nGain = data(:,find(strcmp(td,'盈利手数'),1)-1);
nLoss = data(:,find(strcmp(td,'亏损手数'),1)-1);
TotalGain = data(:,find(strcmp(td,'总盈利'),1)-1);
TotalLoss = data(:,find(strcmp(td,'总亏损'),1)-1);

% avgGain = data(:,find(strcmp(td,indicator{1}),1)-1); % 盈利交易的平均盈利
% avgLoss = data(:,find(strcmp(td,indicator{2}),1)-1); % 亏损交易的平均亏损

avgGain = TotalGain./nGain; % 盈利交易的平均盈利
avgLoss = TotalLoss./nLoss; % 亏损交易的平均亏损

WinRate = data(:,find(strcmp(td,indicator{3}),1)-1)/100;
% WinRate = nGain./(nGain+nLoss);

odds = abs(avgGain./avgLoss);  % 赔率
% odds = data(:,find(strcmp(td,'盈亏比'),1)-1);
N = nGain+nLoss;               % 交易次数

p1 = nGain.*avgGain + nLoss.*avgLoss;
p2 = (WinRate.*(1+odds)-1).*N.*abs(avgLoss);
p3 = TotalGain+TotalLoss;

figure;plot(profit); hold on; plot(p2-max(p2)-abs(min(p1)),'r');

%% 验证公式
% N = 500;           % 交易次数
% x = randi([-50,300],1,N);
% WinRate = sum(x>0)/length(x);
% avgGain = sum(x(x>0))/sum(x>0); % 盈利交易的平均盈利
% avgLoss = sum(x(x<0))/sum(x<0); % 亏损交易的平均亏损
% odds = abs(avgGain/avgLoss);  % 赔率
% p1 = (WinRate*(1+odds)-1)*N*abs(avgLoss);
% p2 = sum(x);
% e = p1./p2 %#ok
%% 止损宽度与胜率之间的关系
nATRExit = data(:,find(strcmp(td,'P:nATRExit'),1)-1);
R = [nATRExit,WinRate];

title = '止损宽度与胜率之间的关系';
xlabel = '止损宽度';
ylabel = '胜率';
titleAndLabel = {title,xlabel,ylabel};
RelationFunc(R,titleAndLabel)
%% 止损宽度与赔率之间的关系
nATRExit = data(:,find(strcmp(td,'P:nATRExit'),1)-1);
R = [nATRExit,odds];

title = '止损宽度与赔率之间的关系';
xlabel = '止损宽度';
ylabel = '赔率';
titleAndLabel = {title,xlabel,ylabel};
RelationFunc(R,titleAndLabel)
%% 止损宽度与利润之间的关系
nATRExit = data(:,find(strcmp(td,'P:nATRExit'),1)-1);
R = [nATRExit,profit];

title = '止损宽度与利润之间的关系';
xlabel = '止损宽度';
ylabel = '利润';
titleAndLabel = {title,xlabel,ylabel};
RelationFunc(R,titleAndLabel)







































