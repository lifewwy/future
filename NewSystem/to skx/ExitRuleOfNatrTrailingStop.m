function ExitSignal = ExitRuleOfNatrTrailingStop( o, c, EntryPos , LongShortFlg , atr, nATR)

N = length(c);
ExitSignal = 0;

if LongShortFlg == 1
    
    StopPrice = max( [o(EntryPos);  c(EntryPos:N)] - ...
        nATR*[atr(EntryPos-1); atr(EntryPos:N)]);
    
    if c(end) <= StopPrice
        ExitSignal = 1;
    end
    
elseif LongShortFlg == -1
    
    StopPrice = min( [o(EntryPos); c(EntryPos:N)] + ...
        nATR*[atr(EntryPos-1); atr(EntryPos:N)]);
    
    if c(end) >= StopPrice
        ExitSignal = 1;
    end
    
end

end

