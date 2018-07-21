function runCallbackFunc
clc; clear; close all;

h = panel;


% 登录测试
% panel('pushbutton24_Callback',h.pushbutton24,[],guidata(h.pushbutton24));

% 数据维护
% panel('pushbutton25_Callback',h.pushbutton25,[],guidata(h.pushbutton25));

% 设置交易账户，1：国贸期货，2：新湖期货，3：SimNow1，4：SimNow2
set(h.TradeAccout,'value',4)

% 设置定时器开始时间，1：21:00，2：9:00，3：Now
set(h.startAt,'value',3)

% 设置突破百分比
% set(h.edit1,'string','0.08');

% 1：模拟，0：使用真实数据
set(h.checkbox1,'value',1)

% 设置订单
for i = 1:8
    set(eval(['h.popupmenu',num2str((i-1)*4+1)]),'value',13)
    set(eval(['h.popupmenu',num2str((i-1)*4+2)]),'value',5)
    set(eval(['h.popupmenu',num2str((i-1)*4+3)]),'value',2)
    set(eval(['h.popupmenu',num2str((i-1)*4+4)]),'value',3)
end

if ~isempty(timerfind)
    stop(timerfind);
end
delete(timerfind);

% OK
panel('pushbutton3_Callback',h.pushbutton3,[],guidata(h.pushbutton3));
pause(5);

% panel的定时器启动后再启动下面的定时器
for i = 1:1e3
    tf = timerfind;
    if ~isempty(tf)
        strcmpi(tf.Running,'on');
        break;
    else
        pause(2);
    end
end

tt = timer('TimerFcn', ...
    'isTimerStopped;', ...
    'Period', 1, ...
    'ExecutionMode', 'fixedSpacing', ...
    'StopFcn', ' ', 'TasksToExecute', 100);

start(tt);


end












