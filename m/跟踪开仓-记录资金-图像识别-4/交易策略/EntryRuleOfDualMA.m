function EntrySignal = EntryRuleOfDualMA(c, fastLen, slowMA, LongShortFlg)

% close; plot(1:length(x),c,1:length(x),x);

[ss, ll] = movavg(c, fastLen, slowMA, 0);
if (ss(end)>ll(end))&&(ss(end-1)<ll(end-1))
    EntrySignal = 1;
elseif (ss(end)<ll(end))&&(ss(end-1)>ll(end-1))
    EntrySignal = -1;
else
    EntrySignal = 0;
end

% if max( c(end-nPeriod+1 : end) ) == c(end)
%     EntrySignal = 1;
% elseif min( c(end-nPeriod+1 : end) ) == c(end)
%     EntrySignal = -1;
% else
%     EntrySignal = 0;
% end

if EntrySignal == LongShortFlg
    EntrySignal = 0;
end

end

