clear all ; clc; close all;

%% 新浪期货数据
% Code = ['CU0', 'RB0', 'AG0', 'AU0', 'CU0', 'AL0', 'ZN0', 'PB0', 'RU0' ,'A0', 'M0', 'Y0', ...
%     'J0', 'C0', 'L0', 'P0', 'V0', 'PVC', 'RS0', ...
%     'RM0', 'FG0', 'CF0', 'WS0', 'ER0', 'ME0', 'RO0'];

Code = 'CU0';

for k = 1:1
    
    url= ['http://stock2.finance.sina.com.cn/futures/api/json.php/IndexService.getInnerFuturesMiniKLine5m?symbol=',Code];
    KLineData = urlread(url);
    
    pos = find(KLineData=='"');
    
    Data = zeros(length(pos)/2,1);
    for i = 1:2:length(pos)
        t = char(KLineData(pos(i)+1:pos(i+1)-1));
        if mod(i,12)==1
            t1 = [t(3:4),t(6:7),t(9:10),t(12:13),t(15:16),t(18:19)];
            Data((i+1)/2) = str2double(t1);
            continue;
        end
        Data((i+1)/2) = str2double(t);
    end
    
    kData = reshape(Data,6,[]);
    kData = transpose(kData);
    kData = sortrows(kData);
    
%     % 金属 21:05 开盘，第二天 15:00 收盘；
%     OpenPos = zeros(1,5);
%     ClosePos = zeros(1,5);
%     nCount1 = 0;
%     nCount2 = 0;
%     for i = 1:length(kData)
%         DateTime = num2str(kData(i,1));
%         if (sum(DateTime(7:8) == '21')==2)&&(sum(DateTime(9:10) == '05')==2)
%             nCount1 = nCount1+1;
%             OpenPos(nCount1) = i;
%         end
%         if (sum(DateTime(7:8) == '15')==2)&&(sum(DateTime(9:10) == '00')==2)
%             k = i;
%             nCount2 = nCount2+1;
%             ClosePos(nCount2) = k;
%         end
%     end
    
    % filename = [Code,'-',date];
    % save(filename,'kData');
    
end



































