function EntrySignal = EntryRuleOfNPeriodBreak_Long(c, nPeriod, LongShortFlg)

% close; plot(1:length(x),c,1:length(x),x);

if max( c(end-nPeriod+1 : end) ) == c(end)
    EntrySignal = 1;
% elseif min( c(end-nPeriod+1 : end) ) == c(end)
    % EntrySignal = -1;
else
    EntrySignal = 0;
end

if EntrySignal == LongShortFlg
    EntrySignal = 0;
end

end

