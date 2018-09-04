from jqdatasdk import *
import datetime


def time_in_range(start, end, x):
    """Return true if x is in the range [start, end]"""
    if start <= end:
        return start <= x <= end
    else:
        return start <= x or x <= end


# start = datetime.time(23, 0, 0)
# end = datetime.time(1, 0, 0)
# print(time_in_range(start, end, datetime.time(23, 30, 0)))
# print(time_in_range(start, end, datetime.time(12, 30, 0)))

# start = datetime.time(15, 30, 0)
# end = datetime.time(20, 50, 0)
# print(time_in_range(start, end, datetime.time(16, 30, 0)))
# now_time = datetime.datetime.now().time()
# print(start);print(end);print(now_time)
# print(time_in_range(start, end, now_time))


def main(N):
    # 读取 N 个交易日的数据

    auth('18019099175', 'wangxichen75')

    # 判断当天是否为交易日
    # print(get_trade_days(start_date=None, end_date=None, count=1))
    # print(get_trade_days(start_date='2018-09-02', end_date='2018-09-02'))
    # if not get_trade_days(start_date='2018-09-02', end_date='2018-09-02'):
    if not get_trade_days(start_date=None, end_date=None, count=1):
        print('今天不是交易日！')
        return(0)

    # 判断时间段是否合适
    start = datetime.time(15, 30, 0)
    end = datetime.time(20, 50, 0)
    now_time = datetime.datetime.now().time()
    if not time_in_range(start, end, now_time):
        print('请在正确的时间段运行！')
        return (0)


    # 某一期货品种在指定日期下的可交易合约标的列表
    # x = get_future_contracts('AU','2017-01-05')
    # x = get_future_contracts('SR') + get_future_contracts('RU') + get_future_contracts('L')
    # print(x)

    # futureCode = ['A','C','RB','M','P','J','ZN','Y','L','AG','TA','CF'
    #     ,'SR','AU','FG','MA','AL','OI','RM','I','JM','CU','V','RU','IF']
    futureCode = ['A']
    # print(len(futureCode))
    contracts = []
    for fc in futureCode:
        contracts = contracts + get_future_contracts(fc)
    # print(contracts)

    # 主力合约定义：如果某合约持仓量连续2天为同一个品种中最大的，
    # 且该合约相对于当前主力合约为远期合约，
    # 则自动变成主力合约。不会在日内进行主力合约切换。
    # 获取某一天的主力合约对应的期货合约代码，指定日期为'2018-05-06'
    # print('AU 在 2018-05-06 上的主力合约：', get_dominant_future('AU','2018-05-06') )

    # 获得SR1901.XZCE的数据, 只获取open+close字段
    # df = get_price('SR1901.XZCE', start_date='2018-07-02', end_date='2018-08-02', frequency='daily', fields=['open', 'close'])
    # df = get_price('SR1901.XZCE', start_date='2018-07-02', end_date='2018-07-06', frequency='daily')
    # df = get_price('SR1901.XZCE', start_date='2018-07-02', end_date='2018-07-06', frequency='daily')
    # print(df)
    # df.to_csv('C:/D/xyz/future/数据维护/JoinQuantData/SR1901.csv', sep=',')

    # 当前日期
    today = datetime.datetime.now().strftime('%Y-%m-%d')
    # print(today)
    # today = datetime.date.today()
    # print(today)

    # 昨天日期
    # yesterday = (datetime.date.today() + datetime.timedelta(days=-1)).strftime('%Y-%m-%d')
    # print(yesterday)

    # start_date = (datetime.date.today() + datetime.timedelta(days=-N)).strftime('%Y-%m-%d')
    # print(get_trade_days(start_date=None, end_date=None, count=5))
    start_date = get_trade_days(start_date=None, end_date=None, count=N)[0].strftime('%Y-%m-%d')

    # panel  = get_price(contracts, start_date='2018-09-02', end_date='2018-09-03', frequency='daily')
    # print(panel['open'][:])
    panel = get_price(contracts, start_date=start_date, end_date=today, frequency='daily')
    panel['open'][:].to_csv('C:/D/xyz/future/数据维护/JoinQuantData/OPEN.csv', sep=',')
    panel['high'][:].to_csv('C:/D/xyz/future/数据维护/JoinQuantData/HIGH.csv', sep=',')
    panel['low'][:].to_csv('C:/D/xyz/future/数据维护/JoinQuantData/LOW.csv', sep=',')
    panel['close'][:].to_csv('C:/D/xyz/future/数据维护/JoinQuantData/CLOSE.csv', sep=',')
    panel['volume'][:].to_csv('C:/D/xyz/future/数据维护/JoinQuantData/VOLUME.csv', sep=',')


    # import os
    # # print("\n当前工作路径为： ",os.getcwd()) #获取当前工作路径

if __name__=='__main__':
    N = 8
    main(N)