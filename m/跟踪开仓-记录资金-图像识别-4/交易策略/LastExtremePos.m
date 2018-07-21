function [pos,flg] = LastExtremePos(x,p)

dx = diff(x);
N = length(x);
nCount = 0;
pos = zeros(1,N);
flg = zeros(1,N);
for i=N-1:-1:2
    if (dx(i)>0)&&(dx(i-1)<0)
        nCount = nCount+1;
        pos(nCount) = i;
        flg(nCount) = -1;
        if nCount == p, break; end
    elseif (dx(i)<0)&&(dx(i-1)>0)
        nCount = nCount+1;
        pos(nCount) = i;
        flg(nCount) = 1;
        if nCount == p, break; end
    else
    end
    
end

if nCount == 0
    pos = [];
    flg = [];
else
    pos = pos(1:nCount);
    flg = flg(1:nCount);
end


end

