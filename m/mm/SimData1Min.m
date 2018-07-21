clear all ; clc; close all;

%% 1���������ݷ���
load ru888Data1MinFrom20121008To20140327Total335Days;

% ͬʱ��һ���൥�Ϳյ������ֱ����ú�ֹ���ֹӯ
% ���ֹ���ֹӯû�д�������������ʱƽ�֡�

a = 1e-4;  % ֹӯ
b = 0.1e-2;  % ֹ��

Nsim = 350;
profit = zeros(1,Nsim);
for index = 1:Nsim
    
    c = X(index,2:end);
    c0 = c(1); % ���̼ۣ����ּ۸�
    
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
    
    profit(index) = r1+r2;
    
end


% bar(c/c0); grid ; axis([1,length(c),0.99,1]);
% figure; plot(c/c0); 
figure; bar(profit);













