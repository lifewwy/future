clear; clc; close all;


%% 获得股票代码列表
d = importdata('NASDAQ.csv');
NASDAQ = cell(length(d)-1,2);
for i = 2:length(d)
    s = d{i};
    p = strfind(s,'"');
    NASDAQ(i-1,1) = {s(p(1)+1:p(2)-1)};
    NASDAQ(i-1,2) = {s(p(3)+1:p(4)-1)};
end

save('NASDAQ.mat','NASDAQ');












