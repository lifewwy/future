clear all ; clc; close all;
%% ���ǻ۵����� 

filename = '��������.xls';
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    
    date1 = dstruct.textdata(3:end,1);
    data1 = dstruct.data;
end
Kdata1 = [datenum(date1) data1(:,1:4)];


filename = '����1503.xls';
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    
    date2 = dstruct.textdata(3:end,1);
    data2 = dstruct.data;
end
Kdata2 = [datenum(date2) data2(:,1:4)];

% �ҳ�������ͬ��λ��
[C,pos2,pos1] = intersect(Kdata1(:,1),Kdata2(:,1));
SameDatePos(:,1) = pos1;  SameDatePos(:,2) = pos2; 


















































