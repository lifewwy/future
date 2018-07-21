clear all ; clc;  close all;

% 持仓表
holdingTable = zeros(18,2);

for i = 1:100
    
    ContractIndex = randi(18,1);
    buyOrSellFlg = randi(2,1);
    openOrEvenUpFlg = randi(2,1);
    
    handsNum = randi(100,1);
    price = randi(2500,1);
     
    if buyOrSellFlg == 1
        holdingTable(ContractIndex, 1) = ... 
            holdingTable(ContractIndex, 1) + handsNum;
        buyOrSell = 'buy'; 
    else
        buyOrSell = 'sell';
        holdingTable(ContractIndex, 1) = ... 
            holdingTable(ContractIndex, 1) - handsNum;
    end
    
    if openOrEvenUpFlg == 1
        openOrEvenUp = 'open';
    else
        openOrEvenUp = 'evenUp';
    end
      
    orderParameters = {ContractIndex, buyOrSell, ...
        openOrEvenUp, handsNum, price };

 

end

stem(find(holdingTable(:,1)>0), holdingTable(holdingTable(:,1)>0,1), ...
    'LineWidth',15,'Marker','none','Color','r'); hold on;
stem(find(holdingTable(:,1)<0), holdingTable(holdingTable(:,1)<0,1), ...
    'LineWidth',15,'Marker','none','Color','b');
grid; axis([0,19,-300,300]);


%% 维护交易记录
% % 读 csv 文件
% filename = [futureCode, '888.csv'];
% if exist(filename,'file')
% else
%     return;
% end
% 
% dstruct = importdata(filename);
% % display(dstruct.textdata(1,:));
% contractDate = datenum(dstruct.textdata);
% csvData = dstruct.data;
% csvData = [contractDate, csvData];
% 
% 
% % 写 csv 文件
% size_csvData = size(csvData);
% fid = fopen([[futureCode,'888'], '.csv'], 'wt');
% for k = 1:size_csvData(1)
%     fprintf(fid, '%s,', datestr(csvData(k,1),'yyyy-mm-dd'));
%     fprintf(fid, '%f,', csvData(k,2));
%     fprintf(fid, '%f,', csvData(k,3));
%     fprintf(fid, '%f,', csvData(k,4));
%     fprintf(fid, '%f,', csvData(k,5));
%     fprintf(fid, '%f,', csvData(k,6));
%     fprintf(fid, '%f\n', csvData(k,7));
% end
% fclose(fid);
% 
% % holdingTable ：持仓表









































