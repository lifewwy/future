clear; clc; close all;

%% NASDAQ
market = 'NASDAQ';
url = ['http://www.nasdaq.com/screening/companies-by-industry.aspx?exchange=',market,'&render=download'];
NASDAQ = websave([market,'.csv'],url); 

%% NYSE
market = 'NYSE';
url = ['http://www.nasdaq.com/screening/companies-by-industry.aspx?exchange=',market,'&render=download'];
NYSE = websave([market,'.csv'],url); 

%% ASX
market = 'ASX';
url = ['http://www.asx.com.au/asx/research/',market,'ListedCompanies.csv'];
ASX = websave([market,'.csv'],url);












