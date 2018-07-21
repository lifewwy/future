function EntrySignal = EntryRuleOfExtreme(c, EntryRate, LongShortFlg)

x = waveletAnalysis(c,2,'db5'); 

% close; plot(1:length(x),c,1:length(x),x);

[ep,~] = LastExtremePos(x,1);

if isempty(ep)
    EntrySignal = 0;
    return;
end

rate = (c(end)-c(ep))/c(ep);

if abs(rate) > EntryRate
    EntrySignal = sign(rate);
else
    EntrySignal = 0;
end

if EntrySignal == LongShortFlg
    EntrySignal = 0;
end

end

