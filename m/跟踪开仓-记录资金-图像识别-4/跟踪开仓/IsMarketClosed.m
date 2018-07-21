function [IsTodayClosed,IsNowClosed,IsTomorrowClosed]...
    = IsMarketClosed(inqueryDateAndTime)
% clear; clc; close all force;

if nargin == 0
    inqueryDateAndTime = now;
end

% inqueryDateAndTime = now;
currentDate =  floor(inqueryDateAndTime);
currentTime = rem(inqueryDateAndTime,1);

%% ��ȡ���б�
pp  = mfilename('fullpath');
i = strfind(pp,'\');
diretory = pp(1:i(end));

% filename = [diretory,'2017���ڻ��������а���.csv'];
filename = [diretory,'2018���ڻ��������а���.csv'];
if exist(filename,'file')
else
    return;
end
data = importdata(filename);

sizedata = size(data);
d = [];
for i = 1:sizedata(1)
    d = [d,data{i,:},',']; %#ok
end

pos1 = strfind(d,'������ҹ�̽���');
pos2 = strfind(d,'����');
pos3 = strfind(d,',');
c = cell(length(pos1)+length(pos2),1);
for i = 1:length(pos1)
    p = pos3(pos3<pos1(i));
    p = p(end-1:end);
    c(i,1) = {d(p(1)+1:p(2)-1)};
    c(i,2) = {'������ҹ�̽���'};
end

for i = 1:length(pos2)
    p = pos3(pos3<pos2(i));
    p = p(end-1:end);
    c(i+length(pos1),1) = {d(p(1)+1:p(2)-1)};
    % c(i+length(pos1),2) = {'����'};
    
    p = pos3(pos3>pos2(i));
    p = p(1);
    c(i+length(pos1),2) = {d(pos2(i):p-1)};
end

[ds,ind] = sort(datenum(c(:,1)));
c = c(ind,:);
%% ��ѯ
IsTodayClosed = '����';
IsTomorrowClosed =  '����';
IsYesterdyClosed =  '����';

% ˫��������
[DayNumber,DayName] = weekday(currentDate); 
[DayNumber1,DayName1] = weekday(currentDate+1); 
[DayNumber2,DayName2] = weekday(currentDate-1); 
if (DayNumber==7)||(DayNumber==1)
    IsTodayClosed = '����(��ĩ)';
end
if (DayNumber1==7)||(DayNumber1==1)
    IsTomorrowClosed = '����(��ĩ)';
end
if (DayNumber2==7)||(DayNumber2==1)
    IsYesterdyClosed = '����(��ĩ)';
end

% �ڼ�������
p = find(ds == currentDate);
p1 = find(ds == currentDate+1);
p2 = find(ds == currentDate-1);
if isempty(p)
else  
    IsTodayClosed = c{p,2};
end
if isempty(p1)
else  
    IsTomorrowClosed = c{p1,2};
end
if isempty(p2)
else  
    IsYesterdyClosed = c{p2,2};
end

t1 = rem(datenum({'09:00:00','10:15:00'}),1);
t2 = rem(datenum({'10:30:00','11:30:00'}),1);
t3 = rem(datenum({'13:30:00','15:00:00'}),1);
t4 = rem(datenum({'21:00:00','23:00:00'}),1);

IsNowClosed = '����';
if strcmp(IsTodayClosed(1:2) , '����')
end

if strcmp(IsTodayClosed , '������ҹ�̽���')
    if ((currentTime>t1(1))&&(currentTime<t1(2))) || ...
            ((currentTime>t2(1))&&(currentTime<t2(2))) || ...
            ((currentTime>t3(1))&&(currentTime<t3(2)))
        IsNowClosed = '����';
    end
end

if strcmp(IsTodayClosed , '����')
    if ((currentTime>t1(1))&&(currentTime<t1(2))) || ...
            ((currentTime>t2(1))&&(currentTime<t2(2))) || ...
            ((currentTime>t3(1))&&(currentTime<t3(2))) || ...
            ((currentTime>t4(1))&&(currentTime<t4(2)))
        IsNowClosed = '����';
    end
end













