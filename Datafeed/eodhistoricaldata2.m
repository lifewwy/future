% https://eodhistoricaldata.com/

% �����������ҳ
% https://eodhistoricaldata.com/knowledgebase/api-for-historical-data-and-volumes/

% 5b58b853733183.22292691 �� token һ������ 100000  ��
% �����û� lifewwy  EOD Historical Data �� US ONLY
token = '5b58b853733183.22292691';

% ���ݴ洢Ŀ¼
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = [fp(1:pp(end)),'eodhistoricaldata\'];

%% �����ļ��洢
symbolName = 'BPI';
url = ['https://eodhistoricaldata.com/api/eod/',symbolName,'.US?api_token=',...
    token,'&period=d'];
fileName = [directory,symbolName,'.US.csv'];
outfilename = websave(fileName,url);

if ~strcmp(fileName,outfilename)
    return;
end

d = importdata(outfilename);
d = d.data;
c = d(:,5); % Adjusted_close
o = d(:,1).*(d(:,5)./d(:,4)); % Adjusted_open
h = d(:,2).*(d(:,5)./d(:,4)); % Adjusted_high
l = d(:,3).*(d(:,5)./d(:,4)); % Adjusted_low
plot(c);

%% ָ����������
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
%% ���һ������̼�
% url = ['https://eodhistoricaldata.com/api/eod/',...
%     'AAPL','.US?','api_token=',token,...
%     '&fmt=json&','filter=','last_close'];
























