function csv888RefreshOneDay(futureCode,handles,fc,kDataJoinQuant)


% clear all ; clc;  close all;

% futureCode = 'CU';

% t = ['1408'; '1409'; '1410'; '1411';'1412'; ...
%     '1501'; '1502'; '1503'; '1504'; '1505'; '1506'; '1507'; '1508'; '1509'; '1510'; '1511'; '1512'; ...
%     '1601'; '1602'; '1603'; '1604'; '1605'; '1606'; '1607'; '1608'; '1609'; '1610'; '1611'; '1612'; ...
%     '1701'; '1702'; '1703'; '1704'; '1705'; '1706'; '1707'; '1708'; '1709'; '1710'; '1711'; '1712'];
% t = ['1706'; '1707'; '1708'; '1709'; '1710'; '1711'; '1712';'1801';'1802';'1803';'1804';'1805'; ...
%     '1806';'1807';'1808';'1809';'1810';'1811';'1812'];

t = datestr(now+(-30:30:10*30),'yymm');

sizet = size(t);
kData = zeros(sizet(1),7);
nCount = 0;
for k = 1:sizet(1)
    
    url = ['http://hq.sinajs.cn/list=', futureCode, t(k,:)];
    
    [KLineData, ~] = urlread(url);
    
    pos = find(KLineData == '"');
    KLineData = KLineData(pos(1)+1:pos(2)-1);
    pos = find(KLineData == ',');
    
    if ~isempty(pos)
        nCount = nCount+1;
        
        o = str2double(KLineData(pos(2)+1:pos(3)-1));
        h = str2double(KLineData(pos(3)+1:pos(4)-1));
        l = str2double(KLineData(pos(4)+1:pos(5)-1));
        c = str2double(KLineData(pos(8)+1:pos(9)-1));
        v = str2double(KLineData(pos(14)+1:pos(15)-1));
        
        % KLineData(pos(17)+1:pos(18)-1) % 日期
        kData(nCount,:) = [datenum(KLineData(pos(17)+1:pos(18)-1)), o,h,l,c,v,str2double(t(k,:))];
        
    end
    
end

kData = kData(1:nCount,:);

if nCount==0
    display(['读 ',futureCode,' 数据失败！']);
    return;
end

kData = unique(kData,'rows');


%% 读 CSV 文件
% directory = 'C:\D\future\数据维护\';
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end));

filename = [directory,futureCode, '888.csv'];

if exist(filename,'file')
else
    return;
end

dstruct = importdata(filename);
% display(dstruct.textdata(1,:));
contractDate = datenum(dstruct.textdata);
csvData = dstruct.data;
csvData = [contractDate, csvData];
%% 数据更新维护

% csv 文件已经最新，不用再更新
if csvData(end,1) == datenum(date)
    disp([filename,' 已经是最新文件！'])
%     return;
end


url = ['http://hq.sinajs.cn/list=', futureCode, num2str(csvData(end,end))];
[KLineData, ~] = urlread(url);

pos = find(KLineData == '"');
KLineData = KLineData(pos(1)+1:pos(2)-1);
pos = find(KLineData == ',');

if ~isempty(pos)
    
    o = str2double(KLineData(pos(2)+1:pos(3)-1));
    h = str2double(KLineData(pos(3)+1:pos(4)-1));
    l = str2double(KLineData(pos(4)+1:pos(5)-1));
    c = str2double(KLineData(pos(8)+1:pos(9)-1));
    v = str2double(KLineData(pos(14)+1:pos(15)-1));
    
    kDataTmp = [datenum(KLineData(pos(17)+1:pos(18)-1)), o,h,l,c,v,csvData(end,end)];
    
end


% 需要补齐的日期
cdate = datenum(date);  
pos1 = find( kData(:,1) == cdate);

% 不往回换合约
currentContract = csvData(end,end);
pos1 = pos1(kData(pos1,7) >= currentContract);

% % 交易量最大值所在的行
% [~,pos2] = max(kData(pos1,6));
% pos = pos1(pos2);   

threshold = 1.2;
[~,ndx] = dsort(kData(pos1,6));
pos3 = find(kData(pos1,end)==currentContract);
if isempty(pos3)
    fprintf(2,[futureCode,' : 数据错误！\n']);
    return;
end
if (kData(pos1(ndx(1)),end) ~= currentContract) && ...
        (kData(pos1(ndx(1)),6)/kData(pos1(pos3),6) > threshold)
    pos = pos1(ndx(1));
else
    pos = pos1(pos3);
end


asdf = max(abs(kData(pos,2:5) - csvData(end,2:5))) / csvData(end,2);
if (asdf>.5)
    fprintf(2,[futureCode,' : 数据错误！\n']);
    return;
end

deltaOpen = kData(pos,2) - kDataTmp(2);
csvData(:,2:5) = csvData(:,2:5) + deltaOpen;
csvData =  [csvData ; kData(pos,:)];

%% 比较 Sina Data 和 JoinQuant Data 20180905

if ~isempty(fc)
    commonData = intersect(kDataJoinQuant{strcmp(fc,futureCode)},kData(pos,:),'rows');
    if isempty(commonData)
        fprintf(2,'数据源冲突!\n');
    end
end

%% 写 csv 文件
% directory = 'C:\D\future\数据维护\';
fid = fopen([[directory,futureCode,'888'], '.csv'], 'wt');

size_csvData = size(csvData);
for k = 1:size_csvData(1)
    fprintf(fid, '%s,', datestr(csvData(k,1),'yyyy-mm-dd'));
    fprintf(fid, '%f,', csvData(k,2));
    fprintf(fid, '%f,', csvData(k,3));
    fprintf(fid, '%f,', csvData(k,4));
    fprintf(fid, '%f,', csvData(k,5));
    fprintf(fid, '%f,', csvData(k,6));
    fprintf(fid, '%f\n', csvData(k,7));
end
fclose(fid);
disp([filename,' 更新成功！'])

%% 打印换合约情况
if csvData(end,end) ~= csvData(end-1,end)
    fprintf(2,[datestr(csvData(end,1),'yyyy-mm-dd'),': ', futureCode, num2str(csvData(end-1,end)), ' -> ', ...
        futureCode, num2str(csvData(end,end)),'\n']);
    contract1 = [futureCode, num2str(csvData(end-1,end))];
    contract2 = [futureCode, num2str(csvData(end,end))];
    GenCCorders(contract1,contract2,handles);
end
















