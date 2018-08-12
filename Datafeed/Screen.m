clear; clc; close all;

%% 读数据
% 数据存储目录
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = [fp(1:pp(end)),'eodhistoricaldata\'];

listing = dir([directory,'*csv']);

% symbolName = 'CHA';
% symbolName = 'GOOG';
% symbolName = 'AAPL';
% symbolName = 'MSFT';

N = 800;
for i=1:length(listing)
    fileName = [directory,listing(i).name];
 
    dstruct = importdata(fileName);
    if isempty(dstruct)
        continue;
    end
    
    d = dstruct.data;
    
    L = min(N,length(d(:,1)));
    d = d(end-L+1:end,:);
    date = datenum(dstruct.textdata(end-L+1:end,:));
    
    c = d(:,5); % Adjusted_close
    o = d(:,1).*(d(:,5)./d(:,4)); % Adjusted_open
    h = d(:,2).*(d(:,5)./d(:,4)); % Adjusted_high
    l = d(:,3).*(d(:,5)./d(:,4)); % Adjusted_low
    
    
    plot(date,c);
    datetick('x','yyyy.mm.dd')
    ax=gca;
    ax.XTickLabelRotation = -30;
    grid on;
    
    title(listing(i).name);
end









