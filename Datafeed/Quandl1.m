% https://github.com/quandl/Matlab

clc; clear; close all;

yourauthenticationtoken = '2ZrVtBfzQcKwy4YvNeaR';
Quandl.api_key(yourauthenticationtoken);

% data = Quandl.get('NSE/OIL');
% mydata = Quandl.get('NSE/OIL', 'start_date','2001-01-01','end_date','2018-07-23');

% mydata = Quandl.get('EOD/MSFT');
mydata = Quandl.get('EOD/DIS');
% mydata = Quandl.get('EOD/MSFT', 'start_date','2017-05-8','end_date','2018-07-23');
c = mydata.Adj_Close.Data;  % Adjusted Close
plot(c);































































































