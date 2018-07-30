clear; clc; close all;

% Êý¾Ý´æ´¢Ä¿Â¼
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = [fp(1:pp(end)),'eodhistoricaldata\'];

% symbolName = 'CHA';
% symbolName = 'GOOG';
% symbolName = 'AAPL';
symbolName = 'MSFT';
fileName = [directory,symbolName,'.US.csv'];
dstruct = importdata(fileName);
d = dstruct.data;
c = d(:,5); % Adjusted_close
o = d(:,1).*(d(:,5)./d(:,4)); % Adjusted_open
h = d(:,2).*(d(:,5)./d(:,4)); % Adjusted_high
l = d(:,3).*(d(:,5)./d(:,4)); % Adjusted_low
date = datenum(dstruct.textdata(2:end,:));

maxL = 2000;
M = min(maxL,length(c));
c = c(end-M+1:end);
date = date(end-M+1:end);


N = 400;
y = c(end-N+1:end);
x = (1:N)';
p = polyfit(x,y,1);
yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid/SStotal;
rsq_adj = 1 - SSresid/SStotal * (length(y)-1)/(length(y)-length(p)) %#ok

plot(date,c);
hold on; plot(date(end-N+1:end),yfit,'r');
datetick('x','yyyy.mm.dd')
ax=gca;
ax.XTickLabelRotation = -30;
grid on;




















