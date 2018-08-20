function status = InsertRecords(filename,y,pos,N,startPos)
% pos 修改记录数的位置
% N 原来的记录数
% startPos 插入记录的起始位置

% y = [datenum('2018-08-20'),2,8,1,4,25602,35625;
%     datenum('2018-08-21'),2,8,1,4,25602,35625;
%     datenum('2018-08-22'),2,8,1,4,25602,35625];

% filename = 'E.dat';

sy = size(y);

fid = fopen(filename,'r');
d1 = fread(fid,startPos,'uchar');
ftell(fid)
d2 = fread(fid,'uchar');
fclose(fid);

docPos = strfind(filename,'.');
filename1 = [filename(1:docPos-1),'1','.dat'];

fid = fopen(filename1, 'w+');
fwrite(fid,d1, 'uchar' );

for i=1:sy(1)
    dt = datestr(y(i,1));
    dt = getDatefromDATfile(dt);
    fwrite(fid,dt, 'uchar');
    fwrite(fid,y(i,2:5), 'double');
    fwrite(fid,y(i,6), 'int32');
    fwrite(fid,0, 'int32');
    fwrite(fid,y(i,7), 'int32');
end

fwrite(fid,d2, 'uchar' );
fclose(fid);

status = replaceNumofRows(filename1,pos,...
    N,N+sy(1),'int32');











