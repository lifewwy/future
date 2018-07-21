function PosStatus = StrategyFunc_DualMA(fn,plotFlg,TabHandles,PanelSize)

% clear; close all; clc;
PosStatus = [];

% directory1 = 'C:\D\future\数据维护\';
% directory2 = 'C:\D\future\';
% directory3 = 'C:\D\future\交易位置\';

% 20180214
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end-3));
directory1 = [directory,'数据维护\'];
directory2 = directory;
directory3 = [directory,'交易位置\'];

if nargin == 0
    fn = 'm888';
    plotFlg = 1;
end
filename = [directory1,fn ,'.csv'];

cy = {'豆一','A'; '沪铝','AL'; '黄金','AU'; '玉米','C'; '棉花','CF'; '沪铜','CU'; 
    '玻璃', 'FG';'股指','IF'; '焦炭','J'; '塑料','L'; '豆粕','M'; '甲醇','MA';
    '菜籽油' ,'OI';'棕榈油','P'; '螺纹钢','RB'; '橡胶', 'RU';'白糖','SR'; 
    'PTA','TA'; 'PVC','V'; '豆油','Y'; '沪锌','ZN'};

CategoryName = cy{strcmpi(cy(:,2),fn(1:end-3)),1};
%% 读数据
if exist(filename,'file')
    DataStruct = importdata(filename);
    data = DataStruct.data;
    
    o = data(:,1); h = data(:,2);
    l = data(:,3); c = data(:,4);
else
    return;
end

% figure; candle(h, l, c, o)
barDate = DataStruct.textdata;

if datenum(barDate(end))~= today
    fprintf(2,'数据文件未更新，不能加载策略!\n');
    return;
end

%% TB的策略参数及位置
ffilename = [directory3,'交易位置_AADualMA','.txt'];
[OpenDateTB,CloseDateTB,parameter,ContractName] = TradingPosTB_AADualMA_01(ffilename,CategoryName); %#ok
%% 策略
% NperiodOfATR = 15;  
% Nperiod = 30;  nATRExit = 2; 

nATRExit = parameter(1); 
fastLen = parameter(2);  
slowLen = parameter(3);  
NperiodOfATR = parameter(4);  

commission = 0; % 佣金
atr = atrfunc(h,l,c,NperiodOfATR);
cUint = ContractUnit02(fn);

startPoint = slowLen;   

fastLenTmp = fastLen;
slowLenTmp = slowLen;
ExitNatrTmp = nATRExit;

EntryRule = ['EntryRuleOfDualMA(ci,'  num2str(fastLenTmp) ,',', num2str(slowLenTmp) ',LongShortFlg);  '];
ExitRule = [ 'ExitRuleOfNatrTrailingStop(oi, ci, EntryPos, LongShortFlg , atr,' , ...
    num2str(ExitNatrTmp),' );'];
TradePos =  ExitPrior(o,h,l,c, EntryRule,  ExitRule, atr, startPoint);
TradePos = sortrows(TradePos,1);

[TotalProfit, TotalRateOfReturnTmp, ~, ~, trmTmp, ~] = ...
    AnalysisOfTradeResult01(o,h,l,c, TradePos, ...
    commission, ExitNatrTmp*atr*cUint,cUint, plotFlg,TabHandles,PanelSize);  %#ok

%% 与TB的交易位置进行比较
TradePosTmp = TradePos;
TradePosTmp(TradePosTmp>length(c)) = 0;
if sum(TradePosTmp(end,1:2)) == 0
    TradePosTmp(end,:) = [];
end

OpenDate(:,1) = barDate(TradePosTmp(:,1));
OpenDate(:,2) = num2cell(TradePosTmp(:,3));
if TradePosTmp(end,2) ~=0
    CloseDate(:,1) = barDate(TradePosTmp(:,2));
    CloseDate(:,2) = num2cell(TradePosTmp(:,3));
else
    CloseDate(:,1) = barDate(TradePosTmp(1:end-1,2));
    CloseDate(:,2) = num2cell(TradePosTmp(1:end-1,3));
end

OpenDate = [datenum(OpenDate(:,1)),cell2mat(OpenDate(:,2))];
OpenDateTB = [datenum(OpenDateTB(:,1),'yyyymmdd'),cell2mat(OpenDateTB(:,2))];

CloseDate = [datenum(CloseDate(:,1)),cell2mat(CloseDate(:,2))];
CloseDateTB = [datenum(CloseDateTB(:,1),'yyyymmdd'),cell2mat(CloseDateTB(:,2))];

[~,iA1,iB1] = intersect(OpenDate,OpenDateTB,'rows');  %#ok
[~,iA2,iB2] = intersect(CloseDate,CloseDateTB,'rows');  %#ok

N = 10; 
% isequal(iA1(end-N:end) , (length(OpenDate)-N:length(OpenDate))')
% isequal(iA2(end-N:end) , (length(CloseDate)-N:length(CloseDate))')
if (~isequal(iB2(end-N:end) , (length(CloseDateTB)-N:length(CloseDateTB))'))||...
        (~isequal(iB1(end-N:end) , (length(OpenDateTB)-N:length(OpenDateTB))'))
    % 与TB的交易位置不符
    fprintf(2,'与TB的交易位置不符!\n');
    return;
end

if TradePos(end,2)~=0
    PosStatus = 0;
else
    PosStatus = [data(end,6),TradePos(end,:)];
end


%% 写txt文件

% if datenum(barDate(end))~= today
%     fprintf(2,'数据文件未更新，不能加载策略!\n');
%     return;
% end

tpTmp = TradePos(end-1:end,1:2);
tpTmp = tpTmp(:);

for i = 1:4
%     if (tpTmp(i) -length(c) == 1)&&(datenum(barDate(tpTmp(i)-1)) == today)
    if (tpTmp(i) -length(c) == 1)
        % 仿照TB的程序写交易txt文件
        TodayDate = datestr(now,'yyyymmdd');
        fileName = [directory2,'交易',TodayDate,'.txt'];
        fid = fopen(fileName,'a');
        fprintf(fid,'%s',TodayDate);
        % contractName = [cy{strcmpi(cy(:,2),fn(1:end-3)),1},num2str(data(end,end))];
        contractName = [CategoryName,num2str(data(end,end))];
        
        fprintf(fid,'%s','  ');
        fprintf(fid,'%s',contractName);
        fprintf(fid,'%s',' ：');
        switch i
            case 1
                fprintf(fid,'%s','开');
                if TradePos(end-1,3) == 1
                    fprintf(fid,'%s','多');
                else
                    fprintf(fid,'%s','空');
                end
                fprintf(fid,'%s','  ');
                fprintf(fid,'%s','每手风险：');
                InitRisk = round(nATRExit*atr(tpTmp(i)-1)*cUint);
                fprintf(fid,'%s',num2str(InitRisk));
            case 2
                fprintf(fid,'%s','开');
                if TradePos(end,3) == 1
                    fprintf(fid,'%s','多');
                else
                    fprintf(fid,'%s','空');
                end
                fprintf(fid,'%s','  ');
                fprintf(fid,'%s','每手风险：');
                InitRisk = round(nATRExit*atr(tpTmp(i)-1)*cUint);
                fprintf(fid,'%s',num2str(InitRisk));
            case 3
                fprintf(fid,'%s','平');
                if TradePos(end-1,3) == 1
                    fprintf(fid,'%s','多');
                else
                    fprintf(fid,'%s','空');
                end
            case 4
                fprintf(fid,'%s','平');
                if TradePos(end,3) == 1
                    fprintf(fid,'%s','多');
                else
                    fprintf(fid,'%s','空');
                end
            otherwise
        end 
        fprintf(fid,'\r\n');
        fprintf(fid,'\r\n');
        fclose(fid);
    end
    
end



end




