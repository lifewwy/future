function [posEntry, posExit ,Rinit] = ExitRule1(flgGoLongOrShort,posEntry,c,atr,N1,N2)

% clear all; clc; close all;

NperiodMeanAtr = 10;
posEntry = posEntry(posEntry>NperiodMeanAtr);

%% go long : ×ö¶à
if strcmp(flgGoLongOrShort ,'goLong')
    % posEntry = intersect(posEntry1,posEntry2);
    % N1  = 2; N2 = 3;
    Nsim = length(posEntry);
    % posEntry = zeros(Nsim,1);
    posExit = zeros(Nsim,1);
    Rinit = zeros(Nsim,1);
    k = 1; nCount = 0;
    index = zeros(Nsim,1);
    for m = 1:Nsim
        nCount = nCount+1;
        index(nCount) = k;
        
        Rinit(k) = N1*mean(atr(posEntry(k)-NperiodMeanAtr:posEntry(k)));
        pMax = c(posEntry(k))-N2*mean(atr(posEntry(k)-10:posEntry(k)));
        for i=posEntry(k):length(c)
            if c(posEntry(k))-c(i)>=Rinit(k)
                posExit(k) = i;
                break;
            end
            s = c(i)-N2*mean(atr(i-10:i));
            if s>=pMax
                pMax = s;
            end
            if (c(i)<pMax)
                posExit(k) = i;
                break;
            end
        end
        if posExit(k)==0
            posExit(k) = length(c);
            break;
        end
        k = find(posEntry>posExit(k),1,'first');
        if isempty(k)
            break;
        end
    end
    
    posEntry = posEntry(index(1:nCount));
    posExit = posExit(index(1:nCount));
    Rinit = Rinit(index(1:nCount));
    % re = (c(posExit)-c(posEntry)) ...
    %     ./Rinit(index(1:nCount));
    %
    % ep = mean(re) %#ok
    % tp = ep*length(re) %#ok
    % vr = sum(re>0)/length(re) %#ok
    
end
%% go long : ×ö¿Õ
if strcmp(flgGoLongOrShort ,'goShort')
    % posEntry = intersect(posEntry1,posEntry2);
    % N1  = 2; N2 = 3;
    Nsim = length(posEntry);
    % posEntry = zeros(Nsim,1);
    posExit = zeros(Nsim,1);
    Rinit = zeros(Nsim,1);
    k = 1; nCount = 0;
    index = zeros(Nsim,1);
    for m = 1:Nsim
        nCount = nCount+1;
        index(nCount) = k;
        
        Rinit(k) = N1*mean(atr(posEntry(k)-NperiodMeanAtr:posEntry(k)));
        pMin = c(posEntry(k))+N2*mean(atr(posEntry(k)-10:posEntry(k)));
        for i=posEntry(k):length(c)
            if c(i)-c(posEntry(k))>=Rinit(k)
                posExit(k) = i;
                break;
            end
            s = c(i)+N2*mean(atr(i-10:i));
            if s<=pMin
                pMin = s;
            end
            if (c(i)>pMin)
                posExit(k) = i;
                break;
            end
        end
        if posExit(k)==0
            posExit(k) = length(c);
            break;
        end
        k = find(posEntry>posExit(k),1,'first');
        if isempty(k)
            break;
        end
    end
    
    posEntry = posEntry(index(1:nCount));
    posExit = posExit(index(1:nCount));
    Rinit = Rinit(index(1:nCount));
    % re = (c(posExit)-c(posEntry)) ...
    %     ./Rinit(index(1:nCount));
    %
    % ep = mean(re) %#ok
    % tp = ep*length(re) %#ok
    % vr = sum(re>0)/length(re) %#ok
end
%% »­Í¼
% pos1 = find(re>=0);
% pos2 = find(re<0);
% figure; bar(pos1,re(pos1),.2,'r');
% hold on; bar(pos2,re(pos2),.1)
%
% figure; movavg(c,ShortAveragePeriod,LongAveragePeriod);
%
% figure; plot(c); hold on;
% stem(posEntry,ones(length(posEntry),1)*max(c));
% stem(posExit,ones(length(posExit),1)*max(c),'r');
%
% figure; hist(re,20);
% plot(atr); hold on; plot(c); plot(ma1,'r'); plot(ma2,'k');
% figure; movavg(c,20,240)































































