function [d2,ColIndex] = ColDivision(d,rowIndex,row)

d1 = d(rowIndex (row, 1) : rowIndex(row,2),:);

a2 = sum(d1);

pos1 = find(a2>0,1) ;
pos2 = length(a2)-find(fliplr(a2)>0,1)+1;

d2 = d1(:, pos1-2:pos2+2) ;
a2 = sum(d2) ;

ColIndex = zeros(200, 2);

% 二值图像时需要注释掉下面两行
% threshold = 10;
% a2(a2<threshold) = 0;

nCount = 0 ;

for i = 2:length (a2)
    if (a2(i)~=0)&&(a2(i-1)==0)
        nCount = nCount+1;
        ColIndex(nCount,1) = i;
    end
    
    if (a2(i)==0)&&(a2(i-1)~=0)
        ColIndex(nCount, 2) = i-1;
    end
end
ColIndex = ColIndex(1:nCount, :);



























