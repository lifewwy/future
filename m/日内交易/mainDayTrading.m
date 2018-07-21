clear all; clc; close all; 

%% ��ʱ��
% x=1;
% t = timer('TimerFcn','disp(x);x=x+1;', 'Period', 1, 'ExecutionMode', 'fixedSpacing', 'TasksToExecute', 20);
% start(t);
% stop(t);

%% ���������Լ�б�
futureCode = [{'C'},{'RB'},{'M'},{'P'},{'J'},{'ZN'},{'Y'},{'L'},{'AG'},{'TA'},{'SR'}, ...
    {'AU'},{'FG'},{'MA'},{'RU'},{'AL'},{'OI'},{'RM'},{'CF'},{'I'},{'JM'},{'CU'},{'V'},{'A'}];

M = length(futureCode);


% �� CSV �ļ�
list = [];
for i = 1:M
    filename = ['C:\D\future\����ά��\', char(futureCode(i)), '888.csv'];
    if exist(filename,'file')
    else
        return;
    end
    
    dstruct = importdata(filename);
    % display(dstruct.textdata(1,:));
    csvData = dstruct.data;
    list = [list ',' char(futureCode(i)),num2str(csvData(end,end))];%#ok
end
list = list(2:end);

%% ʵʱ����
url = ['http://hq.sinajs.cn/list=' list];
% ������Ϣ���������̼ۣ���߼ۣ���ͼۣ��������̼ۣ����¼ۣ������̼ۣ���
% ����ۣ�����㣬�������������ֲ������ɽ�����Ʒ������ƣ����ڵ�

RealTimeData = zeros(3e5,M+4);
nCount = 0;

delete(timerfind)

t = timer('TimerFcn','DayTrading1;', 'Period', 1, 'ExecutionMode', 'fixedSpacing', 'TasksToExecute', 3e5);
start(t);

% stop(t); % �ɷ��� TimerFcn �У�Ҳ����������м�����ֹͣ�������еĶ�ʱ����






























