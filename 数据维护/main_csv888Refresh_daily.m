function IsDataUpdateCompleted = main_csv888Refresh_daily(h)
% clear; clc;  close all;

fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = [fp(1:pp(end-1)),'m\跟踪开仓-记录资金-图像识别-4\跟踪开仓'];
filename00 = [directory,'\IsDataUpdateCompleted.mat'];

IsDataUpdateCompleted = 0; 
save(filename00,'IsDataUpdateCompleted')

%% 即时数据更新

time = clock;
time = str2double([num2str(time(4),'%02.0f'), num2str(time(5),'%02.0f')]);

if ~((time>1530)&&(time<2053))
    fprintf(2,'请在正确时段进行数据维护！\n');
    return;
end

filename = 'TA888.csv';
if exist(filename,'file')
else
    return;
end
dstruct = importdata(filename);
% display(dstruct.textdata(1,:));
% contractDate = datenum(dstruct.textdata);
UpdatedDate = dstruct.textdata{end};
[~,DayName] = weekday(UpdatedDate,'long');

% ---------------- 2018.07.13 修改 -----------------
% % set(0,'DefaultUicontrolFontsize',8)
% choice = questdlg({'上次更新日期为: ';UpdatedDate;DayName}, ...
%     '更新日期', ...
%     '继续','退出','退出');
% % Handle response
% switch choice
%     case '继续'
%     case '退出'
%         return;
% end

fprintf(['上次更新日期为: ',UpdatedDate, ' ', DayName ,'\n\n']);
% --------------------------------------------------

[IsTodayClosed,~,~] = IsMarketClosed(now);
% if strcmp(IsTodayClosed(1:2),'休市')
if strfind(IsTodayClosed,'休市')
    fprintf(2,'今日休市，禁止数据更新！\n');
    return;
end

aa = datenum(UpdatedDate):today;
len = length(aa);
if length(aa) > 2
    for i = 2:len-1
        [IsTodayClosed,~,~] = IsMarketClosed(aa(i));
        if strcmp(IsTodayClosed,'开市');
            fprintf(2,'数据不连续，无法进行更新！\n');
            return;
        end
    end
end

if length(aa) == 1
    fprintf(2,'今天数据已经更新！\n');
    IsDataUpdateCompleted = 1; 
    save(filename00,'IsDataUpdateCompleted')
    return;
end

%% 更新数据
fprintf('开始数据更新...\n\n');

csv888RefreshOneDay('A',h);
csv888RefreshOneDay('C',h);
csv888RefreshOneDay('RB',h);
csv888RefreshOneDay('M',h);
csv888RefreshOneDay('P',h);
csv888RefreshOneDay('J',h);
csv888RefreshOneDay('ZN',h);
csv888RefreshOneDay('Y',h);
csv888RefreshOneDay('L',h);
csv888RefreshOneDay('AG',h);
csv888RefreshOneDay('TA',h);
csv888RefreshOneDay('SR',h);
csv888RefreshOneDay('AU',h);
csv888RefreshOneDay('FG',h);
csv888RefreshOneDay('MA',h);
csv888RefreshOneDay('RU',h);
csv888RefreshOneDay('AL',h);
csv888RefreshOneDay('OI',h);
csv888RefreshOneDay('RM',h);
csv888RefreshOneDay('CF',h);
csv888RefreshOneDay('I',h);
csv888RefreshOneDay('JM',h);
csv888RefreshOneDay('CU',h);
% csv888RefreshOneDay('RI');
csv888RefreshOneDay('V',h);

csv888Refresh('IF',h);

fprintf('\n数据更新完成！\n');
%% 更新状态
IsDataUpdateCompleted = 1; 
save(filename00,'IsDataUpdateCompleted')
end













































