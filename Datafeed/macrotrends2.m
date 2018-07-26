% https://www.macrotrends.net/stocks/charts/MSFT/microsoft/stock-price-history

clear; clc; close all;

load NASDAQ;
for i = 1:length(NASDAQ)
    SYMBOL_NAME = NASDAQ{i,1};
    url = ['http://download.macrotrends.net/assets/php/stock_data_export.php?t=',SYMBOL_NAME];
    outfilename = websave([SYMBOL_NAME,'.csv'],url);
    
    dstruc = importdata(outfilename);
    d = dstruc.data;
    c = d(:,4);
    plot(c); title(NASDAQ{i,2});
end







