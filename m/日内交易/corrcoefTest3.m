%% 大部分品种的价格都往相同方向移动时，顺趋势买入是否可行
clear; clc; close all; 

%% 入场位置
 
load cCell;

L = 20; 
indexOfDate = 190;
tic
[EntryFlg,cOneDayData ,cdataset,cNomalized,avgLineCell] = ...
    EntryOfSingleMA( cCell ,indexOfDate, L);
toc
%%
NumOfSameDirection = 8;
LongCommonPos = find( sum(EntryFlg==1,2) >= NumOfSameDirection );
ShortCommonPos = find( sum(EntryFlg==-1,2) >= NumOfSameDirection );

% for s = 1:length(LongCommonPos)
%     plot([LongCommonPos(s),LongCommonPos(s)],[0,6],'-.r');
% end
% 
% for s = 1:length(ShortCommonPos)
%     plot([ShortCommonPos(s),ShortCommonPos(s)],[0,6],'-.g');
% end

%%

futureCode = cdataset.Properties.VarNames;
iFC = 1;
futureCode(iFC)

LongEntryPos = LongCommonPos(EntryFlg(LongCommonPos,iFC) == 1);
ShortEntryPos = ShortCommonPos(EntryFlg(ShortCommonPos,iFC) == -1);

ShortToLongPos = find( diff(EntryFlg(:,iFC)) == 2 )+1;
LongToShort = find( diff(EntryFlg(:,iFC)) == -2 )+1;
N = size(EntryFlg,1);
if LongToShort(end)~=N
    LongToShort = [LongToShort;N];
end
if ShortToLongPos(end)~=N
    ShortToLongPos = [ShortToLongPos;N];
end

TradePos1 = zeros(1e2,3);
for i = 1:length(LongEntryPos)
    if i==1
        a = LongEntryPos(i);
    else
        if ~isempty(b)
            a = LongEntryPos( find( LongEntryPos > b, 1) );
        else
            break;
        end
    end
    if ~isempty(a)
        b = LongToShort( find( LongToShort > a, 1) );
    else
        break;
    end
    TradePos1(i,1) = 1;
    TradePos1(i,2:3) = [a,b];
end
TradePos1 = TradePos1(1:i-1,:);

TradePos2 = zeros(1e2,3);
for i = 1:length(ShortEntryPos)
    if i==1
        a = ShortEntryPos(i);
    else
        if ~isempty(b)
            a = ShortEntryPos( find( ShortEntryPos > b, 1) );
        else
            break;
        end
    end
    if ~isempty(a)
        b = ShortToLongPos( find( ShortToLongPos > a, 1) );
    else
        break;
    end
    TradePos2(i,1) = -1;
    TradePos2(i,2:3) = [a,b];
end
TradePos2 = TradePos2(1:i-1,:);

TradePos = [TradePos1; TradePos2];
TradePos = sortrows(TradePos,2);

avgLine = cell2mat(avgLineCell);
plot(avgLine(:,iFC)+iFC,'r')

cc = cOneDayData(:,iFC);
TradeRecord = (cc(TradePos(:,3)) - cc(TradePos(:,2))).*TradePos(:,1) %#ok
TradeResult = sum(TradeRecord) %#ok

for i = 1:size(TradePos,1)
    if TradeRecord(i)>0
        color = 'r';
    else
        color = 'g';
    end
    
    plot( TradePos(i,2:3), ...
        [cNomalized(TradePos(i,2),iFC),cNomalized(TradePos(i,3),iFC)]+iFC ...
    ,'LineWidth',2,'Color',color);
end

set(gca,'color',[0,0,0]);















































































































































