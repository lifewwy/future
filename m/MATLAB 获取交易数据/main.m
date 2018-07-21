close all; clear all; clc;

stock_data = get_stock_hist('sh600000','19900215','20130215');
%作者：langslike，E-mail：langslike@126.com
%参数含义：
%stock_code:字符阵列型，表示证券代码，如sh600000
%begin_date:字符阵列型，表示希望获取股票数据所在时段的开始日期，如19900215
%end_date:字符阵列型，表示希望获取股票数据所在时段的结束日期

N = length(stock_data);
c = zeros(N,1);  h = zeros(N,1);
l = zeros(N,1);  o = zeros(N,1);
for i = 1:length(stock_data)
    c(i) = stock_data(i).close;
    h(i) = stock_data(i).high;
    l(i) = stock_data(i).low;
    o(i) = stock_data(i).open;
end