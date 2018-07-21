clear; close all; clc;

directory1 = 'C:\D\future\����ά��\';
directory2 = 'C:\D\future\';
directory3 = 'C:\D\future\����λ��\';

fn = 'sr888';
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

% if datenum(barDate(end))~= today
%     fprintf(2,'�����ļ�δ����!\n');
%     return;
% end

%% TB�Ĳ��Բ�����λ��
ffilename = [directory3,'����λ��','.txt'];
[OpenDateTB,CloseDateTB,parameter,ContractName] = TradingPosTB01(ffilename,CategoryName);
%% ����
% NperiodOfATR = 15;  
% Nperiod = 30;  nATRExit = 2; 
NperiodOfATR = parameter(3);  
Nperiod = parameter(2);  nATRExit = parameter(1); 

commission = 40; % Ӷ��
atr = atrfunc(h,l,c,NperiodOfATR);
cUint = ContractUnit(fn);

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
    commission, ExitNatrTmp*atr*cUint, 1);

%% ��TB�Ľ���λ�ý��бȽ�
OpenDate(:,1) = barDate(TradePos(:,1));
OpenDate(:,2) = num2cell(TradePos(:,3));
if TradePos(end,2) ~=0
    CloseDate(:,1) = barDate(TradePos(:,2));
    CloseDate(:,2) = num2cell(TradePos(:,3));
else
    CloseDate(:,1) = barDate(TradePos(1:end-1,2));
    CloseDate(:,2) = num2cell(TradePos(1:end-1,3));
end

OpenDate = [datenum(OpenDate(:,1)),cell2mat(OpenDate(:,2))];
OpenDateTB = [datenum(OpenDateTB(:,1),'yyyymmdd'),cell2mat(OpenDateTB(:,2))];

CloseDate = [datenum(CloseDate(:,1)),cell2mat(CloseDate(:,2))];
CloseDateTB = [datenum(CloseDateTB(:,1),'yyyymmdd'),cell2mat(CloseDateTB(:,2))];

[~,iA1,iB1] = intersect(OpenDate,OpenDateTB,'rows');
[~,iA2,iB2] = intersect(CloseDate,CloseDateTB,'rows');

N = 10; 
% isequal(iA1(end-N:end) , (length(OpenDate)-N:length(OpenDate))')
% isequal(iA2(end-N:end) , (length(CloseDate)-N:length(CloseDate))')
if (~isequal(iB2(end-N:end) , (length(CloseDateTB)-N:length(CloseDateTB))'))||...
        (~isequal(iB1(end-N:end) , (length(OpenDateTB)-N:length(OpenDateTB))'))
    % ��TB�Ľ���λ�ò���
    fprintf(2,'��TB�Ľ���λ�ò���!\n');
    return;
end

%% дtxt�ļ�
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








