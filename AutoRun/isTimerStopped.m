function isTimerStopped

tf = timerfind;

timerFcn = '[ActionLine,cp,aa, nTimes,ActionDoneFlg ] = RealTimeDataFunc1( orders,cp,ActionLine,aa, nTimes,ActionDoneFlg );';
if ~isempty(tf)
    N = length(tf);
    
    for i = 1:N
        if strcmpi(tf(i).TimerFcn,timerFcn)
            if strcmpi(tf(i).Running,'off')
                pause(1);
                fprintf(2,'--------------- 定时器关闭 02！--------------- \n');   
                pause(1);
            
                if ~isempty(timerfind)
                    stop(timerfind);
                end
                % delete(timerfind);

                % 发送邮件
                % diary off;
                % get(0,'DiaryFile');
                SendEmailFunc;
                
            end
        end
    end
    
end


end

