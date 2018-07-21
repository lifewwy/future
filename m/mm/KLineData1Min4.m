clear all ; clc; close all;
% folder = 'D:\future\';
%% 1分钟线数据

filename = [[],'ag888（1分钟线）.csv']; 
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    c = data(:,4);  volume = data(:,5);
    DateAndTime =  dstruct.textdata(2:end,1);
end

OpenPos = zeros(1,5e2);
ClosePos = zeros(1,5e2);
nCount1 = 0;
nCount2 = 0;
 h = waitbar(0,'Please wait...');
 N = length(data);
for i = 1:N
    dv = datevec(DateAndTime(i));
    if (dv(4)==9)&&(dv(5)==0)
         nCount1 = nCount1+1;
         OpenPos(nCount1) = i;
    end
    if (dv(4)==14)&&(dv(5)==59)
         nCount2 = nCount2+1;
         ClosePos(nCount2) = i;
    end
    waitbar(i/N,h);
end
close(h) 

X = zeros(nCount1,225);
nCount = 0;
for i = 1:nCount1
    op = OpenPos(i);
    if ~isempty(find(ClosePos,op+224,'first'))
        if op+224<=length(c)
            nCount = nCount+1;
            X(nCount,:) = c(op:op+224)';
            % settlementPrice = c(op:op+224)'*volume(op:op+224)/sum(volume(op:op+224));
            % X(nCount,226) = settlementPrice;
        end
    end
end

X = X(1:nCount,:);

DT = DateAndTime(OpenPos(1:nCount));
DT = datevec(DT);
DT(:,4) = 0;

X = [datenum(DT) , X];

save ag888Data1MinTotal147Days X;
















