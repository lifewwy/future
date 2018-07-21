function Open_CloseOut_func(orders,handles)

% clear; clc; 
% close all;
% close all force;

% % 合约字母必须大写
% orders = {
%     struct('contract', 'CU1702', 'action', 'Buy Open', 'hands', 5)
%     struct('contract', 'SR1705', 'action', 'Sell Open', 'hands', 10)
% %     struct('contract', 'Y1705', 'action', 'Buy EvenUp', 'hands', 17, 'price', 458)
% %     struct('contract', 'RU1705', 'action', 'Sell EvenUp', 'hands', 62, 'price', 1023)
%     };

orders{1:end} %#ok

nOrders = length(orders);

%% 启动定时器
delete(timerfind)

nTimes = 0;
ActionDoneFlg = zeros(1,nOrders);

N = 1e5;
ActionLine = zeros(nOrders,N);
cp = zeros(nOrders,N);

% Maximum Or Minimum Since Scratch
aa = zeros(nOrders,1);

period = .1; % 秒
% period = 0.5; % 秒

assignin('base','orders',orders)
assignin('base','cp',cp)
assignin('base','ActionLine',ActionLine)
assignin('base','aa',aa)
assignin('base','nTimes',nTimes)
assignin('base','ActionDoneFlg',ActionDoneFlg)

assignin('base','handles',handles)

figure; % 最小化后依然可以在后台画图
t1 = timer('TimerFcn', ...
    '[ActionLine,cp,aa, nTimes,ActionDoneFlg ] = RealTimeDataFunc1( orders,cp,ActionLine,aa, nTimes,ActionDoneFlg );', ...
    'Period', period, ...
    'ExecutionMode', 'fixedSpacing', ...
    'StopFcn', ' ', 'TasksToExecute', N, ...
    'Name','myMainTimer');
 

switch get(handles.startAt,'value')
    case 1
        startat(t1,'21:00:00');
    case 2
        startat(t1,'9:00:00');
    case 3
        start(t1); 
    otherwise
end

% start(t1); 
 
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








