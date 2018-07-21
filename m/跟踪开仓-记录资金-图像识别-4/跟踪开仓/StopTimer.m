function StopTimer

tf = timerfind;

timerFcn = '[ActionLine,cp,aa, nTimes,ActionDoneFlg ] = RealTimeDataFunc1( orders,cp,ActionLine,aa, nTimes,ActionDoneFlg );';
if ~isempty(tf)
    N = length(tf);
    
    for i = 1:N
        if strcmpi(tf(i).TimerFcn,timerFcn)
            stop(tf(i));
        end
    end
    
end

end

