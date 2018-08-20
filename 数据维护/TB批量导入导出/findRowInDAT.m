function pos = findRowInDAT(filename,dtstr,x,startPos)

% startPos 开始搜索的字节位置，从头搜索将其设为 0

% filename = 'E.dat';
% startPos = 0;
% clc; close all; clear;

% 2006/3/28	        40260	40262	40259	40261	40263	40264
% 2013/5/10	        20554	20556	20553	20555	20557	20558
% 2012/12/14	    20002	20004	20001	20003	20005	20006
% 2006/1/19         40002	40004	40001	40003	40005	40006

% dt = '2013-09-16';
% dt = getDatefromDATfile(dt);
% ohlc = [ 21082	21084	21081	21083 ]';
% v = [ 21085	21086]';   % int32 跳过4个字节

% dt = '2006-3-28';
% dt = getDatefromDATfile(dt);
% ohlc = [ 40260 40262 40259 40261 ]';
% v = [40263 40264]';  % int32 跳过4个字节

% dt = '2018/8/17';
% dt = getDatefromDATfile(dt);
% ohlc = [58320	58322	58319	58321]';
% v = [58323	58324]';  

% dt = '2012-12-14';
% dt = getDatefromDATfile(dt);
% ohlc = [20002	20004	20001	20003 ]';
% v = [ 20005	20006]';   % int32 跳过4个字节

% dt = '2006/1/19 ';
% dt = getDatefromDATfile(dt);
% ohlc = [40002	40004	40001	40003 ]';
% v = [ 40005	40006]';   % int32 跳过4个字节

% dtstr = '2012-12-14';
% dt = getDatefromDATfile(dt);
% x = [20002	20004	20001	20003 20005	20006]';


%% 找匹配行
pos = [];

dt = getDatefromDATfile(dtstr);
sx = size(x);
if sx(1)~= 6
    x = x'; % 将x变成列向量
end
    
ohlc = x(1:4);
v = x(5:6);

fid = fopen(filename, 'r');
fseek(fid,0,'eof');
len = ftell(fid);
fseek(fid,0,'bof');
nbytes = 12; 
for k = startPos:len-60
    
    fseek(fid, k, 'bof') ;
    
    dts = fread(fid,nbytes, 'uchar' );
    
    a = fread(fid,4,'double');
    
    b = fread(fid,1,'int32');
    fseek(fid,4,'cof');
    c = fread(fid,1,'int32');
    if isequal(a, ohlc)
        1;
    end
    
    if isequal(a, ohlc)&& ...
            isequal([b;c] , v)&&...
            isequal(dts(5:end),dt(5:end))
        pos = k;
        1;
        break;
    end
    
end
fclose(fid);

end











