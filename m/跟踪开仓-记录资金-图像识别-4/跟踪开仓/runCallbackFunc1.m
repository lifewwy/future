function runCallbackFunc1
clc; clear; close all;

h = panel;
%% ���ý����˻���1����ó�ڻ���2���º��ڻ���3��SimNow1��4��SimNow2
set(h.TradeAccout,'value',1);
pause(.3);

%% ��¼����
% panel('pushbutton24_Callback',h.pushbutton24,[],guidata(h.pushbutton24));

%% ����ά��
panel('pushbutton25_Callback',h.pushbutton25,[],guidata(h.pushbutton25));

%% ���ز���
t00 = timer; 
t00.StartDelay = 60*10; % seconds
% t00.StartDelay = 5;
t00.TimerFcn = @(myTimerObj, thisEvent)applyStrategies(h);
start(t00);

%% ��ѯ�˻�&���ɶ���

%% ���ý����˻���1����ó�ڻ���2���º��ڻ���3��SimNow1��4��SimNow2
% set(h.TradeAccout,'value',4)
% 
% % ���ö�ʱ����ʼʱ�䣬1��21:00��2��9:00��3��Now
% set(h.startAt,'value',3)
% 
% % ����ͻ�ưٷֱ�
% % set(h.edit1,'string','0.08');
% 
% % 1��ģ�⣬0��ʹ����ʵ����
% set(h.checkbox1,'value',1)
% 
% % ���ö���
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
% % panel�Ķ�ʱ������������������Ķ�ʱ��
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












