from jqdatasdk import *

auth('18019099175', 'wangxichen75')

# 某一期货品种在指定日期下的可交易合约标的列表
# x = get_future_contracts('AU','2017-01-05')
x = get_future_contracts('SR')
print(x)

# 主力合约定义：如果某合约持仓量连续2天为同一个品种中最大的，
# 且该合约相对于当前主力合约为远期合约，
# 则自动变成主力合约。不会在日内进行主力合约切换。
# 获取某一天的主力合约对应的期货合约代码，指定日期为'2018-05-06'
print('AU 在 2018-05-06 上的主力合约：', get_dominant_future('AU','2018-05-06') )

# 获得SR1901.XZCE的数据, 只获取open+close字段
df = get_price('SR1901.XZCE', start_date='2018-07-02', end_date='2018-08-02', frequency='daily', fields=['open', 'close'])
# print(df)

