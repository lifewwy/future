%% �󲿷�Ʒ�ֺͿ��̼۱ȶ��ǻ��ʱ��˳���������Ƿ����
clear; clc; close all; 
    
%% �� CSV �ļ�

diretory = 'C:\D\future\m\���ڽ���\';
futureCode = [{'C'},{'RB'},{'M'},{'P'},...
    {'J'},{'ZN'},{'Y'},{'RU'},{'L'},...
    {'TA'},{'SR'}, ...
    {'MA'},{'AL'},{'OI'},...
    {'CU'}];

% ��ͬƷ������ʱ��Ľ���
index = [];
for i=1:length(futureCode)
    filename = [diretory, char(futureCode(i)), ...
        '(1����)','.csv'];
    
    if exist(filename,'file')
    else
        disp('�ļ������ڣ�');
        continue;
    end
    
    dstruct = importdata(filename);
    % display(dstruct.textdata(1,:));
    
    % dateAndTime = dstruct.textdata;
    % csvData = dstruct.data;
    
    index = [index,i]; %#ok
    
    if length(index) == 1
        dt = dstruct.textdata;
    else
        dt1 = dstruct.textdata;
        [dt,~,~] = intersect(dt, ...
            dstruct.textdata);
        
    end
    
end


c = zeros(length(dt),length(index));
c1 = zeros(length(dt),length(index));
for i=1:length(index)
    filename = [diretory, char(futureCode(index(i))), ...
        '(1����)','.csv'];
    
    if exist(filename,'file')
    else
        disp('�ļ������ڣ�');
        return;
    end
    
    dstruct = importdata(filename);
    % display(dstruct.textdata(1,:));
    
    dateAndTime = dstruct.textdata;
    [~,~,pos] = intersect(dt, ...
            dstruct.textdata);
        
    if length(pos)~=length(dt)
        fprintf(2,'����\n');
        continue;
    end
    
    csvData = dstruct.data;
    c(:,i) = csvData(pos,4);
    
    t = c(:,i)-mean(c(:,i));
    c1(:,i) = t/max(t);
    
end

figure;
for i=1:length(index)
    % plot(c1(:,i)+(i-1)*2); hold on;
    plot(c1(:,i),'Color',rand(1,3)); hold on;
end
grid;

figure; plot(diff(datenum(dt)))

















































































































































