clear all ; clc; close all;
%% 1���������ݷ���
%% TB ��������
filename = 'CF888TB.csv';
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    date = datenum(dstruct.textdata(2:end,1));
    data = dstruct.data;
    data  = [date, data];
end

cc = data(:,5);

% [FastMA,SlowMA] = movavg(c,20,50);

% plot(c); hold on;plot(FastMA,'r'); plot(SlowMA,'g');

%% ���ڲ����Է���

load CF888Data1MinFrom20120831To20140327Total376Days;

 X1 = X(:,2:end);
 X1 = X1';
 maxX1 = max(X1);
 minX1 = min(X1);
 
v = (maxX1-minX1)./X1(1,:)*100;

figure; plot(v);

mean(v)
std(v)
sum(v>1)/length(v)*100  %#ok


%% Ѱ�����Ų���

% load CF888Data1MinFrom20120831To20140327Total376Days;
% 
% Nsim = 350;
% SimResult = zeros(10,70);
% for N1 = 1:10
%     N1 %#ok
%     for N2 = 11:80
%         
%         
%         [FastMA,SlowMA] = movavg(cc,N1,N2);
%         profit = zeros(1,Nsim);
%         
%         StopLoss = 0.1e-2;
%         StopProfit = 0.5e-2;
%         for index = 2:Nsim
%             
%             c = X(index,2:end);
%             yestoday = X(index-1,1);
%             pos = find(date==yestoday);
%             
%             if FastMA(pos)>SlowMA(pos)
%                 % �൥
%                 c0 = c(1); % ���̼ۣ����ּ۸�
%                 peak = 0;
%                 
%                 for i = 1:length(c)
%                     if c(i)>peak
%                         peak = c(i);
%                     end
%                     
%                     if c0-c(i)>StopLoss*c0
%                         break;
%                     end
%                     
%                     if peak-c(i)>StopLoss*c0
%                         break;
%                     end
%                     
%                     if c(i)-X(index-1,end)>StopProfit*X(index-1,end)
%                         % i
%                         break;
%                     end
%                     
%                 end
%                 profit(index) = c(i)-c0;
%             else
%                 % �յ�
%                 c0 = c(1); % ���̼ۣ����ּ۸�
%                 bottom = 1e5;
%                 
%                 for i = 1:length(c)
%                     if c(i)<bottom
%                         bottom = c(i);
%                     end
%                     
%                     if c(i)-c0>StopLoss*c0
%                         break;
%                     end
%                     
%                     if c(i)-bottom>StopLoss*c0
%                         break;
%                     end
%                     
%                     if X(index-1,end)-c(i)>StopProfit*X(index-1,end)
%                         % i
%                         break;
%                     end
%                     
%                 end
%                 profit(index) = c0-c(i);
%             end
% 
%         end
%         
%         SimResult(N1,N2-10) = sum(profit);
%         
%     end
% end
% 
% surf(11:80, 1:10, SimResult); view(2); colorbar;

%% �������Ų���
close all; clc;

load CF888Data1MinFrom20120831To20140327Total376Days;

Nsim = 350;

[FastMA,SlowMA] = movavg(cc,2,60);
profit = zeros(1,Nsim);

StopLoss = 0.1e-2;
StopProfit = 0.5e-2;
for index = 2:Nsim
    
    c = X(index,2:end);
    yestoday = X(index-1,1);
    pos = find(date==yestoday);
    
    if FastMA(pos)>SlowMA(pos)
        % �൥
        c0 = c(1); % ���̼ۣ����ּ۸�
        peak = 0;
        
        for i = 1:length(c)
            if c(i)>peak
                peak = c(i);
            end
            
            if c0-c(i)>StopLoss*c0
                break;
            end
            
            if peak-c(i)>StopLoss*c0
                break;
            end
            
            if c(i)-X(index-1,end)>StopProfit*X(index-1,end)
                i %#ok
                break;
            end
            
        end
        profit(index) = c(i)-c0;
    else
        % �յ�
        c0 = c(1); % ���̼ۣ����ּ۸�
        bottom = 1e5;
        
        for i = 1:length(c)
            if c(i)<bottom
                bottom = c(i);
            end
            
            if c(i)-c0>StopLoss*c0
                break;
            end
            
            if c(i)-bottom>StopLoss*c0
                break;
            end
            
            if X(index-1,end)-c(i)>StopProfit*X(index-1,end)
                i %#ok
                break;
            end
            
        end
        profit(index) = c0-c(i);
    end
    
end


% ʤ��
vr = sum(profit>0)/Nsim %#ok

% ƽ�� R����
er = sum(profit)/Nsim/(-sum(profit(profit<0))/sum(profit<0)) %#ok

% ������
TotalProfit = sum(profit);

figure; subplot(2,2,1); bar(profit);
subplot(2,2,2); hist(profit,20); axis tight;

subplot(2,2,3); plot(cumsum(profit)); grid; 
title('�ʽ�����');

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














