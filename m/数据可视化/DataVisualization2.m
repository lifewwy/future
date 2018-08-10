clear; clc; close all;
% 3个参数

%% montage
% load mri
% % Display as montage.
% montage(D,map)
% 
% figure
% montage(D, map, 'Indices', 1:9);
%% montage
% x = rand(100,100,1,16);
% montage(x);

%% 读数据
folder = 'C:\D\xyz\future\优化记录\';
filename = [folder '优化记录交易策略参数优化[SR1809 - 1日线].csv'];

dstruct = importdata(filename);
td = dstruct.textdata(1,:);
display(td);
data = dstruct.data;
%% montage
data = sortrows(data);

R = 255;

ar = data(:,4)./data(:,8)./abs(data(:,31)); 

profit = data(:,4)/max(data(:,4))*R;
% profit = profit-min(profit); % 最小值变为 0
% profit = profit/max(profit);

plot(profit);


param1 = data(:,1); param2 = data(:,2); param3 = data(:,3); 
param1 = unique(param1);  param2 = unique(param2); param3 = unique(param3);

profit1 = reshape(profit,[],length(param2),length(param1));
% ar = reshape(ar,[],length(param2),length(param1));

mind = profit1;

sizeX = size(mind);
N = 1;
x = zeros(sizeX(1)+2*N,sizeX(2)+2*N,1,sizeX(3));
for i=1:sizeX(3)
    x(N+1:sizeX(1)+N,N+1:sizeX(2)+N,1,i) = mind(:,:,i);
end

montage(x,jet(R));
colorbar;

xlabel([td{3},'  ',num2str(param2(1)),'~',num2str(param2(end))]);
ylabel([td{4},'  ',num2str(param3(1)),'~',num2str(param3(end))]);
title([td{2},'  ',num2str(param1(1)),'~',num2str(param1(end))]);



























