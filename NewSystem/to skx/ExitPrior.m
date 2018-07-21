function TradePos =  ExitPrior(o,h,l,c, EntryRule,  ExitRule, atr, sp) %#ok


%% Êý¾Ý·ÖÎö
N = length(c);
TradePos = zeros(N,3);
nCount = 0;

% NperiodOfATR = 15;
% atr = atrfunc(h,l,c,NperiodOfATR); %#ok

LongShortFlg = 0;
for i = sp:N
    
    % i %#ok
    
    % close ; plot(c(1:i));
    
    if LongShortFlg == 0;
        ci = c(1:i); %#ok
        % EntrySignal = EntryRuleOfNPeriodBreak(c(1:i), nPeriod, LongShortFlg);     
        EntrySignal = eval(EntryRule);
       
        if abs(EntrySignal) == 1
            EntryPos = i+1;
            LongShortFlg = EntrySignal;
            nCount = nCount+1;
            TradePos(nCount,1) = EntryPos;
            TradePos(nCount,3) = LongShortFlg;
            continue;
        end
        
    elseif abs(LongShortFlg) == 1

        oi = o(1:i); %#ok
        ci = c(1:i); %#ok
        % ExitSignal = ExitRuleOfNatrTrailingStop(o(1:i), c(1:i), EntryPos , ...
           % LongShortFlg , atr, ExitNatr );
        ExitSignal = eval(ExitRule);
        
        if ExitSignal == 1
            ExitPos = i+1;
            LongShortFlg = 0;
            TradePos(nCount,2) = ExitPos;
            
            % EntrySignal = EntryRuleOfNPeriodBreak(c(1:i), nPeriod, LongShortFlg);
            EntrySignal = eval(EntryRule);
            if abs(EntrySignal) == 1
                EntryPos = i+1;
                LongShortFlg = EntrySignal;
                nCount = nCount+1;
                TradePos(nCount,1) = EntryPos;
                TradePos(nCount,3) = LongShortFlg;
            end
            
        end
        
    else
        disp('Error!');
    end
    
end

TradePos = TradePos(1:nCount,:);

end










