clear all; clc; close all; warning('off') %#ok;

%% ���̼����ݾ����ʼ��
closePrice = zeros( 1e5,18 + 1 );

%% ����ģ��
load templet1

%% ������ʱ��
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

































































