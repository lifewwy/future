clear; clc; close all;

symbolName = 'MSFT';
%% https://eodhistoricaldata.com/

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
url = ['https://eodhistoricaldata.com/api/eod/',symbolName,'.US?api_token=',...
    token,'&period=d'];
fileName = [directory,symbolName,'.US.csv'];
outfilename = websave(fileName,url);

if ~strcmp(fileName,outfilename)
    return;
end

dstruct = importdata(outfilename);
d = dstruct.data;
c = d(:,5); % Adjusted_close
o = d(:,1).*(d(:,5)./d(:,4)); % Adjusted_open
h = d(:,2).*(d(:,5)./d(:,4)); % Adjusted_high
l = d(:,3).*(d(:,5)./d(:,4)); % Adjusted_low
date = datenum(dstruct.textdata(2:end,:));

plot(date,c);
datetick('x','yyyy.mm.dd')
ax=gca;
ax.XTickLabelRotation = -30;
grid on;

%% д���� TB ��ʽ�� csv �ļ�
directory1 = [fp(1:pp(end)),'eodhistoricaldata\ForTB\'];
fileName = [directory1,symbolName,'.US.csv'];
fid = fopen(fileName, 'wt');

h = roundn(h*1000,0);
o = roundn(o*1000,0);
l = roundn(l*1000,0);
c = roundn(c*1000,0);

size_csvData = size(c);
for k = 1:size_csvData(1)
    fprintf(fid, '%s,', dstruct.textdata{k+1,1}(1:end-1));
    fprintf(fid, '%f,', o(k));
    fprintf(fid, '%f,', h(k));
    fprintf(fid, '%f,', l(k));
    fprintf(fid, '%f,', c(k));
    fprintf(fid, '%f\n', d(k,6));
end
fclose(fid);
disp([fileName,' ���³ɹ���'])


























