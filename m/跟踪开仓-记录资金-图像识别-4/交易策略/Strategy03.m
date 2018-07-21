clear; close all; clc;

Fn = {'al', 'cf', 'cu', 'if' , 'j',  'l', ...
    'ma', 'p', 'rb', 'ru', 'sr', 'ta', 'y', 'zn','au','m'};

plotFlg = 0;
lenFn = length(Fn);
h = waitbar(0,'Please wait...');
steps = lenFn;
for i = 1:lenFn   
    if strcmp(Fn{i},'au') || strcmp(Fn{i},'m')
        StrategyFunc_DualMA([Fn{i},'888'],plotFlg);
    else
        StrategyFunc([Fn{i},'888'],plotFlg);
        % waitbar(i / steps,h,sprintf('%s',Fn{i}));
    end
    waitbar(i / steps);
end
close(h)









