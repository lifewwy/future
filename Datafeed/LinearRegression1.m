clear; clc; close all;

load count.dat
x = count(:,1);
y = count(:,2);

p = polyfit(x,y,1);
yfit = polyval(p,x);
yresid = y - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid/SStotal %#ok
rsq_adj = 1 - SSresid/SStotal * (length(y)-1)/(length(y)-length(p)) %#ok


















