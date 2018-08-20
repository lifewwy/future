function ContractQueue1

% 合约数据放置顺序以及每个合约的第一条记录数据

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


