function GenerateImportFile()

% clc;close all; clear;
fprintf('更新TB批量导入文件...！\n');

load headInfo
load exportOrder;
load dateAnd12bytes.mat;

fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end));
filename = [directory,'importToTB.dat'];

% 'w+'    open or create file for reading and writing; discard 
%         existing contents
fid = fopen(filename, 'w+');
for i=1:length(headInfo)  %#ok
    % i %#ok
    fwrite(fid,headInfo{i}, 'uchar' );
    d = readCSV(exportOrder{i}); %#ok
    [cc,ia,ib] = intersect(d(:,1),dateAnd12bytes(:,1)); %#ok
    sd = size(d);
    for k = 1:sd(1)
        dt = dateAnd12bytes(ib(k),2:end);
        if k==1
            fwrite(fid,sd(1), 'int32');
            fwrite(fid,dt(5:end), 'uchar');
        else         
            fwrite(fid,dt, 'uchar');
        end     
        fwrite(fid,d(k,2:5), 'double');
        fwrite(fid,d(k,6), 'int32');
        fwrite(fid,0, 'int32');
        fwrite(fid,d(k,7), 'int32');
    end
    
end
% 整个文件的末尾要添加4个字节
fwrite(fid,0,'int32');
fclose(fid);

fprintf('TB批量导入文件更新成功！\n');

% fid = fopen('export.dat','r');
% fseek(fid,0,'eof');
% ftell(fid) % 文件长度
% fclose(fid);
% fid = fopen('importToTB.dat','r');
% fseek(fid,0,'eof');
% ftell(fid) % 文件长度
% fclose(fid);




end





















