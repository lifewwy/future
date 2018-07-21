function stock_data=get_stock_hist(stock_code,begin_date,end_date)
%作者：langslike，E-mail：langslike@126.com
%参数含义：
%stock_code:字符阵列型，表示证券代码，如sh600000
%begin_date:字符阵列型，表示希望获取股票数据所在时段的开始日期，如19900215
%end_date:字符阵列型，表示希望获取股票数据所在时段的结束日期
tic
url=['http://biz.finance.sina.com.cn/stock/flash_hq/kline_data.php?symbol=' stock_code '&end_date=' end_date '&begin_date=' begin_date];
XML_data=urlread(url);
fid=fopen('kline_data_htm.xml','w');
fwrite(fid,XML_data);
temp=parseXML('kline_data_htm.xml');
temp=temp.Children;
%这个结构体构成的数组中，只有下标为偶数的含有有效数据
num=numel(temp);
if num==1
    disp(['无法取得代码为:' stock_code '的股票数据！']);
    %返回一个空结构体
    stock_data=struct;
return;
end;
temp=temp(2:2:num);
num=numel(temp);
if num==0
    stock_data=struct;
else
%为变量预分配空间，加快程序运行速度
    stock_data(num)=struct('close',[],'date',[],'high',[],'low',[],'open',[],'volume',[]);
    for k=1:num
        stock_data(k).close=str2double(temp(1,k).Attributes(1,2).Value);
        stock_data(k).date=temp(1,k).Attributes(1,3).Value;
        stock_data(k).high=str2double(temp(1,k).Attributes(1,4).Value);
        stock_data(k).low=str2double(temp(1,k).Attributes(1,5).Value);
        stock_data(k).open=str2double(temp(1,k).Attributes(1,6).Value);
        stock_data(k).volume=str2double(temp(1,k).Attributes(1,7).Value);
    end;
end;
toc
end