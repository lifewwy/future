function applyStrategies(h)
load IsDataUpdateCompleted.mat;
% IsDataUpdateCompleted = 1;

if IsDataUpdateCompleted==1
    fprintf('���ز���...\n');
    panel('ApplyStrategyButton_Callback',h.ApplyStrategyButton,[],guidata(h.ApplyStrategyButton));
    
    % ��ѯ�˻�&���ɶ���
    t01 = timer;
    t01.StartDelay = 60*2; % seconds
%     t01.StartDelay = 5; % seconds
    t01.TimerFcn = @(myTimerObj, thisEvent)CheckAccount(h);
    start(t01)
    
else
    fprintf(2,'����δ���£��޷����ز��ԣ�\n');
end

%% ���ʼ�
% t01 = timer; 
% t01.StartDelay = 60*2; % seconds
% t01.TimerFcn = @(myTimerObj, thisEvent)SendEmailFunc;
% start(t01)

end