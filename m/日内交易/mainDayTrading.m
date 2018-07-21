clear all; clc; close all; 

%% 定时器
% x=1;
% t = timer('TimerFcn','disp(x);x=x+1;', 'Period', 1, 'ExecutionMode', 'fixedSpacing', 'TasksToExecute', 20);
% start(t);
% stop(t);

%% 获得主力合约列表
futureCode = [{'C'},{'RB'},{'M'},{'P'},{'J'},{'ZN'},{'Y'},{'L'},{'AG'},{'TA'},{'SR'}, ...
    {'AU'},{'FG'},{'MA'},{'RU'},{'AL'},{'OI'},{'RM'},{'CF'},{'I'},{'JM'},{'CU'},{'V'},{'A'}];

M = length(futureCode);


% 读 CSV 文件
list = [];
for i = 1:M
    filename = ['C:\D\future\数据维护\', char(futureCode(i)), '888.csv'];
    if exist(filename,'file')
    else
        return;
    end
    
    dstruct = importdata(filename);
    % display(dstruct.textdata(1,:));
    csvData = dstruct.data;
    list = [list ',' char(futureCode(i)),num2str(csvData(end,end))];%#ok
end
list = list(2:end);

%% 实时数据
url = ['http://hq.sinajs.cn/list=' list];
% 返回信息包括：开盘价，最高价，最低价，昨日收盘价，最新价（即收盘价），
% 结算价，昨结算，买量，卖量，持仓量，成交量，品种名简称，日期等

RealTimeData = zeros(3e5,M+4);
nCount = 0;

delete(timerfind)

t = timer('TimerFcn','DayTrading1;', 'Period', 1, 'ExecutionMode', 'fixedSpacing', 'TasksToExecute', 3e5);
start(t);

% stop(t); % 可放在 TimerFcn 中，也可以在命令窗中键入来停止正在运行的定时器。






























