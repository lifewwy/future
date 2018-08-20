clear; clc; close all;
% 分析 TB 批量导出的dat文件格式
%% read csv file
futureCode = 'FG';
filename = [futureCode, '888.csv'];

if exist(filename,'file')
else
    return;
end

dstruct = importdata(filename);
% display(dstruct.textdata(1,:));
contractDate = datenum(dstruct.textdata);
csvData = dstruct.data;
csvData = [contractDate, csvData];

s = size(csvData);
nrows = s(1);
m = 10;
pos = zeros(1,m);
for i = 1:10
    dt = datestr(csvData(i,1));
    x = csvData(i,2:end);
    pos(i) = findRowInDAT('E.dat',dt,x,0);
end

pos %#ok
diff(pos)

% 每条数据记录占56个字节





 
 
