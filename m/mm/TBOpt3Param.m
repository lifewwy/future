clear  ; clc; %close all;
folder = 'C:\D\future\优化记录\';
%% 读数据
clc;  clearvars -except folder

filename = [folder '优化记录[ta888 - 1日线]4.csv'];
if exist(filename,'file')
else
    break;
end

dstruct = importdata(filename);
display(dstruct.textdata(1,:));
data = dstruct.data;

data = sortrows(data);

ar = data(:,4)./data(:,8)./abs(data(:,31)); 

param1 = data(:,1); param2 = data(:,2); param3 = data(:,3); 
param1 = unique(param1);  param2 = unique(param2); param3 = unique(param3);

% profit = reshape(data(:,4),[],length(nn2),length(nn1));
ar = reshape(ar,[],length(param2),length(param1));
ind = Find3OptParamFunc(ar,4,8,8,.4);
[sub1,sub2,sub3] = ind2sub(size(ar),ind);
[param1(sub1),param2(sub2),param2(sub3)] %#ok

% profit = profit+abs(min(min(min(profit))));
% profit = uint8(profit*255/max(max(max(profit))));
% implay(profit);

































