function applyStrategies(h)
load IsDataUpdateCompleted.mat;
% IsDataUpdateCompleted = 1;

if IsDataUpdateCompleted==1
    fprintf('加载策略...\n');
    panel('ApplyStrategyButton_Callback',h.ApplyStrategyButton,[],guidata(h.ApplyStrategyButton));
    
    % 查询账户&生成订单
    t01 = timer;
    t01.StartDelay = 60*2; % seconds
%     t01.StartDelay = 5; % seconds
    t01.TimerFcn = @(myTimerObj, thisEvent)CheckAccount(h);
    start(t01)
    
else
    fprintf(2,'数据未更新，无法加载策略！\n');
end

%% 发邮件
% t01 = timer; 
% t01.StartDelay = 60*2; % seconds
% t01.TimerFcn = @(myTimerObj, thisEvent)SendEmailFunc;
% start(t01)

end