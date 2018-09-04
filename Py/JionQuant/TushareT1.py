# Tushare是一个免费、开源的python财经数据接口包。

import tushare as ts

# 查看当前版本的方法：
print(ts.__version__)

# 设置token
ts.set_token('c4cd8ed107bf688721f1617a03a40eba55ce568e6a4cfa33970ee5c8')

# 初始化pro接口
pro = ts.pro_api()

date = '2018-08-03';

# 获取郑商所日交易数据
print( ts.get_czce_daily(date=date, type="future") )

# 获取上期所日交易数据
print( ts.get_shfe_daily(date = date) )

# 获取大连商品交易所日交易数据
print( ts.get_dce_daily(date = date, type="future", retries=0) )

# 获取中金所日交易数据
print( ts.get_cffex_daily(date = date) )

# 返回的变量类型
print("\n返回的数据类型为： ",type( ts.get_cffex_daily(date = date) ) )

# 存为cvs文件
# pandas的to_csv()使用方法 https://blog.csdn.net/toshibahuai/article/details/79034829
# import os
# print("\n当前工作路径为： ",os.getcwd()) #获取当前工作路径
df = ts.get_cffex_daily(date = date)
df.to_csv('C:/D/xyz/future/数据维护/tushareData/CFFEX.csv',index = False, sep=',')


"""
    获取中金所日交易数据
Parameters
------
    start: 开始日期 format：YYYY-MM-DD 或 YYYYMMDD 或 datetime.date对象 为空时为当天
    end: 结束数据 format：YYYY-MM-DD 或 YYYYMMDD 或 datetime.date对象 为空时为当天
    market: ‘CFFEX‘ 中金所, ‘CZCE‘ 郑商所,  ‘SHFE‘ 上期所, ‘DCE‘ 大商所 之一。默认为中金所 
Return
"""
# print( ts.get_future_daily(start = '2018-07-25', end = '2018-08-03', market = 'DCE') )
# print( ts.get_future_daily(start = '2018-07-25', end = '2018-08-03', market = 'CZCE') )
# print( ts.get_future_daily(start = '2018-07-25', end = '2018-08-03', market = 'SHFE') )








