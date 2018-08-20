function result = getDatefromDATfile(dt)

% clear; clc; close;
result = [];

if nargin==0
    dt = '2013-09-16';
end

% n1 = 730489;
n1 = datenum(dt);
n2 = (n1-1)*2;
[format1,~,p1,c1] = findnum(n1,'date.dat');
if n1 ~= c1
    return;
end

[format2,~,p2,c2] = findnum(n2,'date.dat');
if n2 ~= c2
    return;
end

% disp(format1);
% disp(p1);
% disp(format2);
% disp(p2);

%% 日期和时间占12个字节 
fid = fopen('date.dat', 'r');
fseek(fid, p2, 'bof') ;
c3 = fread(fid,1,format2);
nbytes = p1 - ftell(fid);
% fclose(fid);
if c3==c2
    c4 = fread(fid,nbytes, 'uchar' );
    c5 = fread(fid,1,format1);
    if c5==c1
        result = c4; 
    end
end
fclose(fid);

end









