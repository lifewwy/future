function  [C,kData] = JoinQuantData(N,readOnlineDataFlg)
% clc; clear; close all; 

C = [];
kData = [];
%% 文件目录
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end));

directory1 = fp(1:pp(end-2));
directory1 = [directory1 'm\mCallPy'];
% C:\D\xyz\future\m\mCallPy\getJoinQuantData.m
addpath(directory1);

%% 读取 N 个交易日的数据，并存为csv文件
if readOnlineDataFlg == 1
    if nargin==0
        N = 3;
    end
    [status,result] = getJoinQuantData(N);
    if status==1 || isempty(strfind(result,'文件存储完成！'))
        return;
    end
end
%% 读取并处理数据
filenameOpen = [directory,'OPEN.csv'];
filenameHIGH = [directory,'HIGH.csv'];
filenameLOW = [directory,'LOW.csv'];
filenameCLOSE = [directory,'CLOSE.csv'];
filenameVOLUME = [directory,'VOLUME.csv'];

dstructOPEN = importdata(filenameOpen);
dstructHIGH = importdata(filenameHIGH);
dstructLOW = importdata(filenameLOW);
dstructCLOSE = importdata(filenameCLOSE);
dstructVOLUME = importdata(filenameVOLUME);

contracts = dstructOPEN.textdata(1,2:end);
ds = dstructOPEN.textdata(2:end,1);

o = dstructOPEN.data;
h = dstructHIGH.data;
l = dstructLOW.data;
c = dstructCLOSE.data;
v = dstructVOLUME.data;

s = size(o);
kDataTmp = zeros(s(1),s(2)*7);

Digits = extractDigits(contracts,length(ds));

kDataTmp(:,1:7:end) = repmat(datenum(ds),1,s(2));
kDataTmp(:,2:7:end) = o;
kDataTmp(:,3:7:end) = h;
kDataTmp(:,4:7:end) = l;
kDataTmp(:,5:7:end) = c;
kDataTmp(:,6:7:end) = v;
kDataTmp(:,7:7:end) = Digits;

[C,cn] = getFutureCode(contracts);
lenCN = length(cn);
kData = cell(1,lenCN);
for i = 1:lenCN
    if i == 1
        st = 1;
        ed = cn(1)*7;
    else
        st = sum(cn(1:i-1))*7+1;
        ed = sum(cn(1:i))*7;
    end
    bl = mat2cell(kDataTmp(:,st:ed),s(1), ...
        repmat(7,1,cn(i)));
    kData(i) = {sortrows(vertcat(bl{:}))};
end

% C %#ok

end







