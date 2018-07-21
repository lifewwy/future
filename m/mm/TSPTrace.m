function TSPTrace(obj,eventdata)
    if(MBIsRtFreshed('Futures')) %有数据更新才执行交易策略
    	RealRoutine();
    end        
end

function RealRoutine()
    global IDList_TSP;
    global Handle_TSP;
    [T,Size]=size(IDList_TSP);
    PrintLog('分时均线策略', '策略刷新...');
    for i = 1: Size
        TSPD = MBGetTSPData(IDList_TSP(i).Market, IDList_TSP(i).Code, 'NoFresh');
        [T,TS]=size(TSPD);
        if(TS <= 10)
            return;
        end        
        TSP5L = ChangeFre(TSPD, 5);
        TSP10L = ChangeFre(TSPD, 10);     
        if(~isempty(TSP5L) && ~isempty(TSP10L))
            if(TSP5L(TS-1).Price <= TSP10L(TS-1).Price && TSP5L(TS).Price > TSP10L(TS).Price) %5分钟线上穿10分钟线
                RtD=MBGetRtData(IDList_TSP(i).Market, IDList_TSP(i).Code);
%                 MBFTraderOrderInsert(Handle_TSP,'IF1209','Buy','Open','Speculation',RtD.SellPrice,1);
                Log = sprintf('开仓买，价格%.2f, 数量%d', RtD.SellPrice, 1);
                PrintLog('分时均线策略', Log);             
            elseif(TSP5L(TS-1).Price >= TSP10L(TS-1).Price && TSP5L(TS).Price < TSP10L(TS).Price) %5分钟线下穿10分钟线
                RtD=MBGetRtData(IDList_TSP(i).Market, IDList_TSP(i).Code);
%                 MBFTraderOrderInsert(Handle_TSP,'IF1209','Sell','Open','Speculation',RtD.BuyPrice,1);
                Log = sprintf('开仓卖，价格%.2f, 数量%d', RtD.SellPrice, 1);
                PrintLog('分时均线策略', Log);             
            end
        end
    end
end

function CFreTSP = ChangeFre(TSPD, Fre)
    [T, Size] = size(TSPD);
    CFreTSP = [];
    if(Size < Fre)
        return;
    end
    for i =1:Fre
        CT.Price = 0;
        CT.Quan = 0;
        CFreTSP = [CFreTSP, CT];
    end;    
    for i =Fre+1:Size
        AVP = 0;
        Quan = 0;
        for j = i-Fre+1 : i
            AVP = AVP+TSPD(j).CurrentPrice*TSPD(j).Quantity;
            Quan = Quan+TSPD(j).Quantity;
        end
        AVP = AVP/Quan;
        CT.Price = AVP;
        CT.Quan = Quan;
        CFreTSP = [CFreTSP, CT];
    end
end

function PrintLog(Des, Log)
    global g_FIDTraceLog;
    Des = [Des, 0];
    TSM = TimeStamp();
    TLog = sprintf('%s:%s', TSM, Log);
    TLog = [TLog,0];
    MBAppendLog(Des, TLog);
    if(~isempty(g_FIDTraceLog))
        fprintf(g_FIDTraceLog, '[%s]%s:%s\n', Des, TSM, Log);
    end
end

function TSM = TimeStamp()
    Cl = fix(clock());
    Year = Cl(1);
    Month = Cl(2);
    Date = Cl(3);
    Hour = Cl(4);
    Min = Cl(5);
    Sec = Cl(6);
    TSM = sprintf('[%04d-%02d-%02d %02d:%02d:%02d]', Year,Month,Date,Hour,Min,Sec);
end