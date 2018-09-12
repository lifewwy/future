function GenCCorders(contract1,contract2,handles)

% clear; clc; close all;

if nargin==0
%     contract1 = 'ma1801';
%     contract2 = 'ma1805';
    contract1 = 'p1801';
    contract2 = 'p1805';
%     contract1 = 'ru1801';
%     contract2 = 'ru1805';
%     contract1 = 'y1801';
%     contract2 = 'y1805';
end
%% 账户选择
AccountSelection = get(handles.TradeAccout,'value');
% AccountSelection = 1;
switch AccountSelection
    case 1
        adInfo = '国贸期货';
    case 2
        adInfo = '新湖期货';
    case 3
        adInfo = 'SimNow1';
    case 4
        adInfo = 'SimNow2';
end
%% 输出订单文件
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
folder1 = fp(1:pp(end));

listing = dir([folder1,'订单*.csv']);
% fileName = [folder1,listing(i).name];
% folder1 = 'C:\D\future\m\跟踪开仓-记录资金-图像识别-4\记录资金\';
% filename = [folder1,'订单-',adInfo,'.csv'];


nOrderFile = length(listing);
if isempty(nOrderFile)
    filename = {[folder1,'订单-',adInfo,'.csv']};
else
    filename = cell(1,nOrderFile);
    for i = 1:nOrderFile
        filename(i) = {[folder1,listing(i).name]};
    end
end

for i = 1:length(filename)
    
    fid = fopen(filename{i},'a+');
    fprintf(fid, '\n');
    
    fprintf(fid, '%s,', datestr(now,'yyyy/mm/dd'));
    fprintf(fid, '%s,', contract1);
    fprintf(fid, '%s,', '(换合约)');
    fprintf(fid, '%d\n', NaN);
    fprintf(fid, '%s,', datestr(now,'yyyy/mm/dd'));
    fprintf(fid, '%s,', contract2);
    fprintf(fid, '%s,', '(换合约)');
    fprintf(fid, '%d\n', NaN);
    
    fclose(fid);
    
end
disp('订单文件更新成功！');

%% 写 txt 文件
% fid=fopen('*.txt','打开方式')
% 说明：其中fid用于存储文件句柄值，如果返回的句柄值大于0，则说明文件打开成功。
% 文件名用字符串形式，表示待打开的数据文件。常见的打开方式如下：
% 'r'：只读方式打开文件（默认的方式），该文件必须已存在。
% 'r+'：读写方式打开文件，打开后先读后写。该文件必须已存在。
% 'w'：打开后写入数据。该文件已存在则更新；不存在则创建。
% 'w+'：读写方式打开文件。先读后写。该文件已存在则更新；不存在则创建。
% 'a'：在打开的文件末端添加数据。文件不存在则创建。
% 'a+'：打开文件后，先读入数据再添加数据。文件不存在则创建。

% TodayDate = datestr(now,'yyyymmdd');
% fid = fopen(['交易',TodayDate,'.txt'],'a');
% fprintf(fid,'%s\r\n','j1709 平仓');
% fprintf(fid,'\r\n');
% fprintf(fid,'%s\r\n','j1801 开仓');
% fprintf(fid,'\r\n');
% fclose(fid);
















