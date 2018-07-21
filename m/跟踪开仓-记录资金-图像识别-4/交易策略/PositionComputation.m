function pc = PositionComputation(ResultOfTrade)

x = ResultOfTrade;

lose = x(x<0);
win = x(x>0);

win = win/(sum(-lose)/sum(x<0))  ;   
lose = lose/(sum(-lose)/sum(x<0));

wr = sum(x>0)/length(x)  %#ok

losemean = mean(lose)    %#ok
losedev = std(lose)      %#ok

winmean = mean(win)      %#ok
windev = std(win)        %#ok

MAXDRAWDOWNTHRESHOLD = 0.8;
% POSIZE = 3e-2;

for POSIZE = 1e-3:1e-3:5e-2
    rob = pos_size_opt_func(MAXDRAWDOWNTHRESHOLD,wr,losemean,losedev,winmean,windev,POSIZE) %#ok
    if rob>=1e-3
        break;
    end
end

pc = POSIZE         %#ok



















