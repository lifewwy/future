function kData = SinaData(futureCode)

%% 新浪期货数据 月份合约

if nargin==0
    futureCode = 'CU';
end

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
kData = unique(kData,'rows');



















