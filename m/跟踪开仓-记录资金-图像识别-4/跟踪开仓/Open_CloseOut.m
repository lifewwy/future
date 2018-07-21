clear; clc; close all force;


Contract = {'CU1702'; 'M1705'; 'CF1705'};
action = {'Buy Open','Sell Open', 'Buy EvenUp'};
hands = [5, 6, 7];
price = [1250, 2560, 1978];

%% 收盘价数据矩阵初始化
Data = zeros( 1e2,7,length(Contract));

%% 启动定时器
delete(timerfind)

global nTimes;
nTimes = 0;

global ActionDoneFlg;
ActionDoneFlg = zeros(1,length(Contract));

N = 1e3;
ActionLine = zeros(3,N);
cp = zeros(3,N);
% Maximum Or Minimum Since Scratch
aa = zeros(3,1);

period = .1; % 秒

t1 = timer('TimerFcn', ...
    '[ActionLine,cp,aa] = RealTimeDataFunc( Contract,action,hands,cp,ActionLine,aa );', ...
    'Period', period, ...
    'ExecutionMode', 'fixedSpacing', ...
    'StopFcn', ' ', 'TasksToExecute', N);
 
start(t1); 
 
% Start timer(s) running at specified time
% startat(t1,'21:00:00');
% startat(t2,'9:00:00');

% stop(timerfind);
%% 画图
% i = 1; figure;
% plot(cp(i,1:nTimes)); hold on; plot(ActionLine(i,1:nTimes),'r')
% i = 2; figure;
% plot(cp(i,1:nTimes)); hold on; plot(ActionLine(i,1:nTimes),'r')
% i = 3; figure;
% plot(cp(i,1:nTimes)); hold on; plot(ActionLine(i,1:nTimes),'r')








