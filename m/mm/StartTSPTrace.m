function StartTSPTrace()
    global IDList_TSP;
    global Handle_TSP;
    global RunTimer_TSP;
    ID.Market = 'CHINA_FINANCIAL_FUTURES';
    ID.Code = '040120';
    IDList_TSP = ID;
    
    MBRegiInterFun() %ע���ڲ��ص���������ȡʵʱ����ˢ��ʹ��
    MBGetTSPData('CHINA_FINANCIAL_FUTURES', '040120', 'Fresh'); %���뵱�շ�ʱ�ߣ��������б�󣬺�����ʱ���Զ�����(�ٻ�ȡ����ʹ��Fresh�������ٶȿ�)
    MBAddMonitor(IDList_TSP);  
    %��Բ�ͬ���ڻ���˾��Ҫʹ�ò��õĲ�����¼
%     Handle_TSP = MBFTraderLogin('asp-sim2-front1.financial-trading-platform.com', '26205', '3030', '88888', '888888'); 
    RunTimer_TSP = timer();
    set(RunTimer_TSP, 'TimerFcn', @TSPTrace);
    set(RunTimer_TSP, 'Period', 0.2);  %��Ƶ��ˢ�£��ж������и��º��ִ�в���
    set(RunTimer_TSP, 'ExecutionMode', 'fixedSpacing');
    start(RunTimer_TSP);
end