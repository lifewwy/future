clc; clear; close all;
filename = 'E.dat';
%% 文件长度
fL = getFileLen(filename);

% 找到某个合约的第一条记录的位置，及记录长度。
% 首先假定知道合约先后顺序，及每个合约第一条记录的数据
ContratCode = 'SR';
x = ContractQueue;
[I,J] = find(strcmp(x,ContratCode),1);

startPos = 0;
for i = 1:I
    dt = x{i,2};
    df = x{i,3};
    % 某合约第一条记录的头位置(字节）
    pos = findRowInDAT(filename,dt,df,startPos); 
    % 获取该合约的记录数
    N = getNfromFirstRecord(filename,pos);
    startPos = N*56+pos;
end

% pos 修改记录数的位置
% N 原来的记录数
% startPos 插入记录的起始位置
y = [datenum('2018-08-20'),2,8,1,4,25602,35625;
    datenum('2018-08-21'),2,8,1,4,25602,35625;
    datenum('2018-08-22'),2,8,1,4,25602,35625;
    datenum('2018-08-23'),2,8,1,4,25602,35625];

status = InsertRecords(filename,y,pos,N,startPos);














