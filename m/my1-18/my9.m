close all; clear all; clc;
% stock_code:�ַ������ͣ���ʾ֤ȯ���룬��sh600000
% begin_date:�ַ������ͣ���ʾϣ����ȡ��Ʊ��������ʱ�εĿ�ʼ���ڣ���19900215
% end_date:�ַ������ͣ���ʾϣ����ȡ��Ʊ��������ʱ�εĽ�������

code1 = 'sh';
for code2 = 600026:600031;
    code = [code1,num2str(code2)];
    stock_data = get_stock_hist(code,'19900215','20130215');
    % ��������
    save([code,'.mat'],'stock_data');
end

%% ��ȡ����
% datalength = length(stock_data);
% c = zeros(size(stock_data));
% h = zeros(size(stock_data));
% l = zeros(size(stock_data));
% v = zeros(size(stock_data));
% o = zeros(size(stock_data));
% for i = 1:datalength
%     tmp = stock_data(i);
%     c(i) = tmp.close;
%     o(i) = tmp.open;
%     h(i) = tmp.high;
%     l(i) = tmp.low;
%     v(i) = tmp.volume;
% end
% 
% plot(c);

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    