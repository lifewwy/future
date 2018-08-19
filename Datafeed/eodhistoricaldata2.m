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

%% д���� TB ��ʽ�� csv �ļ�
directory1 = [fp(1:pp(end)),'eodhistoricaldata\ForTB\'];
fileName = [directory1,symbolName,'.US.csv'];
fid = fopen(fileName, 'wt');

% h = roundn(h*1000,0);
% o = roundn(o*1000,0);
% l = roundn(l*1000,0);
% c = roundn(c*1000,0);

size_csvData = size(c);
for i = 1:length(dstrct.textdata(1,:))
    if i~= length(dstrct.textdata(1,:))
        fprintf(fid, '%s,', dstrct.textdata{1,i});
    else
        fprintf(fid, '%s\n', dstrct.textdata{1,i});
    end
end

for k = 1:size_csvData(1)
    fprintf(fid, '%s,', dstrct.textdata{k+1,1}(1:end-1));
    fprintf(fid, '%f,', o(k));
    fprintf(fid, '%f,', h(k));
    fprintf(fid, '%f,', l(k));
    fprintf(fid, '%f,', c(k));
    fprintf(fid, '%f,', c(k));
    fprintf(fid, '%d\n', d(k,6));
end
fclose(fid);
disp([fileName,' ���³ɹ���'])

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
























