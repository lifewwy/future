clear; clc; close all;
% ���� TB ����������dat�ļ���ʽ
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

% ÿ�����ݼ�¼ռ56���ֽ�





 
 
