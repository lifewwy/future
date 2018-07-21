%position sizing optimization program
%author:Peter Shih
%Date:20120316
clc
close all;
clear all;

% WINRATE = 0.35;
% LOSEMEAN = -0.6876386; % (R)
% LOSEDEV = 1.0151185;   % (R)
% WINMEAN = 7.7687972;   % (R)
% WINDEV = 8.6317352;    % (R)
% POSIZE = 1e-2; % 承担风险占总资金的百分比

WINRATE = 0.6078;
LOSEMEAN = -1;  
LOSEDEV = 0.8507;   
WINMEAN = 2.3934;  
WINDEV = 2.7796;    
POSIZE = 2e-2; % 承担风险占总资金的百分比

INIT = 2250000;
NUMBOFTRADE = 160;
MULTEPROTIMES = 5;
TESTTIME = 10000;
YEARS = 2;
BANKRUPTTHRESHOLD = 0.7;
MAXDRAWDOWNTHRESHOLD = 0.7;

result = zeros(1,TESTTIME);
singleresult = zeros(1,NUMBOFTRADE);
numberofbankrupt = 0;
bandruptflag = 0;
countnumber = TESTTIME;
totalresult = 0;
longestloss = 0;
numberofloss = 0;
lastwinlose = 1;
bankruptvalue = BANKRUPTTHRESHOLD*INIT;
ratesim = rand(TESTTIME,NUMBOFTRADE);
for i=1:TESTTIME
    cur = INIT;
    multipcnt = 0;
    profittemp = 0;
    bandruptflag = 0;
    numberofloss = 0;
    maxcurrent = INIT;
    for j = 1:NUMBOFTRADE
        tmp = ratesim(i,j);
        multipcnt = multipcnt + 1;
        if tmp > WINRATE
            cur = cur + cur*POSIZE*(LOSEDEV*randn+LOSEMEAN);
            if lastwinlose == 0
                numberofloss = numberofloss + 1;
            else
                numberofloss = 1;
                lastwinlose = 0;
            end
            if ((cur/maxcurrent)<MAXDRAWDOWNTHRESHOLD)
                numberofbankrupt = numberofbankrupt + 1;
                bandruptflag = 1;
                countnumber = countnumber -1;
                break;
            end
%             if cur < bankruptvalue
%                 numberofbankrupt = numberofbankrupt + 1;
%                 bandruptflag = 1;
%                 countnumber = countnumber -1;
%                 break;
%             end
        else
            profittemp = profittemp + cur*POSIZE*(WINDEV*randn + WINMEAN);
            lastwinlose = 1;
        end
        if (multipcnt == MULTEPROTIMES)
            cur = cur + profittemp;
            profittemp = 0;
            multipcnt = 0;
            if (cur > maxcurrent)
                maxcurrent = cur;
            end
        end
        singleresult(1,j) = cur;
    end
    if bandruptflag == 0    
        result(i) = cur;
        totalresult = totalresult + cur;
    end
    if numberofloss > longestloss
        longestloss = numberofloss;
    end
    if i==TESTTIME*0.1
        fprintf('10%% finished\n')
    end
    if i==TESTTIME*0.2
        fprintf('20%% finished\n')
    end
    if i==TESTTIME*0.3
        fprintf('30%% finished\n')
    end
    if i==TESTTIME*0.4
        fprintf('40%% finished\n')
    end
    if i==TESTTIME*0.5
        fprintf('50%% finished\n')
    end
    if i==TESTTIME*0.6
        fprintf('60%% finished\n')
    end
    if i==TESTTIME*0.7
        fprintf('70%% finished\n')
    end
    if i==TESTTIME*0.8
        fprintf('80%% finished\n')
    end
    if i==TESTTIME*0.9
        fprintf('90%% finished\n')
    end
end
meanresult = totalresult/countnumber;

fprintf('longest loss = %g\n', longestloss);
fprintf('mean current result = %g, mean profit rate = %g%%\n',meanresult,...
    ((meanresult/INIT)-1)*100);
fprintf('mean profit per year = %g%%\n',(((meanresult/INIT)^(1/YEARS))-1)*100);
fprintf('number of bankrupt = %g ; rate of bankrupt = %g%%\n',...
    numberofbankrupt,(numberofbankrupt/TESTTIME)*100);
hist(((1/INIT).*result)-1,-10:1:500);
