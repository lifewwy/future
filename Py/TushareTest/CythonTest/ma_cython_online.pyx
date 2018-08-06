
# 百倍加速！Python量化策略的算法性能提升指南
# http://www.manongjc.com/article/1610.html

from __future__ import division
import time
import random



# 将均线计算改写为高速算法
def ma_online(data, ma_length):


    # 静态声明变量
    cdef int sum_buffer, sum_tick, old_tick, new_tick


    ma = []
    data_window = data[:ma_length]
    test_data = data[ma_length:]

    # 缓存的窗口内数据求和结果
    sum_buffer = 0

    for new_tick in test_data:
        old_tick = data_window.pop(0)
        data_window.append(new_tick)

        # 如果缓存结果为空，则先通过遍历求第一次结果
        if not sum_buffer:
            sum_tick = 0
            for tick in data_window:
                sum_tick += tick
            ma.append(sum_tick/ma_length)

            # 将求和结果缓存下来
            sum_buffer = sum_tick
        else:
            # 这里的算法将计算复杂度从O(n)降低到了O(1)
            sum_buffer = sum_buffer - old_tick + new_tick
            ma.append(sum_buffer/ma_length)

    return ma

if __name__ == "__main__":



    # 生成测试用的数据
    data = []
    data_length = 100000  # 总数据量
    ma_length = 500  # 移动均线的窗口
    test_times = 10  # 测试次数

    for i in range(data_length):
        data.append(random.randint(1, 100))


    # print(data)

    # 运行测试
    start = time.time()

    for i in range(test_times):
        result = ma_online(data, ma_length)

    time_per_test = (time.time() - start) / test_times
    time_per_point = time_per_test / (data_length - ma_length)

    print(u'单次耗时：%s秒' % time_per_test)
    print(u'单个数据点耗时：%s微秒' %(time_per_point * 1000000))
    print(u'最后10个移动平均值：', result[-10:])






















