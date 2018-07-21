function [ActionLine, cp, aa, nTimes,ActionDoneFlg ] = ...
    RealTimeDataFunc1( orders,cp,ActionLine,aa , nTimes,ActionDoneFlg)

% clear;  close all; % clc;
% CContract = {'CU1701'; 'M1705'; 'CF1705'};

% orders = {
%     struct('contract', 'cu1702', 'action', 'Buy Open', 'hands', 5, 'price', 2035)
%     struct('contract', 'sr1705', 'action', 'Sell Open', 'hands', 10, 'price', 123)
%     struct('contract', 'y1705', 'action', 'Buy EvenUp', 'hands', 17, 'price', 458)
%     struct('contract', 'ru1705', 'action', 'Sell EvenUp', 'hands', 62, 'price', 1023)
%     };

nOrders = length(orders);

% global nTimes;
nTimes = nTimes + 1;
% nTimes %#ok

% global ActionDoneFlg;

Contract = [];
for n = 1:nOrders
    Contract = [Contract,orders{n}.contract,',']; %#ok
end
    
% url = 'http://hq.sinajs.cn/list=CU1701,M1705,CF1705';
url = ['http://hq.sinajs.cn/list=',Contract];

[KLineDataA, ~] = urlread(url);
semicolonPos = find(KLineDataA == ';');

if nOrders~=length(semicolonPos)
    display('Error1!');
    return;
end

nCount = 0;
kData = zeros(length(semicolonPos),7);
for i = 1:length(semicolonPos)
    if i==1
        a = 1;
    else
        a = semicolonPos(i-1)+1;
    end
    KLineData = KLineDataA(a:semicolonPos(i));
    
    pos = find(KLineData == '"');
    KLineData = KLineData(pos(1)+1:pos(2)-1);
    pos = find(KLineData == ',');
    
    if ~isempty(pos)
        nCount = nCount+1;
        
        o = str2double(KLineData(pos(2)+1:pos(3)-1));
        h = str2double(KLineData(pos(3)+1:pos(4)-1));
        l = str2double(KLineData(pos(4)+1:pos(5)-1));
        c = str2double(KLineData(pos(8)+1:pos(9)-1));
        v = str2double(KLineData(pos(14)+1:pos(15)-1));
        
        % KLineData(pos(17)+1:pos(18)-1) % 日期
        kData(nCount,:) = [datenum(KLineData(pos(17)+1:pos(18)-1)), ...
            o,h,l,c,v,str2double(orders{i}.contract(end-3:end))];
        
    end
    
end

if nOrders ~= nCount
    display('Error2!');
    return;
end

% kData = kData(1:nCount,:);
% disp(datestr(now,'HH:MM:SS'))
% disp(kData)

if nCount==0
    display(['读 ',futureCode,' 数据失败！']);
    return;
end    


% flg = [1;-1;-1]; % 1： 开多/平空 or -1：开空/平多
flg = zeros(nOrders,1);
for i = 1:nOrders
    action = orders{i}.action;
    if (strcmp(action ,'Buy Open'))||(strcmp(action ,'Buy EvenUp'))
        flg(i) = 1;
    else
        flg(i) = -1;
    end
end

handles = evalin('base','handles');  

if ~get(handles.checkbox1,'value')
    cp(:,nTimes) = kData(:,5);
else
    % 模拟数据
    if nTimes == 1
        cp(:,nTimes) = rand(nOrders,1);
    else
        cp(:,nTimes) = cp(:,nTimes-1) + randn(nOrders,1)*0.001;
    end
end

% Maximum Or Minimum Since Scratch
if nTimes == 1
    aa = cp(:,nTimes);
else
    for i=1:nOrders
        if (flg(i) == 1)&&(cp(i,nTimes)<aa(i))
            aa(i) = cp(i,nTimes);
        end
        if (flg(i) == -1)&&(cp(i,nTimes)>aa(i))
            aa(i) = cp(i,nTimes);
        end
    end
end

% abc = str2double(get(handles.edit1,'string'));

