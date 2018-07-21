function dtNormalization( futureCode )

%% 将日期和时间标准化为 yyyy/mm/dd HH:MM
% clear; clc; close all;

%% 读 CSV 文件

% diretory = 'C:\D\future\m\日内交易\';
% futureCode = [{'C'},{'RB'},{'M'},{'P'},...
%     {'J'},{'ZN'},{'Y'},{'RU'},{'L'},...
%     {'TA'},{'SR'}, ...
%     {'MA'},{'AL'},{'OI'},...
%     {'CU'}];


diretory = 'C:\D\future\分时数据\';
filename = [diretory, futureCode, '(1分钟)', '.csv'];

if exist(filename,'file')
else
    disp('文件不存在！');
    return;
end

dstruct = importdata(filename);
csvData = dstruct.data;
dt = dstruct.textdata;

dtStr = datestr(datenum(dt),'yyyy/mm/dd HH:MM');

% 写 csv 文件
fid = fopen(filename, 'wt');

for k = 1:size(dtStr,1)
    % dtStr(k,:)
    fprintf(fid, '%s,', dtStr(k,:));
    fprintf(fid, '%f,', csvData(k,1));
    fprintf(fid, '%f,', csvData(k,2));
    fprintf(fid, '%f,', csvData(k,3));
    fprintf(fid, '%f,', csvData(k,4));
    fprintf(fid, '%f,', csvData(k,5));
    fprintf(fid, '%f\n', csvData(k,6));
end
fclose(fid);
disp([filename,' 日期标准化成功！'])




















































































































































