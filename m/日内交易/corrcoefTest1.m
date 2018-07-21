%% 大部分品种和开盘价比都涨或跌时，顺趋势买入是否可行
clear; clc; close all; 
    
%% 读 CSV 文件

diretory = 'C:\D\future\m\日内交易\';
futureCode = [{'C'},{'RB'},{'M'},{'P'},...
    {'J'},{'ZN'},{'Y'},{'RU'},{'L'},...
    {'TA'},{'SR'}, ...
    {'MA'},{'AL'},{'OI'},...
    {'CU'}];

% 最大时间集
index = [];
for i=1:length(futureCode)
    filename = [diretory, char(futureCode(i)), ...
        '(1分钟)','.csv'];
    
    if exist(filename,'file')
    else
        disp('文件不存在！');
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
    disp('日期时间没有按顺序排列！');
    return;
end

%% 收集各个交易品种的收盘价数据
c = zeros(length(dt),length(index)+1);
c(:,1) = dtnum;
for i=1:length(index)
    filename = [diretory, char(futureCode(index(i))), ...
        '(1分钟)','.csv'];
    
    if exist(filename,'file')
    else
        disp('文件不存在！');
        return;
    end
    
    dstruct = importdata(filename);
    % display(dstruct.textdata(1,:));
    
    dateAndTime = dstruct.textdata;
    [~,pos1,pos2] = intersect(dt, ...
            dstruct.textdata);
        
    if length(pos1)~=length(dateAndTime)
        fprintf(2,'出错！\n');
        continue;
    end
    
    csvData = dstruct.data;
    c(pos1,i+1) = csvData(pos2,4);
end

 %% 按交易日分割数据
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

%% 分析每个交易日内的分时数据
close all;
oneDayData = cell2mat(x(120));
% datestr(OneDayData(:,1),'yyyy-mm-dd HH:MM:SS')
PausePos = oneDayData(diff(oneDayData(:,1))>8e-4,1); % 日内停盘时间

if length(PausePos) == 3
    if sum( sum( datestr( rem(PausePos,1) ,'HH:MM:SS') == ['02:29:00';
            '10:14:00';'11:29:00'] ) ) == 24
        disp('日内停盘时间正确！');
    else
        disp('日内停盘时间错误！');
    end
else
    disp('日内停盘时间错误！');
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














































































































































