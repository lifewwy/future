function rowIndex = RowDivision(d)

a1 = sum(d, 2);
 rowIndex = zeros(100,2) ;
nCount = 0;
for i = 2: length (a1)
    if (a1 (i)~=0)&&(a1 (i-1)==0)
        nCount = nCount+1;
        rowIndex (nCount,1) = i;
    end
    if (a1 (i) ==0)&&(a1(i-1)~=0)
        rowIndex (nCount, 2) = i-1;
    end
end
rowIndex = rowIndex (1: nCount,:);
