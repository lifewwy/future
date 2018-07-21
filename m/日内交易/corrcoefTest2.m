%% �󲿷�Ʒ�ֺͿ��̼۱ȶ��ǻ��ʱ��˳���������Ƿ����
clear; clc; close all; 

tic
%% ������ʱ�伯
futureCode = [{'C'},{'RB'},{'M'},{'P'},...
    {'J'},{'ZN'},{'Y'},{'RU'},{'L'},...
    {'TA'},{'SR'}, ...
    {'MA'},{'AL'},{'OI'},...
    {'CU'}];

[dtCell] = DateAndTimeUnion(futureCode);

%% �ռ���������Ʒ�ֵ����̼�����
index = indexFutureCode(futureCode);
[ c ] = closePriceArray( futureCode, dtCell, index);

 %% �������շָ�����
 
openAndClosePos = dtSeparation( dtCell );

cCell = cell(1,size(openAndClosePos,1));
for i = 1:size(openAndClosePos,1)
    i %#ok
    iopenAndClosePos = openAndClosePos(i,1):openAndClosePos(i,2);
    ic = c(iopenAndClosePos,:);
    
    ic(ic==0) = nan;
    cCell(i) = { [datenum(dtCell(iopenAndClosePos)), ic] };
    
end

save cCell cCell;

%% �볡λ��
 
load cCell;

for i=130
    M = 12;
    oneDayData = cell2mat( cCell(i) );
    oneDayData = oneDayData(:,2:end);
    bb = zeros(size(oneDayData));
    cTmp = oneDayData(:,1:5)-...
        repmat( nanmean(oneDayData(:,1:5)), size(oneDayData,1),1);
    cNomalized = cTmp./repmat( nanmax(cTmp), size(oneDayData,1),1);
    figure;hold on;
    for k = 1:length(index)
        
        [avgLine,~] = movavg(cNomalized(:,k),M,M,0);
        avgLine(1:M) = avgLine(1:M)*M./(1:M)';
        
        plot(cNomalized(:,k)+k)
        
        bb(:,k) = (cNomalized(:,k)>=avgLine);
        longPos = find( sum(bb,2) == 3 );
        
    end
    
    for s = 1:length(longPos)
        plot([longPos(s),longPos(s)],[0,6],'r');
    end
    
    break;
end
    

    


toc
















































































































































