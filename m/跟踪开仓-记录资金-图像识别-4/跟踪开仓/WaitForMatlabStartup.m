

t = timer;

% �ȴ� MATLAB ����ʱ��
t.StartDelay = 120;

% ���ý����˻���1����ó�ڻ���2���º��ڻ���3��SimNow1��4��SimNow2
TradeAccout = 1;

% t.TimerFcn = @(myTimerObj, thisEvent)runCallbackFunc;
% t.TimerFcn = @(myTimerObj, thisEvent)runCallbackFunc1;
t.TimerFcn = @(myTimerObj, thisEvent)runCallbackFunc2(TradeAccout);

start(t)












