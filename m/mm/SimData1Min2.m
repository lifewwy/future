clear all ; clc; close all;
%% 1���������ݷ���
%% TB ��������
filename = 'ru888TB.csv';
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    date = datenum(dstruct.textdata(2:end,1));
    data = dstruct.data;
    data  = [date, data];
end

c = data(:,5);

% [FastMA,SlowMA] = movavg(c,20,50);

% plot(c); hold on;plot(FastMA,'r'); plot(SlowMA,'g');
%% TB 1��������
load ru888Data1MinFrom20121008To20140327Total335Days;

Nsim = 350;
SimResult = zeros(20,70);

[FastMA,SlowMA] = movavg(c,20,50);
profit = zeros(1,Nsim);

StopLoss = 1e-2;
StopProfit = 3e-2;

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
                % i
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
                % i
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

figure; bar(profit);
figure; hist(profit,10);












