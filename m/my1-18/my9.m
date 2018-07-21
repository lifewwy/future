close all; clear all; clc;
% stock_code:字符阵列型，表示证券代码，如sh600000
% begin_date:字符阵列型，表示希望获取股票数据所在时段的开始日期，如19900215
% end_date:字符阵列型，表示希望获取股票数据所在时段的结束日期

code1 = 'sh';
for code2 = 600026:600031;
    code = [code1,num2str(code2)];
    stock_data = get_stock_hist(code,'19900215','20130215');
    % 保存数据
    save([code,'.mat'],'stock_data');
end

%% 读取数据
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

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    