% https://eodhistoricaldata.com/

% 具体见如下网页
% https://eodhistoricaldata.com/knowledgebase/api-for-historical-data-and-volumes/

% 5b58b853733183.22292691 该 token 一天能用 100000  次
% 付费用户 lifewwy  EOD Historical Data — US ONLY
token = '5b58b853733183.22292691';

% 数据存储目录
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = [fp(1:pp(end)),'eodhistoricaldata\'];

%% 数据文件存储
symbolName = 'MSFT';
url = ['https://eodhistoricaldata.com/api/eod/',symbolName,'.US?api_token=',...
    token,'&period=d'];
fileName = [directory,symbolName,'.US.csv'];
outfilename = websave(fileName,url);

if ~strcmp(fileName,outfilename)
    return;
end

dstrct = importdata(outfilename);
d = dstrct.data;
c = d(:,5); % Adjusted_close
o = d(:,1).*(d(:,5)./d(:,4)); % Adjusted_open
h = d(:,2).*(d(:,5)./d(:,4)); % Adjusted_high
l = d(:,3).*(d(:,5)./d(:,4)); % Adjusted_low
plot(c);

%% 写符合 TB 格式的 csv 文件
directory1 = [fp(1:pp(end)),'eodhistoricaldata\ForTB\'];
fileName = [directory1,symbolName,'.US.csv'];
fid = fopen(fileName, 'wt');

% h = roundn(h*1000,0);
% o = roundn(o*1000,0);
% l = roundn(l*1000,0);
% c = roundn(c*1000,0);

size_csvData = size(c);
% for i = 1:length(dstrct.textdata(1,:))
%     if i~= length(dstrct.textdata(1,:))
%         fprintf(fid, '%s,', dstrct.textdata{1,i});
%     else
%         fprintf(fid, '%s\n', dstrct.textdata{1,i});
%     end
% end

% 成交量可能超出int32的表示范围
% 将成交量按比例缩小
v = round(d(:,6)/max(d(:,6))*1e4);

for k = 1:size_csvData(1)
    fprintf(fid, '%s,', dstrct.textdata{k+1,1}(1:end-1));
    fprintf(fid, '%f,', o(k));
    fprintf(fid, '%f,', h(k));
    fprintf(fid, '%f,', l(k));
    fprintf(fid, '%f,', c(k));
    fprintf(fid, '%d,', v(k));
    fprintf(fid, '%d\n', v(k));
end
fclose(fid);
disp([fileName,' 更新成功！'])


%% 指定日期区间
startDate = datestr(today-50,'yyyy-mm-dd');
endDate = datestr(today,'yyyy-mm-dd');

url = ['https://eodhistoricaldata.com/api/eod/',...
    symbolName,'.US','?from=',startDate,'&to=',endDate,...
    '&api_token=',token,'&period=d'];

fileName = [directory,'tmp.csv'];
outfilename = websave(fileName,url);
if ~strcmp(fileName,outfilename)
    return;
end

d = importdata(outfilename);
%% 最后一天的收盘价
% url = ['https://eodhistoricaldata.com/api/eod/',...
%     'AAPL','.US?','api_token=',token,...
%     '&fmt=json&','filter=','last_close'];
























