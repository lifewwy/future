function EntryPos = EntryRule3(flgGoLongOrShort,c,Nshort,Nlong)
%  Ë«¾ùÏß

[short,long] = movavg(c,Nshort,Nlong);
if strcmp(flgGoLongOrShort,'long')
    EntryPos = find(short>long);
else
    EntryPos = find(short<long);
end

