% https://www.macrotrends.net/stocks/charts/MSFT/microsoft/stock-price-history

clear; clc; close all;


%% MSFT mirosoft
SYMBOL_NAME = 'MSFT';
url = ['http://download.macrotrends.net/assets/php/stock_data_export.php?t=',SYMBOL_NAME];
outfilename = websave([SYMBOL_NAME,'.csv'],url);

dstruc = importdata(outfilename);
d = dstruc.data;
c = d(:,4);
plot(c);

%% NOK NOKIA
SYMBOL_NAME = 'NOK';
url = ['http://download.macrotrends.net/assets/php/stock_data_export.php?t=',SYMBOL_NAME];
outfilename = websave([SYMBOL_NAME,'.csv'],url);

dstruc = importdata(outfilename);
d = dstruc.data;
c = d(:,4);
plot(c);

%% AAPL  APPLE
SYMBOL_NAME = 'BABA';
url = ['http://download.macrotrends.net/assets/php/stock_data_export.php?t=',SYMBOL_NAME];
outfilename = websave([SYMBOL_NAME,'.csv'],url);

dstruc = importdata(outfilename);
d = dstruc.data;
c = d(:,4);
plot(c);




