function NormalizeData(futureCode)

% clear; clc; close all

fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end-1));

if nargin == 0
    futureCode = 'RU';
end

filename = [directory,futureCode,'888' ,'.csv'];

%% 读数据
if exist(filename,'file')
    DataStruct = importdata(filename);
    data = DataStruct.data;
    
    o = data(:,1); h = data(:,2);
    l = data(:,3); c = data(:,4);
else
    return;
end

% figure; candle(h, l, c, o)
barDate = DataStruct.textdata;

%% 处理数据

N = max(h);

c1 = cumsum([c(1); diff(c)./c(1:end-1)*N]);

h1 = (h-c)./c*N+c1;
l1 = (l-c)./c*N+c1;
o1 = (o-c)./c*N+c1;

delta = c1(end)-c(end);
c1 = c1-delta; h1 = h1-delta; l1 = l1-delta; o1 = o1-delta;

minV = min([c1;h1;l1;o1]);
c1 = c1-minV+500; h1 = h1-minV+500;
l1 = l1-minV+500; o1 = o1-minV+500;

candle(h1,l1,c1,o1); hold on; candle(h,l,c,o,'r');

grid on;

%% 重新生成数据文件
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end));

filename = [[directory,[futureCode,'888','B']], '.csv'];
fid = fopen(filename, 'wt');

contractDate = datenum(barDate);
csvData = [contractDate, o1,h1,l1,c1,data(:,5),data(:,6)];

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



















