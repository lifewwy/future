close all; clear all; clc;

stock_data = get_stock_hist('sh600000','19900215','20130215');
%���ߣ�langslike��E-mail��langslike@126.com
%�������壺
%stock_code:�ַ������ͣ���ʾ֤ȯ���룬��sh600000
%begin_date:�ַ������ͣ���ʾϣ����ȡ��Ʊ��������ʱ�εĿ�ʼ���ڣ���19900215
%end_date:�ַ������ͣ���ʾϣ����ȡ��Ʊ��������ʱ�εĽ�������

N = length(stock_data);
c = zeros(N,1);  h = zeros(N,1);
l = zeros(N,1);  o = zeros(N,1);
for i = 1:length(stock_data)
    c(i) = stock_data(i).close;
    h(i) = stock_data(i).high;
    l(i) = stock_data(i).low;
    o(i) = stock_data(i).open;
end