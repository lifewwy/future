function [posExit ,Rinit] = ExitRule90(flgGoLongOrShort,posEntry,c,atr,N1,N2)

% clear all; clc; close all;

%% go long : ×ö¶à
if strcmp(flgGoLongOrShort ,'goLong')
    
    posExit = length(c);
    
    
    Rinit = N1*mean(atr(posEntry-10:posEntry));
    pMax = c(posEntry)-N2*mean(atr(posEntry-10:posEntry));
    for i=posEntry:length(c)
        if c(posEntry)-c(i)>=Rinit
            posExit = i;
            break;
        end
        s = c(i)-N2*mean(atr(i-10:i));
        if s>=pMax
            pMax = s;
        end
        if (c(i)<pMax)
            posExit = i;
            break;
        end
    end
    
    
    
    
end
%% go long : ×ö¿Õ
if strcmp(flgGoLongOrShort ,'goShort')
    
    posExit = length(c);
    
    Rinit = N1*mean(atr(posEntry-10:posEntry));
    pMin = c(posEntry)+N2*mean(atr(posEntry-10:posEntry));
    for i=posEntry:length(c)
        if c(i)-c(posEntry)>=Rinit
            posExit = i;
            break;
        end
        s = c(i)+N2*mean(atr(i-10:i));
        if s<=pMin
            pMin = s;
        end
        if (c(i)>pMin)
            posExit = i;
            break;
        end
    end
    
    
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































































