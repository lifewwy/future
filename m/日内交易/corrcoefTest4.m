%% �󲿷�Ʒ�ֵļ۸�����ͬ�����ƶ�ʱ��˳���������Ƿ����
% function corrcoefTest4

clear; clc; close all; 

%% ׼������
 
load cCell;

ccLen = length(cCell);

L = 30; 
indexOfDate = 99;

natr = 4;

cOneDayData = cell2mat( cCell(indexOfDate) );
dtNum = cOneDayData(:,1);

beginPos = find( rem(dtNum,1) == rem(datenum('09:00'),1) );
endPos = find( rem(dtNum,1) == rem(datenum('14:59'),1) );

cOneDayData = cOneDayData(beginPos:endPos,2:end);
csize = size(cOneDayData);

futureCode = cellstr(char(cCell(ccLen)));
cdataset = dataset( { cOneDayData,futureCode{:} }, ...
    'obsNames',cellstr(datestr(dtNum(beginPos:endPos),...
    'yyyy/mm/dd HH:MM:SS')) ); %#ok

cTmp = cOneDayData -...
    repmat( nanmean(cOneDayData), csize(1),1);
cNomalized = cTmp./repmat( nanmax(cTmp), csize(1),1);


%% ���㵥���߶��λ��
tic
[LsFlg, avgLine] = LsFlgOfSingleMA( cNomalized, L, 0);

% ��ͬ�Ķ��λ��
NumOfSameDirection = floor( csize(2)*.9);
[ LongCommonPos ,ShortCommonPos, CommonPos] = ...
    GetCommonPos( LsFlg, NumOfSameDirection);

if isempty(CommonPos)
    return;
end

TradeResult = zeros(1,csize(2));
figure;hold on;
for iFC = 1:10
    futureCode = cdataset.Properties.VarNames;
    futureCode(iFC);
    
    %% �볡λ��
    [ LongEntryPos,  ShortEntryPos] = ...
        EntryPos( LsFlg,  LongCommonPos, ShortCommonPos, iFC);

    %% ����λ��
    
    % �����߳���
%     [ LongExitPos,  ShortExitPos] = ExitPosOfSingleMA( lsFlg, iFC );
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % ����ֹ�����
    ciFC = cNomalized(:,iFC);
    atr = atrfunc(ciFC,ciFC,ciFC,20);
    ep = [ [LongEntryPos, ones(length(LongEntryPos),1)] ; ...
        [ShortEntryPos, -ones(length(ShortEntryPos),1)] ];
    ep = sortrows(ep,1);
    [ etp ] = ExitPosOfnATR( ciFC, ep, 4*atr );
    LongExitPos = etp(ep(:,2) == 1);
    ShortExitPos = etp(ep(:,2) == -1);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %% ����λ��, prioFlg: 0���볡������1�볡���ȣ�2��������
    prioFlg = 2;
    tpPlotFlg = 0;
    [ TradePos ] = TradePosition( LongEntryPos,ShortEntryPos,...
        LongExitPos,ShortExitPos,prioFlg,tpPlotFlg);
    if tpPlotFlg == 1
        close(gcf)
    end
    
    %% ���׼�¼
    
    % cc = cOneDayData(:,iFC);
    cc = cNomalized(:,iFC);
    TradeRecord = (cc(TradePos(:,3)) - cc(TradePos(:,2))).*TradePos(:,1);
    TradeResult(iFC) = sum(TradeRecord);
    
    %% ��ͼ
    for i = 1:size(TradePos,1)
        if TradeRecord(i)>0
            color = 'r';
        else
            color = 'g';
        end
        
        plot( TradePos(i,2:3), ...
            [cNomalized(TradePos(i,2),iFC),cNomalized(TradePos(i,3),iFC)]+3*iFC ...
            ,'LineWidth',5,'Color',color);
    end
    
end

TradeResult %#ok
sum(TradeResult)

toc
%% ��ͼ 

for k = 1:size(cNomalized,2)
    plot(cNomalized(:,k)+k*3,'LineWidth',2,'Color',[0,1,1]);
end

for iFC = 1:csize(2)
    plot(avgLine(:,iFC)+3*iFC,'r')
end

for s = 1:length(LongCommonPos)
    plot([LongCommonPos(s),LongCommonPos(s)],[0,30],'-.r');
end

for s = 1:length(ShortCommonPos)
    plot([ShortCommonPos(s),ShortCommonPos(s)],[0,30],'-.g');
end


set(gca,'color',[0,0,0]);
set(gca,'position',[.01,.02,1,.94]);

ss = get(0,'screensize'); ss(3) = ss(3)-70;
set(gcf,'outerposition',ss);

if prioFlg == 0
    title(['���볡����, ', 'nart = ', num2str(natr)], ...
        'fontsize',18)
elseif prioFlg == 1
    title(['�볡����, ', 'nart = ', num2str(natr)], ...
        'fontsize',18);
elseif prioFlg == 2
    title(['��������, ', 'nart = ', num2str(natr)], ...
        'fontsize',18);
else
end
    

% set(gca,'xcolor',[0,0,0],'ycolor',[1,1,1] ...
%     ,'xgrid','off','ygrid','on');






































































































































