clear; clc; close all;

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
display(dstruct.textdata(1,:));
data = dstruct.data;
%% montage
% data = sortrows(data);
% 
% ar = data(:,4)./data(:,8)./abs(data(:,31)); 
% 
% param1 = data(:,1); param2 = data(:,2); param3 = data(:,3); 
% param1 = unique(param1);  param2 = unique(param2); param3 = unique(param3);
% 
% profit = reshape(data(:,4),[],length(param2),length(param1));
% ar = reshape(ar,[],length(param2),length(param1));
% 
% sizeX = size(ar);
% x = zeros(sizeX(1),sizeX(2),1,sizeX(3));
% for i=1:sizeX(3)
%     x(:,:,1,i) = ar(:,:,i);
% end
% 
% montage(x);
%% 平行坐标
% data = data(data(:,4)>max(data(:,4))*0.5,:);

% data = sortrows(data);
% x = data(1:2000,1:4);

param1 = data(:,1); param2 = data(:,2); param3 = data(:,3);
param1 = unique(param1);  param2 = unique(param2); param3 = unique(param3);

% % 将每个参数分N段,每段交叠比例为alpha
N = 6; alpha = 0.2;
param1 = ParaSegment(param1,N,alpha);
param2 = ParaSegment(param2,N,alpha);
param3 = ParaSegment(param3,N,alpha);

s1 = size(param1);s2 = size(param2);s3 = size(param3);
threshold = 0.5;
for i = 1:s1(2)
    for j = 1:s2(2)
        for k=1:s3(2)
            pp = allcombs(param1(:,i)',param2(:,j)',nonzeros(param3(:,k)'));
            [meanProfit,varProfit] = parallelCoordinates(data,pp,threshold) %#ok
            if meanProfit>=threshold
                1 %#ok
            end
            % close all;
        end
    end
end




























