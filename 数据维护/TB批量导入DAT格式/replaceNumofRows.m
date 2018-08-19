function status = replaceNumofRows(filename,pos,...
    originalNumofRows,NumofRowsToSet,format)

status = 1; % success 0 fail 1

% pos = 180;
% nbytes = 4;
% d = 1377;
% d1 = 1378;
% format = 'int32';
% filename = 'E.dat';

d = originalNumofRows;
d1 = NumofRowsToSet;

fid = fopen(filename, 'r');
dt1 = fread(fid,pos, 'uchar' );
dt = fread(fid,1,format);
dt2 = fread(fid, 'uchar' );
fclose(fid);

% 'w+'    open or create file for reading and writing; discard 
%          existing contents
if d==dt
    fid = fopen(filename, 'w+');
    fwrite(fid,dt1, 'uchar' );
    fwrite(fid,d1,format);
    fwrite(fid,dt2, 'uchar' );
    fclose(fid);   
    status = 0;
end












