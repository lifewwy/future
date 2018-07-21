clear all; clc; close all;

%% ���������Լ�б�
futureCode = [{'C'},{'RB'},{'M'},{'P'},{'J'},{'ZN'},{'Y'},{'L'},{'AG'},{'TA'},{'SR'}, ...
    {'AU'},{'FG'},{'MA'},{'RU'},{'AL'},{'OI'},{'RM'},{'CF'},{'I'},{'JM'},{'CU'},{'V'},{'A'}];

% �� CSV �ļ�
list = [];
for i = 1:length(futureCode)
    filename = [char(futureCode(i)), '888.csv'];
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

RealTimeData = zeros(3e5,length(futureCode)+4);

for kkkk = 1:10
    kkkk %#ok

    [KLineDataTmp, ~] = urlread(url);
    
    time = clock;    hour = time(4); 
    minute = time(5); second = time(6);
    
    pos1 = [0, find( KLineDataTmp == ';')];
    
    for i = 1:length(pos1)-1
        
        KLineData = KLineDataTmp(pos1(i)+1:pos1(i+1)-1);
        pos2 = find(KLineData==',');
        
%         o = str2double(KLineData(pos2(2)+1:pos2(3)-1));
%         h = str2double(KLineData(pos2(3)+1:pos2(4)-1));
%         l = str2double(KLineData(pos2(4)+1:pos2(5)-1));
        c = str2double(KLineData(pos2(8)+1:pos2(9)-1));
%         v = str2double(KLineData(pos2(14)+1:pos2(15)-1));

        RealTimeData(kkkk,1) = datenum(date);
        RealTimeData(kkkk,2) = hour;
        RealTimeData(kkkk,3) = minute;
        RealTimeData(kkkk,4) = second;
       
        RealTimeData(kkkk,i+4) = c;
    end
    
end

% fprintf(2,'���ݸ�ʽ������\n');

%% ��ʱ��
% x=1;
% t = timer('TimerFcn','disp(x);x=x+1;', 'Period', 1, 'ExecutionMode', 'fixedSpacing', 'TasksToExecute', 20);
% start(t);

% stop(t);



















