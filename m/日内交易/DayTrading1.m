

%% 数据更新 

nCount = nCount+1 %#ok

[KLineDataTmp, ~] = urlread(url);

time = clock;    hour = time(4);
minute = time(5); second = time(6);

pos1 = [0, find( KLineDataTmp == ';')];

for i = 1:length(pos1)-1
    
    KLineData = KLineDataTmp(pos1(i)+1:pos1(i+1)-1);
    pos2 = find(KLineData==',');
    
%     o = str2double(KLineData(pos2(2)+1:pos2(3)-1));
%     h = str2double(KLineData(pos2(3)+1:pos2(4)-1));
%     l = str2double(KLineData(pos2(4)+1:pos2(5)-1));
    c = str2double(KLineData(pos2(8)+1:pos2(9)-1));
%     v = str2double(KLineData(pos2(14)+1:pos2(15)-1));
    
    RealTimeData(nCount,1) = datenum(date);    %#ok
    RealTimeData(nCount,2) = hour;             %#ok
    RealTimeData(nCount,3) = minute;           %#ok
    RealTimeData(nCount,4) = second;           %#ok
    
    RealTimeData(nCount,i+4) = c;              %#ok
end

RealTimeData(nCount,10)


% fprintf(2,'数据格式不符！\n');

% if nCount>5
%     stop(t);
% end

%% 数据分析
% len = 10;
% slop = zeros(1,M); % 数据拟合的斜率

% if nCount>=len
%     
%     Data = RealTimeData(nCount-len+1:nCount,5:M+4);
%     
%     for i = 1:M
%         p = polyfit((1:len)', Data(:,i)/Data(1,i), 1);
%         slop(i) = p(1);
%     end
%     
%     slop
% end










