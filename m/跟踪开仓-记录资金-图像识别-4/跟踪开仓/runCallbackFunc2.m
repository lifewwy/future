function runCallbackFunc2(TradeAccout)
% clc; clear; close all; % clear ���������Ĳ���

if nargin==0
    TradeAccout = 4;
end

h = panel;
%% ��������
% �����˻���ѯ�ȴ�ʱ��
wt1 = 30; % testTraderApi.exe �˳�ʱ��Ϊ 20s
% �˻�����ѯ����
cn = 10;
% ����ά���ȴ�ʱ��
wt2 = 10*60;
% ���ز��Եȴ�ʱ��
wt3 = 2*60;
% ��ʼ�����ȴ�ʱ��
wt4 = 10;
% ���ն����ȴ�ʱ��
wt5 = 10;
% ���ö����ȴ�ʱ��
wt6 = 5;
% �ֲֲ�ѯ�ȴ�ʱ��
wt7 = 60;

% % �����˻���ѯ�ȴ�ʱ��
% wt1 = 10; % testTraderApi.exe �˳�ʱ��Ϊ 20s
% % �˻�����ѯ����
% cn = 10;
% % ����ά���ȴ�ʱ��
% wt2 = 10;
% % ���ز��Եȴ�ʱ��
% wt3 = 10;
% % ��ʼ�����ȴ�ʱ��
% wt4 = 5;
% % ���ն����ȴ�ʱ��
% wt5 = 5;
% % ���ö����ȴ�ʱ��
% wt6 = 5;

%% ���ý����˻���1����ó�ڻ���2���º��ڻ���3��SimNow1��4��SimNow2
set(h.TradeAccout,'value',TradeAccout);
pause(.3);
%% ��¼����
% panel('pushbutton24_Callback',h.pushbutton24,[],guidata(h.pushbutton24));
%% �˻���ѯ
for i = 1:cn
    if isfield(h,'Step1_GetMyAccount_Flg') && h.Step1_GetMyAccount_Flg == 1
        break;
    else
        panel('pushbutton40_Callback',h.pushbutton40,[],guidata(h.pushbutton40));
        pause(wt1);
        h = guidata(h.output); % �õ� h.Step1_GetMyAccount_Flg �ĸ��£����� h ʼ�ղ��䡣
    end 
end

if h.Step1_GetMyAccount_Flg ~=1
    fprintf(2,'�˻���ѯʧ�ܣ�\n');
    SendEmailFunc;
    return;
end
%% ����ά��
panel('pushbutton25_Callback',h.pushbutton25,[],guidata(h.pushbutton25));
pause(wt2);
h =guidata(h.output);
if h.IsDataUpdateCompleted ~= 1
    fprintf(2,'����ά��ʧ�ܣ�\n');
    SendEmailFunc;
    return;
end
%% ���ز���
panel('ApplyStrategyButton_Callback',h.ApplyStrategyButton,[],guidata(h.ApplyStrategyButton));
pause(wt3);
%% �ֲֲ�ѯ
panel('pushbutton34_Callback',h.pushbutton34,[],guidata(h.pushbutton34));
pause(wt7);
%% ��ʼ����
panel('pushbutton41_Callback',h.pushbutton41,[],guidata(h.pushbutton41));
pause(wt4);
%% ���ն���
panel('pushbutton42_Callback',h.pushbutton42,[],guidata(h.pushbutton42));
pause(wt5);
%% ���ö���
panel('pushbutton43_Callback',h.pushbutton43,[],guidata(h.pushbutton43));
pause(wt6);
%% ���ʼ�
SendEmailFunc;
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












