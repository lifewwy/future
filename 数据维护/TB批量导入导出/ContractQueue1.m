function ContractQueue1

% ��Լ���ݷ���˳���Լ�ÿ����Լ�ĵ�һ����¼����

load exportOrder;
x = cell(length(exportOrder),3); %#ok
for i = 1:length(exportOrder) 
    futureCode = exportOrder{i};
    re = readCSVGetFirstRecord(futureCode);
    x(i,1) = exportOrder(i);
    x(i,2) = {datestr(re(1),'yyyy/mm/dd')};
    x(i,3) = {re(2:end)};
end

firstRecordOfContracts = x;
save firstRecordOfContracts firstRecordOfContracts;


