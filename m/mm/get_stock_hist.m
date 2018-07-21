function stock_data=get_stock_hist(stock_code,begin_date,end_date)
%���ߣ�langslike��E-mail��langslike@126.com
%�������壺
%stock_code:�ַ������ͣ���ʾ֤ȯ���룬��sh600000
%begin_date:�ַ������ͣ���ʾϣ����ȡ��Ʊ��������ʱ�εĿ�ʼ���ڣ���19900215
%end_date:�ַ������ͣ���ʾϣ����ȡ��Ʊ��������ʱ�εĽ�������
tic
url=['http://biz.finance.sina.com.cn/stock/flash_hq/kline_data.php?symbol=' stock_code '&end_date=' end_date '&begin_date=' begin_date];
XML_data=urlread(url);
fid=fopen('kline_data_htm.xml','w');
fwrite(fid,XML_data);
temp=parseXML('kline_data_htm.xml');
temp=temp.Children;
%����ṹ�幹�ɵ������У�ֻ���±�Ϊż���ĺ�����Ч����
num=numel(temp);
if num==1
    disp(['�޷�ȡ�ô���Ϊ:' stock_code '�Ĺ�Ʊ���ݣ�']);
    %����һ���սṹ��
    stock_data=struct;
return;
end;
temp=temp(2:2:num);
num=numel(temp);
if num==0
    stock_data=struct;
else
%Ϊ����Ԥ����ռ䣬�ӿ���������ٶ�
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