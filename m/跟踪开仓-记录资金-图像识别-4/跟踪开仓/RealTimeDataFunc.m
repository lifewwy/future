function [ActionLine, cp, aa] = RealTimeDataFunc( CContract,action,hands,cp,ActionLine,aa )

% clear;  close all; % clc;
% CContract = {'CU1701'; 'M1705'; 'CF1705'};

global nTimes;
nTimes = nTimes + 1;
% nTimes %#ok

global ActionDoneFlg;

Contract = [];
for n = 1:length(CContract)
    Contract = [Contract,CContract{n},',']; %#ok
end
    
% url = 'http://hq.sinajs.cn/list=CU1701,M1705,CF1705';
url = ['http://hq.sinajs.cn/list=',Contract];

[KLineDataA, ~] = urlread(url);
semicolonPos = find(KLineDataA == ';');

if length(CContract)~=length(semicolonPos)
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
            o,h,l,c,v,str2double(CContract{i}(end-3:end))];
        
    end
    
end

if length(CContract) ~= nCount
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


flg = [1;-1;-1]; % 1： 开多/平空 or -1：开空/平多

% cp(:,nTimes) = kData(:,5);

% 模拟数据
if nTimes == 1
    cp(:,nTimes) = rand(3,1);
else
    cp(:,nTimes) = cp(:,nTimes-1) + randn(3,1);
end

% Maximum Or Minimum Since Scratch
if nTimes == 1
    aa = cp(:,nTimes);
else
    for i=1:length(CContract)
        if (flg(i) == 1)&&(cp(i,nTimes)<aa(i))
            aa(i) = cp(i,nTimes);
        end
        if (flg(i) == -1)&&(cp(i,nTimes)>aa(i))
            aa(i) = cp(i,nTimes);
        end
    end
end

ActionLine(:,nTimes) = aa + flg*10;
for i = 1:length(CContract)
    if (strcmp(action{i},'Buy Open')||(strcmp(action{i},'Sell EvenUp')))&&...
        (cp(i,nTimes) >  ActionLine(i,nTimes))&& (ActionDoneFlg(i)==0) 
        orderParameters = {CContract{i},action{i},hands(i)} %#ok
        ActionDoneFlg(i) = 1 %#ok
    end
    if (strcmp(action{i},'Sell Open')||(strcmp(action{i},'Buy EvenUp')))&&...
        (cp(i,nTimes) <  ActionLine(i,nTimes)) && (ActionDoneFlg(i)==0) 
        orderParameters = {CContract{i},action{i},hands(i)} %#ok
        ActionDoneFlg(i) = 1 %#ok
    end
end

% Contract = 'AU1706'; handsNum = 1;
% BuyOrSell = 'Buy';       % 'Buy','Sell'
% OpenOrEvenUp = 'EvenUp'; % 'Open','EvenUp'
% orderParameters = {Contract, BuyOrSell, OpenOrEvenUp, handsNum};

if sum(ActionDoneFlg)==3
    stop(timerfind);
    fprintf(2,'定时器关闭！\n');   
end

%% 画图
% tic
subplot(221);
plot(1:nTimes,cp(1,1:nTimes),1:nTimes,ActionLine(1,1:nTimes)); 
drawnow;  getframe(gcf);

subplot(222);
plot(1:nTimes,cp(2,1:nTimes),1:nTimes,ActionLine(2,1:nTimes)); 
drawnow;  getframe(gcf);

subplot(223);
plot(1:nTimes,cp(3,1:nTimes),1:nTimes,ActionLine(3,1:nTimes)); 
drawnow;  getframe(gcf);
% toc

















