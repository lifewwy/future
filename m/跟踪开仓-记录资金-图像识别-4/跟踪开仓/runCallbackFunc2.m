function runCallbackFunc2(TradeAccout)
% clc; clear; close all; % clear 会清除输入的参数

if nargin==0
    TradeAccout = 4;
end

h = panel;
%% 参数设置
% 单次账户查询等待时间
wt1 = 30; % testTraderApi.exe 退出时间为 20s
% 账户最大查询次数
cn = 10;
% 数据维护等待时间
wt2 = 10*60;
% 加载策略等待时间
wt3 = 2*60;
% 初始订单等待时间
wt4 = 10;
% 最终订单等待时间
wt5 = 10;
% 设置订单等待时间
wt6 = 5;
% 持仓查询等待时间
wt7 = 60;

% % 单次账户查询等待时间
% wt1 = 10; % testTraderApi.exe 退出时间为 20s
% % 账户最大查询次数
% cn = 10;
% % 数据维护等待时间
% wt2 = 10;
% % 加载策略等待时间
% wt3 = 10;
% % 初始订单等待时间
% wt4 = 5;
% % 最终订单等待时间
% wt5 = 5;
% % 设置订单等待时间
% wt6 = 5;

%% 设置交易账户，1：国贸期货，2：新湖期货，3：SimNow1，4：SimNow2
set(h.TradeAccout,'value',TradeAccout);
pause(.3);
%% 登录测试
% panel('pushbutton24_Callback',h.pushbutton24,[],guidata(h.pushbutton24));
%% 账户查询
for i = 1:cn
    if isfield(h,'Step1_GetMyAccount_Flg') && h.Step1_GetMyAccount_Flg == 1
        break;
    else
        panel('pushbutton40_Callback',h.pushbutton40,[],guidata(h.pushbutton40));
        pause(wt1);
        h = guidata(h.output); % 得到 h.Step1_GetMyAccount_Flg 的更新，否则 h 始终不变。
    end 
end

if h.Step1_GetMyAccount_Flg ~=1
    fprintf(2,'账户查询失败！\n');
    SendEmailFunc;
    return;
end
%% 数据维护
panel('pushbutton25_Callback',h.pushbutton25,[],guidata(h.pushbutton25));
pause(wt2);
h =guidata(h.output);
if h.IsDataUpdateCompleted ~= 1
    fprintf(2,'数据维护失败！\n');
    SendEmailFunc;
    return;
end
%% 加载策略
panel('ApplyStrategyButton_Callback',h.ApplyStrategyButton,[],guidata(h.ApplyStrategyButton));
pause(wt3);
%% 持仓查询
panel('pushbutton34_Callback',h.pushbutton34,[],guidata(h.pushbutton34));
pause(wt7);
%% 初始订单
panel('pushbutton41_Callback',h.pushbutton41,[],guidata(h.pushbutton41));
pause(wt4);
%% 最终订单
panel('pushbutton42_Callback',h.pushbutton42,[],guidata(h.pushbutton42));
pause(wt5);
%% 设置订单
panel('pushbutton43_Callback',h.pushbutton43,[],guidata(h.pushbutton43));
pause(wt6);
%% TB操作 20180823
startTB;
%% 发邮件
SendEmailFunc;
%% 设置交易账户，1：国贸期货，2：新湖期货，3：SimNow1，4：SimNow2
% set(h.TradeAccout,'value',4)
% 
% % 设置定时器开始时间，1：21:00，2：9:00，3：Now
% set(h.startAt,'value',3)
% 
% % 设置突破百分比
% % set(h.edit1,'string','0.08');
% 
% % 1：模拟，0：使用真实数据
% set(h.checkbox1,'value',1)
% 
% % 设置订单
% for i = 1:8
%     set(eval(['h.popupmenu',num2str((i-1)*4+1)]),'value',13)
%     set(eval(['h.popupmenu',num2str((i-1)*4+2)]),'value',5)
%     set(eval(['h.popupmenu',num2str((i-1)*4+3)]),'value',2)
%     set(eval(['h.popupmenu',num2str((i-1)*4+4)]),'value',3)
% end
% 
% if ~isempty(timerfind)
%     stop(timerfind);
% end
% delete(timerfind);
% 
% % OK
% panel('pushbutton3_Callback',h.pushbutton3,[],guidata(h.pushbutton3));
% pause(5);
% 
% % panel的定时器启动后再启动下面的定时器
% for i = 1:1e3
%     tf = timerfind;
%     if ~isempty(tf)
%         strcmpi(tf.Running,'on');
%         break;
%     else
%         pause(2);
%     end
% end
% 
% tt = timer('TimerFcn', ...
%     'isTimerStopped;', ...
%     'Period', 1, ...
%     'ExecutionMode', 'fixedSpacing', ...
%     'StopFcn', ' ', 'TasksToExecute', 100);
% 
% start(tt);

end












