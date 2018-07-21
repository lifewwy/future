function StopTSPTrace()
    global IDList_TSP;
    global Handle_TSP;
    global RunTimer_TSP;   
    stop(RunTimer_TSP);
%     MBSTraderLogout(Handle_TSP);
    MBDelMonitor(IDList_TSP);
end