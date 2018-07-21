clear all ; clc; close all;

dstruct = importdata('zn888(日线).csv');
display(dstruct.textdata(1,1))
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5);  atr = atrfunc(h,l,c,12);

N = length(c);
i = 2; % 入场位置
n1 = 1; n2 = 2;

goShortLongFlg = 'goShort';

if strcmp(goShortLongFlg , 'goLong')
    %% 做多
    pmax = o(i);
    for k = i:N
        if o(i)-c(k)>n1*atr(i)
            break;
        end
        
        if c(k)>pmax
            pmax = c(k);
        end
        
        if pmax-c(k)>n2*atr(k)
            break;
        end
    end
    
    exitPos = k+1;
    
    if exitPos==N+1
        exitPrice = c(exitPos-1);
    else
        exitPrice = o(exitPos);
    end
    
elseif strcmp(goShortLongFlg , 'goShort')
    %% 做空
    pmin = o(i);
    for k = i:N
        if c(k)-o(i)>n1*atr(i)
            break;
        end
        
        if c(k)<pmin
            pmin = c(k);
        end
        
        if c(k)-pmin>n2*atr(k)
            break;
        end
    end
    
    exitPos = k+1;
    
    if exitPos==N+1
        exitPrice = c(exitPos-1);
    else
        exitPrice = o(exitPos);
    end
    
    
end






