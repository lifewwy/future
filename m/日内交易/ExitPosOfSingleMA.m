function [ LongToShortPos,  ShortToLongPos] = ExitPosOfSingleMA( lsFlg, iFC )

ShortToLongPos = find( diff(lsFlg(:,iFC)) == 2 )+1;
LongToShortPos = find( diff(lsFlg(:,iFC)) == -2 )+1;

% 添加数据末尾为平仓位置
N = size(lsFlg,1);
if LongToShortPos(end)~=N
    LongToShortPos = [LongToShortPos;N];
end
if ShortToLongPos(end)~=N
    ShortToLongPos = [ShortToLongPos;N];
end

end

