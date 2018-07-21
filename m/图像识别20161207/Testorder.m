%% 下单测试程序
clear;  clc;  close all; 

%% 下单参数
Contract = 'ma1705'; handsNum = 18;
BuyOrSell = 'Buy';       % 'Buy','Sell'
OpenOrEvenUp = 'Open'; % 'Open','EvenUp'
orderParameters = {Contract, BuyOrSell, OpenOrEvenUp, handsNum};

% handsNum = randi(20,1); 
% price = randi(2800,1);
% ContractIndex = randi(18,1);
% orderParameters = {ContractIndex, 'buy', 'evenUp', handsNum, price};
% action, 1: openDuo; 2: closeDuo; 3: openKong; 4: closeKong
% action = 2;
% orderParameters = {ContractIndex, actioin, handsNum, price};
%% 关闭遮挡窗口
hwin = findWindows('保证金监控中心');
if hwin
    CloseWindow(hwin)
end

hwin = findWindows('消息');
if hwin
    CloseWindow(hwin)
end

hwin = findWindows('历史账单');
if hwin
    CloseWindow(hwin)
end

%% 取得行情窗口位置，窗口标题“国贸期货”需显示出来。
title = '国内期货';
hwin = findWindows(title);
if hwin == 0
    return;
end

rect =  GetWindowPosition(hwin);

%% 取得期货合约在行情窗口中的位置
% % mPos = [ rect(1,1)+113, rect(2,1)+129 ];
% % ruPos = [ rect(1,1)+113, rect(2,1)+129+41 ];
% % cfPos = [ rect(1,1)+113, rect(2,1)+129+2*41 ];
% 
% rowMidDistance = 41;
% ContractPos = repmat([ rect(1,1)+113, rect(2,1)+129 ] , 18, 1)+  ...
%     [zeros(18,1), transpose(0:41:17*rowMidDistance)];
% 
% % 1:m, 2:ru, 3:cf, 4:oi, 5:sr, 6:ma, 7:y, 8:fg, 9:l, 10:p
% % 11:j, 12:cu, 13:al, 14:PTA, 15:zn, 16:rb, 17:ag, 18:IF

%% 取得光标位置
OriginalCurPos = GetCursorPos;

%% 交易品种选择
% SetCursorPos(ContractPos(cell2mat(orderParameters(1)),:));
% % SetForegroundWindow(hwin);
% % SwitchToThisWindow(hwin);
% LeftClick;

%% 取得下单窗口位置，窗口标题“国内期货”需显示出来。
title = '国内期货';
hwin = findWindows(title);
if hwin == 0
    return;
end

SetForegroundWindow(hwin);

rect =  GetWindowPosition(hwin);

%% 窗口截图，控件位置测试
OriginalDat = PrtWin1(hwin);
OriginalDat(:,:,1) = flipud(OriginalDat(:,:,1));
OriginalDat(:,:,2) = flipud(OriginalDat(:,:,2));
OriginalDat(:,:,3) = flipud(OriginalDat(:,:,3));

% imshow(OriginalDat);

load templet2;
load templet4;
% imshow(templet2); figure; imshow(templet4);
% imshow(OriginalDat(88:118,222:340,:))
if (~isequal(OriginalDat(88:118,222:340,:) ,templet2)) && ...
      (~isequal(OriginalDat(88:118,222:340,:) ,templet4))  
    fprintf(2,'错误！\n');
    return;
end

%% 下单控件位置
CategoryEdit = [rect(1,1)+343,rect(2,1)+66];

buyButtonPos = [rect(1,1)+256,rect(2,1)+106];
sellButtonPos = [rect(1,1)+310,rect(2,1)+106];
openButtonPos = [rect(1,1)+255,rect(2,1)+142]; 
evenUpButtonPos = [rect(1,1)+311,rect(2,1)+142]; 
NumEditPos = [rect(1,1)+263,rect(2,1)+180];
PriceEditPos = [rect(1,1)+263,rect(2,1)+221];

FollowPriceButtonPos = [rect(1,1)+197,rect(2,1)+220];
AddPriceButtonPos = [rect(1,1)+328,rect(2,1)+216];
SubtractPriceButtonPos = [rect(1,1)+307,rect(2,1)+218];

OrderButtonPos = [rect(1,1)+284,rect(2,1)+261];

%% 下单

SetCursorPos(CategoryEdit);
LeftClick;
LeftClick;

% 1705 -> 705
Contract = orderParameters{1};
if ~isempty( intersect({orderParameters{1}(1:2)}, {'CF','FG','MA','OI','SR','TA'}) )
    Contract(3) = [];
end
ContractInput(Contract);

if strcmp( char(orderParameters(2)) , 'Buy' )
    SetCursorPos(buyButtonPos);
    LeftClick;
end
if strcmp( char(orderParameters(2)) , 'Sell' )
    SetCursorPos(sellButtonPos);
    LeftClick;
end

if strcmp( char(orderParameters(3)) , 'Open' )
    SetCursorPos(openButtonPos);
    LeftClick;
end
if strcmp( char(orderParameters(3)) , 'EvenUp' )
    SetCursorPos(evenUpButtonPos);
    LeftClick;
end

% 输入手数
SetCursorPos(NumEditPos);
LeftClick; 
keyboardInput2(cell2mat(orderParameters(4)));

% % 输入价格
% SetCursorPos(PriceEditPos);
% LeftClick;
% keyboardInput3(cell2mat(orderParameters(5)));

% 在跟盘价的基础上加价或减价
SetCursorPos(FollowPriceButtonPos);
LeftClick;
LeftClick;

if (strcmp( char(orderParameters(2)) , 'Buy' ) && ...
        strcmp( char(orderParameters(3)) , 'Open' ))|| ...
        (strcmp( char(orderParameters(2)) , 'Sell' )&& ...
        strcmp( char(orderParameters(2)) , 'EvenUp' ))
    SetCursorPos(AddPriceButtonPos);
else
    SetCursorPos(SubtractPriceButtonPos);
end
% SetCursorPos(AddPriceButtonPos);

for i = 1:2
    LeftClick;
end

% 下单
SetCursorPos(OrderButtonPos);
LeftClick;

pause(1);
%% 操作确认对话框
title = '操作确认';
hwin = findWindows(title);
SetForegroundWindow(hwin);
if hwin == 0
    return;
end
rect =  GetWindowPosition(hwin);
OkButtonPos = [rect(1,1)+167,rect(2,1)+149];
CancelButtonPos = [rect(1,1)+274,rect(2,1)+149];
%% “确认窗口”截图,控件位置测试
OriginalDat = PrtWin1(hwin);
OriginalDat(:,:,1) = flipud(OriginalDat(:,:,1));
OriginalDat(:,:,2) = flipud(OriginalDat(:,:,2));
OriginalDat(:,:,3) = flipud(OriginalDat(:,:,3));

% imshow(OriginalDat);
% imshow(OriginalDat(128:158,114:322,:));

load templet3;
% imshow(templet3);
if ~isequal(OriginalDat(128:158,114:322,:) ,templet3)
    fprintf(2,'错误！\n');
    return;
end
%% 操作确认
SetCursorPos(CancelButtonPos);
% SetCursorPos(OkButtonPos);
LeftClick;

%% 恢复光标位置
SetCursorPos( OriginalCurPos );








































































