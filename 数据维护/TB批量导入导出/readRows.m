function [dts,d] = readRows(filename, pos) 

% 从起始位置读一行

% filename = 'E - 副本.dat';
% pos = 248484;

nbytes = 12;

fid = fopen(filename, 'r');
fseek(fid, pos, 'bof') ;
dts = fread(fid,nbytes, 'uchar' );
a = fread(fid,4,'double');
b = fread(fid,1,'int32');
fseek(fid,4,'cof');
c = fread(fid,1,'int32');
fclose(fid);

d = [a;b;c];
    
