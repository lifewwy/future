clear; close all; clc;

%% ������
folder = 'C:\D\future\����ά��\';
fn = 'c888';
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

%% ���ݷ���
NperiodOfATR = 60;  startPoint = 1100;   commission = 40;
atr = atrfunc(h,l,c,NperiodOfATR);
cUint = ContractUnit(fn);

Nperiod = 2:90;  ExitNatr = 0.1 : .1 : 5; 

ResultOfTrade = zeros( length(Nperiod) , length(ExitNatr) );
trm = zeros( length(Nperiod) , length(ExitNatr) );
TotalRateOfReturn = zeros( length(Nperiod) , length(ExitNatr) );
nCount1 = 0;  
for NperiodTmp = Nperiod
    nCount1 = nCount1+1 %#ok
    nCount2 = 0;
    for ExitNatrTmp = ExitNatr
        nCount2 = nCount2+1;
               
        EntryRule_Long = ['EntryRuleOfNPeriodBreak_Long(ci,'  num2str(NperiodTmp)  ',LongShortFlg);  '];
        
        EntryRule_Short = ['EntryRuleOfNPeriodBreak_Short(ci,'  num2str(NperiodTmp)  ',LongShortFlg);  '];
        
        ExitRule = [ 'ExitRuleOfNatrTrailingStop(oi, ci, EntryPos, LongShortFlg , atr,' , ...
            num2str(ExitNatrTmp),' );'];

        TradePos_Long =  ExitPrior(o,h,l,c, EntryRule_Long,  ExitRule, atr, startPoint);
        TradePos_Short =  ExitPrior(o,h,l,c, EntryRule_Short,  ExitRule, atr, startPoint);
        
        TradePos = [TradePos_Long; TradePos_Short];
        [aa, ~] = ind2sub(size(TradePos),find(TradePos==0));
        TradePos(aa,:) = [];
        TradePos = sortrows(TradePos);
        
        [TotalProfit, TotalRateOfReturnTmp, ~, ~, trmTmp, ~] =  AnalysisOfTradeResult(o, TradePos, ...
            commission, ExitNatrTmp*atr*cUint, 0);
           
        ResultOfTrade(nCount1,nCount2) = TotalProfit;
        
        trm(nCount1,nCount2) = trmTmp;
        
        TotalRateOfReturn(nCount1,nCount2) = TotalRateOfReturnTmp;
            
    end
end

%% ����ͼʾ

[x,y] = meshgrid(ExitNatr,Nperiod);

figure('numbertitle','off','name',[fn, ' ResultOfTrade']); 
surf(y,x,ResultOfTrade); axis tight; view(2)
saveas(gcf, ['C:\D\future\NewSystem\�Ż�ͼ\', fn, ' ResultOfTrade']) 

figure('numbertitle','off','name',[fn, ' trm']); 
surf(y,x,trm); axis tight; view(2)
saveas(gcf, ['C:\D\future\NewSystem\�Ż�ͼ\', fn, ' trm']) 

figure('numbertitle','off','name',[fn, ' TotalRateOfReturn']); 
surf(y,x,TotalRateOfReturn); axis tight; view(2)
saveas(gcf, ['C:\D\future\NewSystem\�Ż�ͼ\', fn, ' TotalRateOfReturn']) 

%% ���Ų���ѡ��
% Nperiod = 4;
% ExitNatr = 0.2;
% 
% % EntryRule = ['EntryRuleOfExtreme(ci,'  num2str(0.02) ', LongShortFlg);'];
% EntryRule1 = ['EntryRuleOfNPeriodBreak_Long(ci,'  num2str(Nperiod)  ',LongShortFlg);  '];
% EntryRule2 = ['EntryRuleOfNPeriodBreak_Short(ci,'  num2str(Nperiod)  ',LongShortFlg);  '];
% 
% ExitRule = [ 'ExitRuleOfNatrTrailingStop(oi, ci, EntryPos, LongShortFlg , atr,' , ...
%     num2str(ExitNatr),' );'];
% 
% TradePos1 =  ExitPrior(o,h,l,c, EntryRule1,  ExitRule, atr, startPoint);
% TradePos2 =  ExitPrior(o,h,l,c, EntryRule2,  ExitRule, atr, startPoint);
% 
% TradePos = [TradePos2; TradePos1];  
% [aa, bb] = ind2sub(size(TradePos),find(TradePos==0));
% TradePos(aa,:) = [];
% TradePos = sortrows(TradePos);
% 
% commission = 16;
% 
% [TotalProfit, TotalRateOfReturn, ~, ~, trmTmp, ~] =  AnalysisOfTradeResult(o, TradePos, ...
%             commission, ExitNatr*atr*cUint, 1);









