function PosStatus = StrategyFunc(fn,plotFlg,TabHandles,PanelSize)

% clear; close all; clc;

PosStatus = [];

% directory1 = 'C:\D\future\����ά��\';
% directory2 = 'C:\D\future\';
% directory3 = 'C:\D\future\����λ��\';

% 20180214
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end-3));
directory1 = [directory,'����ά��\'];
directory2 = directory;
directory3 = [directory,'����λ��\'];


% fn = 'sr888';
filename = [directory1,fn ,'.csv'];

cy = {'��һ','A'; '����','AL'; '�ƽ�','AU'; '����','C'; '�޻�','CF'; '��ͭ','CU'; 
    '����', 'FG';'��ָ','IF'; '��̿','J'; '����','L'; '����','M'; '�״�','MA';
    '������' ,'OI';'�����','P'; '���Ƹ�','RB'; '��', 'RU';'����','SR'; 
    'PTA','TA'; 'PVC','V'; '����','Y'; '��п','ZN'};

CategoryName = cy{strcmpi(cy(:,2),fn(1:end-3)),1};
%% ������
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
    fprintf(2,'�����ļ�δ���£����ܼ��ز���!\n');
    return;
end

%% TB�Ĳ��Բ�����λ��
ffilename = [directory3,'����λ��','.txt'];
[OpenDateTB,CloseDateTB,parameter,ContractName] = TradingPosTB01(ffilename,CategoryName); %#ok
%% ����
% NperiodOfATR = 15;  
% Nperiod = 30;  nATRExit = 2; 
NperiodOfATR = parameter(3);  
Nperiod = parameter(2);  nATRExit = parameter(1); 

commission = 0; % Ӷ��
atr = atrfunc(h,l,c,NperiodOfATR);
cUint = ContractUnit02(fn);

startPoint = Nperiod;   

NperiodTmp = Nperiod;
ExitNatrTmp = nATRExit;

EntryRule = ['EntryRuleOfNPeriodBreak(ci,'  num2str(NperiodTmp)  ',LongShortFlg);  '];
ExitRule = [ 'ExitRuleOfNatrTrailingStop(oi, ci, EntryPos, LongShortFlg , atr,' , ...
    num2str(ExitNatrTmp),' );'];
TradePos =  ExitPrior(o,h,l,c, EntryRule,  ExitRule, atr, startPoint);
TradePos = sortrows(TradePos,1);

[TotalProfit, TotalRateOfReturnTmp, ~, ~, trmTmp, ~] = ...
    AnalysisOfTradeResult01(o,h,l,c, TradePos, ...
    commission, ExitNatrTmp*atr*cUint, cUint, plotFlg,TabHandles,PanelSize);  %#ok

%% ��TB�Ľ���λ�ý��бȽ�
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
    % ��TB�Ľ���λ�ò���
    fprintf(2,'��TB�Ľ���λ�ò���!\n');
    return;
end

if TradePos(end,2)~=0
    PosStatus = 0;
else
    PosStatus = [data(end,6),TradePos(end,:)];
end
%% дtxt�ļ�
% if datenum(barDate(end))~= today
%     fprintf(2,'�����ļ�δ���£����ܼ��ز���!\n');
%     return;
% end

tpTmp = TradePos(end-1:end,1:2);
tpTmp = tpTmp(:);

for i = 1:4
%     if (tpTmp(i) -length(c) == 1)&&(datenum(barDate(tpTmp(i)-1)) == today)
    if (tpTmp(i) -length(c) == 1)
        % ����TB�ĳ���д����txt�ļ�
        TodayDate = datestr(now,'yyyymmdd');
        fileName = [directory2,'����',TodayDate,'.txt'];
        fid = fopen(fileName,'a');
        fprintf(fid,'%s',TodayDate);
        % contractName = [cy{strcmpi(cy(:,2),fn(1:end-3)),1},num2str(data(end,end))];
        contractName = [CategoryName,num2str(data(end,end))];
        
        fprintf(fid,'%s','  ');
        fprintf(fid,'%s',contractName);
        fprintf(fid,'%s',' ��');
        switch i
            case 1
                fprintf(fid,'%s','��');
                if TradePos(end-1,3) == 1
                    fprintf(fid,'%s','��');
                else
                    fprintf(fid,'%s','��');
                end
                fprintf(fid,'%s','  ');
                fprintf(fid,'%s','ÿ�ַ��գ�');
                InitRisk = round(nATRExit*atr(tpTmp(i)-1)*cUint);
                fprintf(fid,'%s',num2str(InitRisk));
            case 2
                fprintf(fid,'%s','��');
                if TradePos(end,3) == 1
                    fprintf(fid,'%s','��');
                else
                    fprintf(fid,'%s','��');
                end
                fprintf(fid,'%s','  ');
                fprintf(fid,'%s','ÿ�ַ��գ�');
                InitRisk = round(nATRExit*atr(tpTmp(i)-1)*cUint);
                fprintf(fid,'%s',num2str(InitRisk));
            case 3
                fprintf(fid,'%s','ƽ');
                if TradePos(end-1,3) == 1
                    fprintf(fid,'%s','��');
                else
                    fprintf(fid,'%s','��');
                end
            case 4
                fprintf(fid,'%s','ƽ');
                if TradePos(end,3) == 1
                    fprintf(fid,'%s','��');
                else
                    fprintf(fid,'%s','��');
                end
            otherwise
        end 
        fprintf(fid,'\r\n');
        fprintf(fid,'\r\n');
        fclose(fid);
    end
    
end








