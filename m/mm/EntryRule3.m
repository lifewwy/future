function EntryPos = EntryRule3(flgGoLongOrShort,c,Nshort,Nlong)
%  ˫����

[short,long] = movavg(c,Nshort,Nlong);
if strcmp(flgGoLongOrShort,'long')
    EntryPos = find(short>long);
else
    EntryPos = find(short<long);
end

