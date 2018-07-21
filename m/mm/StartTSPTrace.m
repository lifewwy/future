function StartTSPTrace()
    global IDList_TSP;
    global Handle_TSP;
    global RunTimer_TSP;
    ID.Market = 'CHINA_FINANCIAL_FUTURES';
    ID.Code = '040120';
    IDList_TSP = ID;
    
    MBRegiInterFun() %注册内部回调函数，获取实时数据刷新使用
    MBGetTSPData('CHINA_FINANCIAL_FUTURES', '040120', 'Fresh'); %补齐当日分时线；加入监控列表后，后续分时线自动补齐(再获取不需使用Fresh参数，速度快)
    MBAddMonitor(IDList_TSP);  
    %针对不同的期货公司需要使用不用的参数登录
%     Handle_TSP = MBFTraderLogin('asp-sim2-front1.financial-trading-platform.com', '26205', '3030', '88888', '888888'); 
    RunTimer_TSP = timer();
    set(RunTimer_TSP, 'TimerFcn', @TSPTrace);
    set(RunTimer_TSP, 'Period', 0.2);  %高频率刷新，判断数据有更新后才执行策略
    set(RunTimer_TSP, 'ExecutionMode', 'fixedSpacing');
    start(RunTimer_TSP);
end