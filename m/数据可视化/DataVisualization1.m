clear; clc; close all;

%% 读数据
folder = 'C:\D\xyz\future\优化记录\';
filename = [folder '优化记录交易策略参数优化[SR1809 - 1日线].csv'];

dstruct = importdata(filename);
display(dstruct.textdata(1,:));
data = dstruct.data;

%% 平行坐标
param1 = data(:,1); param2 = data(:,2); param3 = data(:,3);
param1 = unique(param1);  param2 = unique(param2); param3 = unique(param3);

maxPara = [max(param1),max(param2),max(param3)];

% % 将每个参数分N段,每段交叠比例为alpha
N = 6;
alpha = 0.2;
param1 = ParaSegment(param1,N,alpha);
param2 = ParaSegment(param2,N,alpha);
param3 = ParaSegment(param3,N,alpha);

s1 = size(param1);s2 = size(param2);s3 = size(param3);
threshold = 0.55;
for i = 1:s1(2)
    for j = 1:s2(2)
        for k=1:s3(2)
            pp = allcombs(nonzeros(param1(:,i)'),nonzeros(param2(:,j)'),nonzeros(param3(:,k)'));
            [meanProfit,varProfit] = parallelCoordinates(data,pp,threshold,maxPara) %#ok
            if meanProfit>=threshold
                1 %#ok
            end
            % close all;
        end
    end
end




























