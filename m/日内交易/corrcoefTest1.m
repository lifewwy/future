%% �󲿷�Ʒ�ֺͿ��̼۱ȶ��ǻ��ʱ��˳���������Ƿ����
clear; clc; close all; 
    
%% �� CSV �ļ�

diretory = 'C:\D\future\m\���ڽ���\';
futureCode = [{'C'},{'RB'},{'M'},{'P'},...
    {'J'},{'ZN'},{'Y'},{'RU'},{'L'},...
    {'TA'},{'SR'}, ...
    {'MA'},{'AL'},{'OI'},...
    {'CU'}];

% ���ʱ�伯
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
        [dt,~,~] = union(dt, ...
            dstruct.textdata);
        
    end
    
end

dtnum = datenum(dt);
[~,i] = sort(dtnum); 
if sum(diff(i)-1) ~= 0
    disp('����ʱ��û�а�˳�����У�');
    return;
end

%% �ռ���������Ʒ�ֵ����̼�����
c = zeros(length(dt),length(index)+1);
c(:,1) = dtnum;
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
    [~,pos1,pos2] = intersect(dt, ...
            dstruct.textdata);
        
    if length(pos1)~=length(dateAndTime)
        fprintf(2,'����\n');
        continue;
    end
    
    csvData = dstruct.data;
    c(pos1,i+1) = csvData(pos2,4);
end

 %% �������շָ�����
timeBegin = rem(datenum('2015-03-11 21:00:00'),1); % 21:00:00
timeEnd = rem(datenum('2015-03-11 14:59:00'),1); % 14:59:00

openPos = find( rem( c(:,1),1 ) == timeBegin);
closePos = find( rem( c(:,1),1 ) == timeEnd);
% datestr( c(openPos,1), 'yyyy-mm-dd HH:MM:SS')

x = cell(min(length(openPos),length(openPos)),1);
for i = 1:min(length(openPos),length(openPos))
    pos = find(closePos>openPos(i),1);
    if ~isempty(pos)
    x(i) = { c(openPos(i):closePos(pos),:) };
    else
        x(i) = { c(openPos(i):end,:) };
    end
end

%% ����ÿ���������ڵķ�ʱ����
close all;
oneDayData = cell2mat(x(120));
% datestr(OneDayData(:,1),'yyyy-mm-dd HH:MM:SS')
PausePos = oneDayData(diff(oneDayData(:,1))>8e-4,1); % ����ͣ��ʱ��

if length(PausePos) == 3
    if sum( sum( datestr( rem(PausePos,1) ,'HH:MM:SS') == ['02:29:00';
            '10:14:00';'11:29:00'] ) ) == 24
        disp('����ͣ��ʱ����ȷ��');
    else
        disp('����ͣ��ʱ�����');
    end
else
    disp('����ͣ��ʱ�����');
end

oneDayData(oneDayData==0)=NaN;

cTmp = oneDayData(:,2:6)-repmat( nanmean(oneDayData(:,2:6)), size(oneDayData,1),1);
cNomalized = cTmp./repmat( nanmax(cTmp), size(oneDayData,1),1);
cNomalized = [oneDayData(:,1),cNomalized];

figure; plot(diff(oneDayData(:,1)));
figure; plot(oneDayData(:,2:end));
figure; plot(cNomalized(:,2:end));

figure; hold on;
for i = 1:size(cNomalized,2)-1
    plot(cNomalized(:,i+1)+2*i-1);
end
grid;














































































































































