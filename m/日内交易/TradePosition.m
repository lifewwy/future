function [ TradePos ] = ...
    TradePosition( LongEntryPos, ShortEntryPos,...
    LongExitPos,ShortExitPos, prioFlg,plotFlg)
% flg: 0, 出入场独立
%      1, 入场优先
%      2，出场优先

% flg = 0;

% LongEntryPos, ShortEntryPos,LongExitPos,ShortExitPos
% 必须都按从小到大的顺序

if ~( issorted(LongEntryPos) && issorted(ShortEntryPos)...
        && issorted(LongExitPos) && issorted(ShortExitPos) )
    
    TradePos = [];
    disp('issorted  没通过！');
    return;
    
end

%% 多头
TradePos1 = zeros(length(LongEntryPos),3);
for i = 1:length(LongEntryPos)
    a = LongEntryPos(i);
    b = LongExitPos( find(LongExitPos > a ,1 ) );
    TradePos1(i,1) = 1;
    TradePos1(i,2:3) = [a,b];
end
TradePos1 = TradePos1(1:i,:);

%% 空头
TradePos2 = zeros(length(ShortEntryPos),3);
for i = 1:length(ShortEntryPos)
    a = ShortEntryPos(i);
    b = ShortExitPos( find(ShortExitPos > a ,1 ) );
    TradePos2(i,1) = -1;
    TradePos2(i,2:3) = [a,b];
end
TradePos2 = TradePos2(1:i,:);

%% 合并

TradePosTmp = [TradePos1; TradePos2];
TradePosTmp = sortrows(TradePosTmp,2);
    
%% 出场优先
if prioFlg == 2

    TradePos = zeros(size(TradePosTmp));
    nCount = 1;
    TradePos(1,:) = TradePosTmp(1,:);
    p = zeros(size(TradePosTmp,1),1);
    p(1) = 1;
    for i = 2:size(TradePosTmp,1)
        if TradePosTmp(i,2)-TradePos(nCount,3)>=0
            nCount = nCount+1;
            TradePos(nCount,:) = TradePosTmp(i,:);
            p(nCount) = i;
        end
    end
    TradePos = TradePos(1:nCount,:);
    p = p(1:nCount);
end

%% 入场优先
if prioFlg == 1

    TradePos = zeros(size(TradePosTmp));
    nCount = 1;
    TradePos(1,:) = TradePosTmp(1,:);
    p = zeros(size(TradePosTmp,1),1);
    p(1) = 1;
    for i = 2:size(TradePosTmp,1)
        if (abs(TradePosTmp(i,1)-TradePos(nCount,1)) == 2)
            if  (TradePos(nCount,3) > TradePosTmp(i,2))
                TradePos(nCount,3) = TradePosTmp(i,2);
            end
            nCount = nCount+1;
            TradePos(nCount,:) = TradePosTmp(i,:);
            p(nCount) = i;
        else
            if TradePosTmp(i,2)-TradePos(nCount,3)>=0
                nCount = nCount+1;
                TradePos(nCount,:) = TradePosTmp(i,:);
                p(nCount) = i;
            end
        end
        
    end
    TradePos = TradePos(1:nCount,:);
    p = p(1:nCount);
end
%% 出入场独立
if prioFlg == 0
    
    a1 = find(TradePosTmp == 1);
    a2 = find(TradePosTmp == -1);
   
    % 多头
    tp1 = zeros(size(TradePos1));
    nCount = 1;
    tp1(1,:) = TradePos1(1,:);
    p1 = zeros(size(TradePos1,1),1);
    p1(1) = a1(1);
    for i = 2:size(TradePos1,1)
        if (abs(TradePos1(i,1)-tp1(nCount,1)) == 2)
            if  (tp1(nCount,3) > TradePos1(i,2))
                tp1(nCount,3) = TradePos1(i,2);
            end
            nCount = nCount+1;
            tp1(nCount,:) = TradePos1(i,:);
            p1(nCount) = a1(i);
        else
            if TradePos1(i,2)-tp1(nCount,3)>=0
                nCount = nCount+1;
                tp1(nCount,:) = TradePos1(i,:);
                p1(nCount) = a1(i);
            end
        end
        
    end
    tp1 = tp1(1:nCount,:);
    p1 = p1(1:nCount);
    
    % 空头
    tp2 = zeros(size(TradePos2));
    nCount = 1;
    tp2(1,:) = TradePos2(1,:);
    p2 = zeros(size(TradePos2,1),1);
    p2(1) = a2(1);
    for i = 2:size(TradePos2,1)
        if (abs(TradePos2(i,1)-tp2(nCount,1)) == 2)
            if  (tp2(nCount,3) > TradePos2(i,2))
                tp2(nCount,3) = TradePos2(i,2);
            end
            nCount = nCount+1;
            tp2(nCount,:) = TradePos2(i,:);
            p2(nCount) = a2(i);
        else
            if TradePos2(i,2)-tp2(nCount,3)>=0
                nCount = nCount+1;
                tp2(nCount,:) = TradePos2(i,:);
                p2(nCount) = a2(i);
            end
        end
        
    end
    tp2 = tp2(1:nCount,:);
    p2 = p2(1:nCount);
    
    % 合并
    tp = [ tp1; tp2];
    p = [p1;p2];
    
    [TradePos,index] = sortrows(tp,2);
    p = p(index);
    

end


%% 画图
if plotFlg==1
    
figure; subplot(121); hold on; grid;
for i = 1:size(TradePosTmp,1)
    if TradePosTmp(i,1) == 1;
        color = 'r';
    else
        color = 'b';
    end
    plot( [TradePosTmp(i,2),TradePosTmp(i,3)],[i,i], ...
        'Color',color,'LineWidth',3);
end
% set(gca,'color',[0,0,0]);
xlimit = get(gca, 'XLim');
ylimit = get(gca, 'YLim');

  
subplot(122); hold on;  grid;
set(gca, 'XLim', xlimit,'YLim',ylimit);
for i = 1:size(TradePos,1)
    if TradePos(i,1) == 1;
        color = 'r';
    else
        color = 'b';
    end
    plot( [TradePos(i,2),TradePos(i,3)],[p(i),p(i)], ...
        'Color',color,'LineWidth',3);
end

ss = get(0,'screensize'); ss(3) = ss(3)-70;
set(gcf,'outerposition',ss);

end

end





































































