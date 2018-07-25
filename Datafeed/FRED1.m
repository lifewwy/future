clc; clear; close all;
%% Retrieve Historical Data Using FRED?
% This example shows how to connect to FRED?, retrieve historical 
% foreign exchange rates, and determine when the highest rate occurred.

% Connect to the FRED? data server using the URL 'https://fred.stlouisfed.org/'.

url = 'https://fred.stlouisfed.org/';
c = fred(url);
% Adjust the display data format for currency.

format bank
% Retrieve all historical data for the US / Euro Foreign Exchange Rate series.

series = 'DEXUSEU';

d = fetch(c,series) %#ok


% d contains the series description.

% Display the numeric representation of the date and the foreign exchange 
% rate for the first three rows of data.

d.Data(1:3,:)

% Retrieve historical data from January 1 through June 1, 2012, for 
% the US / Euro Foreign Exchange Rate series.

startdate = '01/01/2012'; % beginning of date range for historical data
enddate = '06/01/2012'; % ending of date range for historical data

d = fetch(c,series,startdate,enddate) %#ok


% Determine the highest foreign exchange rate maxforex in the date range. 
% forex contains all the exchange rates in the data.

forex = d.Data(:,2);
maxforex = max(forex) %#ok


% Determine when the highest foreign exchange rate occurred. 
% To find the index idx for the highest foreign exchange rate, 
% the function find uses the tolerance value. Retrieve the serial 
% date number by indexing into the array of data using idx. 
% Convert the serial date number to a character vector using the datestr function.

value = abs(forex-maxforex);
idx = find(value<0.001,1);
date = d.Data(idx,1);
datestr(date)


% Close the FRED? connection.

close(c)


































