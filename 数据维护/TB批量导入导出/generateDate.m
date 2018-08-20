
clear; clc; close;
% 1990/1/1	726834	0	0	0	0	1453668
% 1990/1/2	726835	0	0	0	0	1453670

% 找到第某一行数据的位置
dt = '1990/1/2';
df = [726835	0	0	0	0	1453670];
pos = findRowInDAT('date.dat',dt,df,0); 
dss = zeros(2e4,13);
for i = 1:2e4
    [dts,~] = readRows('date.dat', pos+(i-1)*56) ;
    dss(i,2:end) = dts;
end

dstruct = importdata('date.csv');
% display(dstruct.textdata(1,:));
contractDate = datenum(dstruct.textdata);
pos1 = find(contractDate==datenum(dt));

dss(:,1) = contractDate(pos1:end);

dateAnd12bytes = dss;

save dateAnd12bytes dateAnd12bytes;









