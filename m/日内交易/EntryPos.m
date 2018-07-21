function [ LongEntryPos,  ShortEntryPos] = ...
    EntryPos( lsFlg,  LongCommonPos, ShortCommonPos, iFC)

LongEntryPos = LongCommonPos(lsFlg(LongCommonPos,iFC) == 1);
ShortEntryPos = ShortCommonPos(lsFlg(ShortCommonPos,iFC) == -1);


end

