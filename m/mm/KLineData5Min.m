clear all ; clc; close all;
folder = 'D:\future\Data5Min\';
%% 5���������ݷ���


filename = [folder,'����20140321��5Min��.csv'];
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    c = data(:,4);
end

% ͬʱ��һ���൥�Ϳյ������ֱ����ú�ֹ���ֹӯ
% ���ֹ���ֹӯû�д�������������ʱƽ�֡�

c0 = c(1); % ���̼ۣ����ּ۸�
a = 4e-3;  % ֹӯ
b = 2e-3;  % ֹ��

% �൥
for i = 1:length(c)
    % ���ú�ֹ���ֹӯ
    if (c(i)-c0>c0*a)||(c0-c(i)>c0*b)
        break;
    end
end
r1 = c(i)-c0;

% �յ�
for k = 1:length(c)
    % ���ú�ֹ���ֹӯ
    if (c0-c(k)>c0*a)||(c(k)-c0>c0*b)
        break;
    end
end
r2 = c0-c(k);

r = r1+r2 %#ok


% bar(c/c0); grid ; axis([1,length(c),0.99,1]);
figure; plot(c/c0);













