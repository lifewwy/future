clear all; clc; close all; warning('off') %#ok;

%% 收盘价数据矩阵初始化
closePrice = zeros( 1e5,18 + 1 );

%% 载入模板
load templet1

%% 启动定时器
RecordTimes = 0;
ReconnectionNum = 0;

delete(timerfind)

t1 = timer('TimerFcn','GetPrice1', 'Period', 1, ...
    'ExecutionMode', 'fixedSpacing', ...
    'StopFcn', ' ', 'TasksToExecute', 1e5);

t2 = timer('TimerFcn','GetPrice1', 'Period', 1, ...
    'ExecutionMode', 'fixedSpacing', ...
    'StopFcn', ' ', 'TasksToExecute', 1e5);

% t3 = timer('TimerFcn','GetPrice1', 'Period', 1, ...
%     'ExecutionMode', 'fixedSpacing', ...
%     'StopFcn', ' ', 'TasksToExecute', 1e5);

% t4 = timer('TimerFcn','GetPrice1', 'Period', 1, ...
%     'ExecutionMode', 'fixedSpacing', ...
%     'StopFcn', ' ', 'TasksToExecute', 1e5);

start(t1);

% Start timer(s) running at specified time
% startat(t1,'21:00:00');
% startat(t2,'9:00:00');

% stop(timerfind);

































































