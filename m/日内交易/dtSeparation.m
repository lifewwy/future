function [ openAndClosePos ] = dtSeparation( dtCell )

dtChar = char(dtCell);
tCell = cellstr(dtChar(:,12:end));
timeBeginCell  = {'21:00'};
timeEndCell  = {'14:59'};
openPos = find( strcmp(tCell,timeBeginCell) == 1);
closePos = find( strcmp(tCell,timeEndCell) == 1);

mm = min(length(openPos),length(openPos));
openAndClosePos = zeros(mm,2);
nCount = 0;
for i = 1:mm
    pos = find(closePos>openPos(i));
    if ~isempty(pos)
        nCount = nCount+1;
        openAndClosePos(nCount,1) = openPos(i);
        openAndClosePos(nCount,2) = closePos(pos(1));
    end
end
openAndClosePos = openAndClosePos(1:nCount,:);

end

