clear all ; clc; close all;
%% 1���������ݷ���

load cu888Data1MinTotal289Days;

c = X(12,2:end);

[a,b] = macd(c);

figure; myplotyy([a',b',zeros(225,1)],c'); 

% % ʤ��
% vr = sum(profit>0)/Nsim %#ok
% 
% % ƽ�� R����
% er = sum(profit)/Nsim/(-sum(profit(profit<0))/sum(profit<0)) %#ok
% 
% % ������
% TotalProfit = sum(profit);
% 
% figure; subplot(2,2,1); bar(profit);
% subplot(2,2,2); hist(profit,20); axis tight;
% 
% subplot(2,2,3); plot(cumsum(profit)); grid; 
% title('�ʽ�����');

%% ���ʷֲ�����

% clearvars -except profit; 
% 
% mu = mean(profit);
% sigma = var(profit);
% 
% 
% pd1 = makedist( 'normal',0,0.3);
% pd2 = truncate( pd1, -0.4, 1 );
% 
% x = -0.4:0.1:1;
% pdf = pdf( pd2, x);
% 
% subplot(2,2,4); plot(x,pdf-0.4); 














