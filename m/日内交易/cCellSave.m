function cCellSave()

% clear; clc; close all; 

%% ������ dtNormalization

%% ������ʱ�伯
futureCode = [{'CF'},{'RB'},{'M'},{'P'},...
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

cCell = cell(1,size(openAndClosePos,1)+1);
for i = 1:size(openAndClosePos,1)
    i %#ok
    iopenAndClosePos = openAndClosePos(i,1):openAndClosePos(i,2);
    ic = c(iopenAndClosePos,:);
    
    ic(ic==0) = nan;
    cCell(i) = { [datenum(dtCell(iopenAndClosePos)), ic] };
    
end
cCell(i+1) = { char(futureCode(index)) };

% cellstr(char(cCell(end)));

save cCell cCell;














































































































































