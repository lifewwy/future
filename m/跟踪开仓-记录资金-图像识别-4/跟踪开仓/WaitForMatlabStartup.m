

t = timer;

% 等待 MATLAB 启动时间
t.StartDelay = 20;

% 设置交易账户，1：国贸期货，2：新湖期货，3：SimNow1，4：SimNow2
TradeAccout = 1;

% t.TimerFcn = @(myTimerObj, thisEvent)runCallbackFunc;
% t.TimerFcn = @(myTimerObj, thisEvent)runCallbackFunc1;
t.TimerFcn = @(myTimerObj, thisEvent)runCallbackFunc2(TradeAccout);

start(t)












