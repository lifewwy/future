clear all ; clc;  close all;

%% 历史数据

futureCode = 'au';

t = ['1408'; '1409'; '1410'; '1411';'1412'; ...
    '1501'; '1502'; '1503'; '1504'; '1505'; '1506'; '1507'; '1508'; '1509'; '1510'; '1511'; '1512'; ...
    '1601'; '1602'; '1603'; '1604'; '1605'; '1606'; '1607'; '1608'; '1609'; '1610'; '1611'; '1612'];

% t1 = ['14'; '15'];
% t2 = ['01'; '02'; '03'; '04'; '05'; '06'; '07'; '08'; '09'; '10'; '11'; '12'];

sizet = size(t);
kData = [];
for nn = 1:sizet(1)
    
    clearvars -except nn futureCode t kData;
    
    url1 = 'http://stock2.finance.sina.com.cn/futures/api/json.php/IndexService.getInnerFuturesDailyKLine?symbol=';
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


%% 实时数据
clear all ; clc;  close all;

futureCode = 'AL';

t = ['1408'; '1409'; '1410'; '1411';'1412'; ...
    '1501'; '1502'; '1503'; '1504'; '1505'; '1506'; '1507'; '1508'; '1509'; '1510'; '1511'; '1512'; ...
    '1601'; '1602'; '1603'; '1604'; '1605'; '1606'; '1607'; '1608'; '1609'; '1610'; '1611'; '1612'];

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
        
        % KLineData(pos(17)+1:end) % 日期
        
        kData(nCount,:) = [datenum(KLineData(pos(17)+1:end)), o,h,l,c,v,str2double(t(k,:))];
        
    end
    
end































