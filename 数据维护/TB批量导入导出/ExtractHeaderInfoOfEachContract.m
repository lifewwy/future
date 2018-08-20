clc;close all; clear;

% 提取export.dat文件中每个合约的头信息

% 首先假定知道合约先后顺序，及每个合约第一条记录的数据
filename = 'export.dat';
load firstRecordOfContracts;
x = firstRecordOfContracts;

sx = size(x);
endPos = 0;
headInfo = cell(1,sx(1));
for i = 1:sx(1)
    dt = x{i,2};
    df = x{i,3};
    % 某合约第一条记录的头位置(字节）
    beginPos = findRowInDAT(filename,dt,df,endPos); 
    % 获取该合约的记录数
    N = getNfromFirstRecord(filename,beginPos);
    endPos = N*56+beginPos;
    
    if i==1
        sp = 0;
    end
    nbytes = beginPos-sp;

    headInfo(i) = {getHeaderInfo(sp,nbytes)};
 
    sp = endPos;
    
end

save headInfo headInfo












