clear all; clc; close all; warning('off') %#ok;

% 1：豆粕，2：橡胶，3：郑棉，4：郑油，5：白糖，6：郑醇，
% 7：豆油，8：玻璃，9：塑料，10：棕榈，11：焦炭，12：沪铜，
% 13：沪铝，14：PTA，15：沪锌，16：螺纹，17：沪银，18：IF

% 大商所的现有夜盘交期的期货品种的夜盘交易时间
% 从2015年5月8日晚开始，均调整为 21:00-23:30

% 1 - 23:30, 2 - 23:00, 3 - 23:30， 5 - 23:30, 
% 6 - 23:30, 7 - 23:00,  14 - 23:30, 



%% 读数据
format longG;

FileList = dir('closePrice*.mat');

for i = length(FileList)
    FileName = FileList(i).name;
    eval(['load' , ' ',FileName]);
    pos = find( FileName ==  '.');
    eval(['c = ', FileName(1:pos-1), ';'])
    
    csize = size(c);

        
%     plot(c(c(:,1)<20150508233000,2))
%     plot(c(c(:,1)<20150508230000,3))
    plot(c(c(:,1)<20150508233000,4))

    
end



%% 读数据
% myDateStr = datestr(datenum(date),'yyyy/mm/dd');
% myDateStr = '2015/05/05';
% myDateStr(myDateStr == '/') = [];
% fileName1 = ['closePrice', myDateStr, '_1.mat'];
% fileName2 = ['closePrice', myDateStr, '_2.mat'];
% if exist(fileName1,'file')
%     loadData1 = ['load ',  fileName1];
%     eval(loadData1);
% end
% if exist(fileName2,'file')
%     loadData2 = ['load ',  fileName2];
%     eval(loadData2);
% end

% eval([  'Data = [' fileName1 ,' ; ',  fileName2 '];' ]);

% c = closePrice20150505_1;

%% 更改日期时间格式
% format longG;
% for i = 1:length(c)
%     i
%     dstr = datestr(c(i,1),'yyyy-mm-dd');
%     dstr( dstr == '-') = [];
%     dt = str2double([dstr ...
%         num2str(c(i,2), '%02.0f') ...
%         num2str(c(i,3), '%02.0f') ...
%         num2str(c(i,4), '%04.1f') ]);
%     c(i,1) = dt;
% end

% c(:,2:4) = [];

% closePrice20150505_1 = c;
% save closePrice20150505_1 closePrice20150505_1;

%% 取有效时间段数据 并 去除异常值

% zn = c(c(:,1)<20150509005959, 16);
% threshold = 1.5;
% pos1 = find((zn/mean(zn))>threshold);
% if ~isempty(pos1)
%     zn(pos1) = zn(pos1+1);
% end
% pos2 = find((mean(zn)./zn)>threshold);
% if ~isempty(pos2)
%     zn(pos2) = zn(pos2+1);
% end
% plot(zn)

































































































