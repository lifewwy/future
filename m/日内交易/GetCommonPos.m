function [ LongCommonPos ,ShortCommonPos, CommonPos] = ...
    GetCommonPos( lsFlg, NumOfSameDirection)

LongCommonPos = find( sum(lsFlg==1,2) >= NumOfSameDirection );
ShortCommonPos = find( sum(lsFlg==-1,2) >= NumOfSameDirection );

CommonPos = [ [LongCommonPos , ones(length(LongCommonPos),1)] ; ...
    [ShortCommonPos , -ones(length(ShortCommonPos),1)]  ];


end

