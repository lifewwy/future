clear all; close all; clc;

%% 读数据
% folder = 'C:\D\future\数据维护\';
folder = '';
fn = 'zn888';
filename = [folder,fn ,'.csv'];

if exist(filename,'file')
    DataStruct = importdata(filename);
    data = DataStruct.data;
    
    o = data(:,1); h = data(:,2);
    l = data(:,3); c = data(:,4);
else
    break;
end

figure; candle(h, l, c, o)

%% 数据分析
atr = atrfunc(h,l,c,15);

EntryRate = .01:.001:0.013;
Nperiod = 2:100;
ExitNatr = 0.1 : .1 : 5;
ResultOfTrade = zeros( length(EntryRate) , length(ExitNatr) );
commission = 0;
trm = zeros( length(EntryRate) , length(ExitNatr) );

ss1 = zeros( length(EntryRate) , length(ExitNatr) );

nCount1 = 0; 
for EntryRateTmp = EntryRate % NperiodTmp = Nperiod
    
    nCount1 = nCount1+1 %#ok
    nCount2 = 0;
    for ExitNatrTmp = ExitNatr
        nCount2 = nCount2+1;
         
        
        EntryRule = ['EntryRuleOfExtreme(ci,'  num2str(EntryRateTmp) ', LongShortFlg);'];
        
        ExitRule = [ 'ExitRuleOfNatrTrailingStop(oi, ci, EntryPos, LongShortFlg , atr,' , ...
            num2str(ExitNatrTmp),' );'];

        TradePos =  ExitPrior(o,h,l,c, EntryRule,  ExitRule, atr, 100);
        
        [TotalProfit, ~, ~, trmTmp, ~,ss] =  AnalysisOfTradeResult(o, TradePos, commission, 0, 1);
           
        ResultOfTrade(nCount1,nCount2) = TotalProfit;
        
        trm(nCount1,nCount2) = trmTmp;
        
        ss1(nCount1,nCount2) = ss;
            
    end
end

%% 性能图示

[x,y] = meshgrid(ExitNatr,EntryRate);

figure('numbertitle','off','name',fn); 
surf(y,x,ResultOfTrade); axis tight; view(2)

figure('numbertitle','off','name',fn); 
surf(y,x,trm); axis tight; view(2)

figure('numbertitle','off','name',fn); 
surf(y,x,ss1); axis tight; view(2)

%% 最优参数选择







