clear; clc; close all;

%% ������
folder = 'C:\D\xyz\future\�Ż���¼\';
filename = [folder '�Ż���¼���ײ��Բ����Ż�[SR1809 - 1����].csv'];

dstruct = importdata(filename);
display(dstruct.textdata(1,:));
data = dstruct.data;

%% ƽ������
param1 = data(:,1); param2 = data(:,2); param3 = data(:,3);
param1 = unique(param1);  param2 = unique(param2); param3 = unique(param3);

maxPara = [max(param1),max(param2),max(param1)];

% % ��ÿ��������N��,ÿ�ν�������Ϊalpha
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




























