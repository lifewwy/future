
futureCode = 'SR';
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
%% 写 csv 文件
fid = fopen([[futureCode,'888abc'], '.csv'], 'wt');

size_csvData = size(csvData);
for k = 1:size_csvData(1)+5000
    if k>size_csvData(1)
        dn = csvData(end,1)+k-size_csvData(1);
    else
        dn = csvData(k,1);
    end
    x = ((k-1)*6+1:k*6)+7e4;
    fprintf(fid, '%s,', datestr(dn,'yyyy-mm-dd'));
    fprintf(fid, '%f,', x(2));
    fprintf(fid, '%f,', x(4));
    fprintf(fid, '%f,', x(1));
    fprintf(fid, '%f,', x(3));
    fprintf(fid, '%f,', x(5));
    fprintf(fid, '%f\n', x(6));
end
fclose(fid);
disp([filename,' 更新成功！'])

%% c,h,l,o 都等于 datenum
filename = ['date', '.csv'];
fid = fopen(filename, 'wt');
startDate = datenum('1990-01-01');
for k = 0:2e4
    
    fprintf(fid, '%s,', datestr(startDate+k,'yyyy-mm-dd'));
    fprintf(fid, '%f,', startDate+k);
    fprintf(fid, '%f,', 0);
    fprintf(fid, '%f,', 0);
    fprintf(fid, '%f,', 0);
    fprintf(fid, '%f,', 0);
    fprintf(fid, '%f\n', (startDate+k)*2);
end
fclose(fid);
disp([filename,' 更新成功！'])

