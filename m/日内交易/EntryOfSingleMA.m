function [EntryFlg,cOneDayData, cdataset,cNomalized, avgLineCell] = ...
    EntryOfSingleMA( cCell,indexOfDate, L )

% M: 均线滤波长度
cOneDayData = cell2mat( cCell(indexOfDate) );
dtNum = cOneDayData(:,1);
cOneDayData = cOneDayData(:,2:end);

futureCode = cellstr(char(cCell(end)));
cdataset = dataset( { cOneDayData,futureCode{:} }, ...
    'obsNames',cellstr(datestr(dtNum,'yyyy/mm/dd HH:MM:SS')) ); %#ok

cTmp = cOneDayData -...
    repmat( nanmean(cOneDayData), size(cOneDayData,1),1);
cNomalized = cTmp./repmat( nanmax(cTmp), size(cOneDayData,1),1);

figure;hold on;
EntryFlg = zeros(size(cOneDayData));
avgLineCell = cell(size(cCell));
for k = 1:size(cOneDayData,2)
    
    [avgLine,~] = movavg(cNomalized(:,k),L,L,0);
    avgLine(1:L) = avgLine(1:L)*L./(1:L)';
    
    avgLineCell(k) = {avgLine};
    
    plot(cNomalized(:,k)+k,'LineWidth',2)

    EntryFlg((cNomalized(:,k)>=avgLine),k) = 1;
    EntryFlg((cNomalized(:,k)<avgLine),k) = -1;
    
end

% longPos = find( sum(bb,2) == 5 );
% shortPos = find( sum(bb,2) == -5 );
% 
% for s = 1:length(longPos)
%     plot([longPos(s),longPos(s)],[0,6],'r');
% end
% 
% for s = 1:length(shortPos)
%     plot([shortPos(s),shortPos(s)],[0,6],'g');
% end

end

