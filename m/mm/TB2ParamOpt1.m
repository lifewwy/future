clear all ; clc; close all;
folder = 'C:\D\future\�Ż���¼\';
%% ������
clc;  clearvars -except folder

filename = [folder '�Ż���¼[a1501 - 1����]1.csv'];
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    data1 = sortrows(data);
    
else
    break;
end


filename = [folder '�Ż���¼[a1501 - 1����]2.csv'];
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    data2 = sortrows(data);
    
else
    break;
end



%% ���� TB ��������

param1 = data1(:,1); param2 = data1(:,2);
param1 = unique(param1);  param2 = unique(param2);

if sum(abs(data1(:,1)-data2(:,1))) + ...
        sum(abs(data1(:,2)-data2(:,2))) == 0
    
    profit = data1(:,3) + data2(:,3);
end

profit = reshape(profit/1e8,[],length(param1));

%% ��ͼ

figure; surf(param1,param2,profit);view(2); axis tight;



