% ActionLine(:,nTimes) = aa + flg*10;
% ActionLine(:,nTimes) = aa + flg.*cp(:,1)*.0001;
% ActionLine(:,nTimes) = aa + flg.*cp(:,1)*.0005;
ActionLine(:,nTimes) = aa + flg.*cp(:,1)*(str2double(get(handles.edit1,'string'))/100);

% orders{1}.action
% cp(1,nTimes)
% ActionLine(1,nTimes)
for i = 1:nOrders
    if (strcmp(orders{i}.action,'Buy Open')||(strcmp(orders{i}.action,'Buy EvenUp')))&&...
        (cp(i,nTimes) >  ActionLine(i,nTimes))&& (ActionDoneFlg(i)==0) 
        orderParameters = {orders{i}.contract,orders{i}.action,orders{i}.hands} %#ok
        % act now
        pp  = mfilename('fullpath');
        nn = strfind(pp,'\');
        directory1 = pp(1:nn(end-1));
        directory1 = [directory1,'图像识别']; %#ok
        cd(directory1)
%         Testorder1Func(orderParameters);
        Doneflg = Testorder1FuncNew(orderParameters);
        
        % h = ['handles.radiobutton', num2str(i)];
        h = ['handles.radiobutton', num2str(orders{i}.n)];
        if Doneflg==1
            set(eval(h),'value',1);        
        end
        ActionDoneFlg(i) = 1 %#ok
    end
    if (strcmp(orders{i}.action,'Sell Open')||(strcmp(orders{i}.action,'Sell EvenUp')))&&...
        (cp(i,nTimes) <  ActionLine(i,nTimes)) && (ActionDoneFlg(i)==0) 
        orderParameters = {orders{i}.contract,orders{i}.action,orders{i}.hands} %#ok
        % act now
        pp  = mfilename('fullpath');
        nn = strfind(pp,'\');
        directory1 = pp(1:nn(end-1));
        directory1 = [directory1,'图像识别']; %#ok
        cd(directory1)
%         Testorder1Func(orderParameters);
        Doneflg = Testorder1FuncNew(orderParameters);
        
        %h = ['handles.radiobutton', num2str(i)];
        h = ['handles.radiobutton', num2str(orders{i}.n)];
        ActionDoneFlg(i) = 1 %#ok
        if Doneflg==1
            set(eval(h),'value',1);        
        end
    end
end

% Contract = 'AU1706'; handsNum = 1;
% BuyOrSell = 'Buy';       % 'Buy','Sell'
% OpenOrEvenUp = 'EvenUp'; % 'Open','EvenUp'
% orderParameters = {Contract, BuyOrSell, OpenOrEvenUp, handsNum};

if sum(ActionDoneFlg) == nOrders

    fprintf(2,'--------------- 定时器关闭 01！--------------- \n'); 
    
    % stop(timerfind);
    StopTimer;
    
    % 关闭 diary
    set(handles.radiobutton14,'value',0)
    panel('radiobutton14_Callback',handles.radiobutton14,[],guidata(handles.radiobutton14));
end

%% 画图
% tic

% 每个figure上放4个小图，需要 n1 个 figure
% n1 = ceil(nOrders/4);
% n2 = mod(nOrders,4);

mn = [1,1,1;
    2,2,1;
    3,2,2;
    4,2,2;
    5,2,3;
    6,2,3;
    7,2,4;
    8,2,4];

% 最小化后依然可以在后台画图
for i = 1:nOrders
    subplot([int2str(mn(nOrders,2)),int2str(mn(nOrders,3)),int2str(i)])
    plot(1:nTimes,cp(i,1:nTimes),1:nTimes,ActionLine(i,1:nTimes));
    title(orders{i}.contract);
    drawnow;  getframe(gcf);
end


% figure(1)
% subplot(221);
% plot(1:nTimes,cp(1,1:nTimes),1:nTimes,ActionLine(1,1:nTimes)); 
% drawnow;  getframe(gcf);

% subplot(222);
% plot(1:nTimes,cp(2,1:nTimes),1:nTimes,ActionLine(2,1:nTimes)); 
% drawnow;  getframe(gcf);

% subplot(223);
% plot(1:nTimes,cp(3,1:nTimes),1:nTimes,ActionLine(3,1:nTimes)); 
% drawnow;  getframe(gcf);
% toc

















