clear; clc

%% °×ÌÇ
load baitang

lose = x(x<0);
win = x(x>0);

win = win/(sum(-lose)/sum(x<0))  ;   
lose = lose/(sum(-lose)/sum(x<0));

wr = sum(x>0)/length(x)  %#ok

losemean = mean(lose)    %#ok
losedev = std(lose)      %#ok

winmean = mean(win)      %#ok
windev = std(win)        %#ok

MAXDRAWDOWNTHRESHOLD = 0.7;
% POSIZE = 3e-2;

for POSIZE = 1e-3:1e-3:5e-2
    rob = pos_size_opt_func(MAXDRAWDOWNTHRESHOLD,wr,losemean,losedev,winmean,windev,POSIZE) %#ok
    if rob>1e-3
        break;
    end
end

POSIZE        %#ok
%% PTA

load PTA;


lose = x(x<0);
win = x(x>0);

win = win/(sum(-lose)/sum(x<0))  ;   
lose = lose/(sum(-lose)/sum(x<0));

wr = sum(x>0)/length(x)  %#ok

losemean = mean(lose)    %#ok
losedev = std(lose)      %#ok

winmean = mean(win)      %#ok
windev = std(win)        %#ok

MAXDRAWDOWNTHRESHOLD = 0.7;
for POSIZE = 1e-3:1e-3:5e-2
    rob = pos_size_opt_func(MAXDRAWDOWNTHRESHOLD,wr,losemean,losedev,winmean,windev,POSIZE) %#ok
    if rob>1e-3
        break;
    end
end

POSIZE        %#ok

%% ËÜÁÏ
clear; 
load suliao;


lose = x(x<0);
win = x(x>0);

win = win/(sum(-lose)/sum(x<0))  ;   
lose = lose/(sum(-lose)/sum(x<0));

wr = sum(x>0)/length(x)  %#ok

losemean = mean(lose)    %#ok
losedev = std(lose)      %#ok

winmean = mean(win)      %#ok
windev = std(win)        %#ok

MAXDRAWDOWNTHRESHOLD = 0.7;
POSIZE = 0.7e-2;
for POSIZE = 1e-3:1e-3:5e-2
    rob = pos_size_opt_func(MAXDRAWDOWNTHRESHOLD,wr,losemean,losedev,winmean,windev,POSIZE) %#ok
    if rob>1e-3
        break;
    end
end

POSIZE        %#ok

%% ¶¹ÆÉ
clear; 
load doupo;


lose = x(x<0);
win = x(x>0);

win = win/(sum(-lose)/sum(x<0))  ;   
lose = lose/(sum(-lose)/sum(x<0));

wr = sum(x>0)/length(x)  %#ok

losemean = mean(lose)    %#ok
losedev = std(lose)      %#ok

winmean = mean(win)      %#ok
windev = std(win)        %#ok

MAXDRAWDOWNTHRESHOLD = 0.7;
POSIZE = 1e-2;
for POSIZE = 1e-3:1e-3:5e-2
    rob = pos_size_opt_func(MAXDRAWDOWNTHRESHOLD,wr,losemean,losedev,winmean,windev,POSIZE) %#ok
    if rob>1e-3
        break;
    end
end

POSIZE        %#ok

%% ½¹Ì¿
clear; 
load jiaotan;


lose = x(x<0);
win = x(x>0);

win = win/(sum(-lose)/sum(x<0))  ;   
lose = lose/(sum(-lose)/sum(x<0));

wr = sum(x>0)/length(x)  %#ok

losemean = mean(lose)    %#ok
losedev = std(lose)      %#ok

winmean = mean(win)      %#ok
windev = std(win)        %#ok

MAXDRAWDOWNTHRESHOLD = 0.7;
POSIZE = 2.2e-2;
for POSIZE = 1e-3:1e-3:5e-2
    rob = pos_size_opt_func(MAXDRAWDOWNTHRESHOLD,wr,losemean,losedev,winmean,windev,POSIZE) %#ok
    if rob>1e-3
        break;
    end
end

POSIZE        %#ok

%% ÓñÃ×
clear; 
load yumi;


lose = x(x<0);
win = x(x>0);

win = win/(sum(-lose)/sum(x<0))  ;   
lose = lose/(sum(-lose)/sum(x<0));

wr = sum(x>0)/length(x)  %#ok

losemean = mean(lose)    %#ok
losedev = std(lose)      %#ok

winmean = mean(win)      %#ok
windev = std(win)        %#ok

MAXDRAWDOWNTHRESHOLD = 0.7;
POSIZE = 1.2e-2;
for POSIZE = 1e-3:1e-3:5e-2
    rob = pos_size_opt_func(MAXDRAWDOWNTHRESHOLD,wr,losemean,losedev,winmean,windev,POSIZE) %#ok
    if rob>1e-3
        break;
    end
end

POSIZE        %#ok















































