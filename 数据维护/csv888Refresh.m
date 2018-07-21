function csv888Refresh(futureCode)

% clear all ; clc;  close all;

%% 新浪期货数据 月份合约

% futureCode = 'CU';

% t = ['1408'; '1409'; '1410'; '1411';'1412'; ...
%     '1501'; '1502'; '1503'; '1504'; '1505'; '1506'; '1507'; '1508'; '1509'; '1510'; '1511'; '1512'; ...
%     '1601'; '1602'; '1603'; '1604'; '1605'; '1606'; '1607'; '1608'; '1609'; '1610'; '1611'; '1612'; ...
%     '1701'; '1702'; '1703'; '1704'; '1705'; '1706'; '1707'; '1708'; '1709'; '1710'; '1711'; '1712'];
% t = ['1706'; '1707'; '1708'; '1709'; '1710'; '1711'; '1712';'1801';'1802';'1803';'1804';'1805'; ...
%     '1806';'1807';'1808';'1809';'1810';'1811';'1812'];
% t = ['1806';'1807';'1808';'1809';'1810';'1811';'1812';'1901'];

t = datestr(now+(-30:30:10*30),'yymm');

% t1 = ['14'; '15'];
% t2 = ['01'; '02'; '03'; '04'; '05'; '06'; '07'; '08'; '09'; '10'; '11'; '12'];

sizet = size(t);
kData = [];
for nn = 1:sizet(1)
    
    clearvars -except nn futureCode t kData;
    
    if strcmp(futureCode , 'if')||strcmp(futureCode , 'IF')
        url1 = 'http://stock2.finance.sina.com.cn/futures/api/json.php/CffexFuturesService.getCffexFuturesDailyKLine?symbol=';
    else
        url1 = 'http://stock2.finance.sina.com.cn/futures/api/json.php/IndexService.getInnerFuturesDailyKLine?symbol=';
    end
    
    url = [url1, futureCode, t(nn,:)];
    
    [KLineData, ~] = urlread(url);
    pos = find(KLineData=='"');
    
    Data = zeros(length(pos)/2,1);
    for k = 1:2:length(pos)
        % char(KLineData(pos(i)+1:pos(i+1)-1))
        if mod(k,12) == 1 % date
            Data((k+1)/2) = datenum(char(KLineData(pos(k)+1:pos(k+1)-1)));
        else % price
            Data((k+1)/2) = str2num(char(KLineData(pos(k)+1:pos(k+1)-1))); %#ok
        end
        
    end
    
    kDatatmp = reshape(Data,6,[]);
    % o = kDatatmp(2,:); h = kDatatmp(3,:); l = kDatatmp(4,:); c = kDatatmp(5,:);
    
    kDatatmp = kDatatmp'; sizekData = size(kDatatmp);
    
    if isempty(kDatatmp)
        continue;
    else
        kDatatmp = [kDatatmp, repmat(str2double( t(nn,:) ),sizekData(1),1)]; %#ok
    end
    
    kData = [kData; kDatatmp]; %#ok
    
    
end

if isempty(kData)
    disp(['读 ',futureCode,' 数据失败！']);
    return;
end

kData = sortrows(kData);
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

% 需要补齐的日期
cdate = intersect( kData(:,1), csvData(end,1)+1 : datenum(date) );

if strcmp(futureCode , 'if')||strcmp(futureCode , 'IF')
    threshold = 1;
else
    threshold = 1.2;
end

if isempty(cdate)
    disp([filename,' 已经是最新文件！']);
else
    
    currentContract = csvData(end,end);
    
    for k = 1:length(cdate)
        
        pos1 = find( kData(:,1) == cdate(k));
        
        pos3 = find( kData(:,7) == currentContract);
        pos4 = intersect(pos1,pos3);
        
        % 不往回换合约
        pos1 = pos1(kData(pos1,7) >= currentContract);
        
        % 交易量最大值所在的行
        % [~,pos2] = max(kData(pos1,6));
        % pos = pos1(pos2);    
        
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
        
        deltaOpen = kData(pos,2) - kData(pos4,2);
        csvData(:,2:5) = csvData(:,2:5) + deltaOpen;          
        csvData =  [csvData ; kData(pos,:)]; %#ok
        
        % 打印换合约情况
        if csvData(end,end) ~= csvData(end-1,end)
            fprintf(2,[datestr(csvData(end,1),'yyyy-mm-dd'),': ', futureCode, num2str(csvData(end-1,end)), ' -> ', ...
                futureCode, num2str(csvData(end,end)),'\n']);
            contract1 = [futureCode, num2str(csvData(end-1,end))];
            contract2 = [futureCode, num2str(csvData(end,end))];
            GenCCorders(contract1,contract2);
        end
        
        currentContract = csvData(end,end);
        
    end
    
    
    % 写 csv 文件
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
    
    
end
















