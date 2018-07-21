function Testorder1Func(orderPara)

% clear;  clc;  close all;
clc;

PosFileName = '控件位置_ver6.7.529.csv';

% 拦截真实的鼠标和键盘事件
% DisableMouse(true);

CancleOrOkFlg = 'Cancle';
% CancleOrOkFlg = 'Ok';
try
    handles = evalin('base','handles'); 
    if (~get(handles.checkbox1,'value'))&&(nargin~=0)
        CancleOrOkFlg = 'Ok';
    end       
catch
end

%% 下单参数
if nargin == 0
    Contract = 'y1705'; handsNum = '7';
    Action = 'Buy Open';
    orderPara = {Contract, Action, handsNum};
end

% Contract = 'OI1705'; handsNum = 1;
% BuyOrSell = 'Buy';       % 'Buy','Sell'
% OpenOrEvenUp = 'Open'; % 'Open','EvenUp'
% orderParameters = {Contract, BuyOrSell, OpenOrEvenUp, handsNum};

% % handsNum = randi(20,1); 
% % price = randi(2800,1);
% % ContractIndex = randi(18,1);
% % orderParameters = {ContractIndex, 'buy', 'evenUp', handsNum, price};
% % action, 1: openDuo; 2: closeDuo; 3: openKong; 4: closeKong
% % action = 2;
% % orderParameters = {ContractIndex, actioin, handsNum, price};

%% 参数格式转换

aaa = orderPara{2};
spacePos = find(aaa == ' ');

orderParameters = {orderPara{1},aaa(1:spacePos-1),aaa(spacePos+1:end), ...
    str2double(orderPara{3})};

aaa %#ok
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

%% 取得行情窗口位置，窗口标题“文华财经”需显示出来。
% title = '文华财经';
% hwin = findWindows(title);
% if hwin == 0
%     return;
% end
% 
% rect =  GetWindowPosition(hwin);

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
    DisableMouse(false);
    return;
end

SetForegroundWindow(hwin);
pause(.2);

rect =  GetWindowPosition(hwin);
Win1LeftTop = [rect(1,1),rect(2,1)];

%% 窗口截图，控件位置测试
% OriginalDat = PrtWin1(hwin);
% OriginalDat(:,:,1) = flipud(OriginalDat(:,:,1));
% OriginalDat(:,:,2) = flipud(OriginalDat(:,:,2));
% OriginalDat(:,:,3) = flipud(OriginalDat(:,:,3));
% 
% % imshow(OriginalDat);
% 
% load templet2;
% load templet4;
% % imshow(templet2); figure; imshow(templet4);
% % imshow(OriginalDat(88:118,222:340,:))
% if (~isequal(OriginalDat(88:118,222:340,:) ,templet2)) && ...
%       (~isequal(OriginalDat(88:118,222:340,:) ,templet4))  
%     fprintf(2,'错误！\n');
%     return;
% end

%% 下单控件位置
pp  = mfilename('fullpath');
i = strfind(pp,'\');
directory = pp(1:i(end));
filename = [directory,PosFileName];
control = GetControlPos(filename);

ContractEdit = Win1LeftTop + control.ContractEdit;
buyButtonPos = Win1LeftTop + control.buyButton;
sellButtonPos = Win1LeftTop + control.sellButton;
openButtonPos =  Win1LeftTop + control.openButton;
evenUpButtonPos =  Win1LeftTop + control.evenUpButton;
handsEditPos =  Win1LeftTop + control.handsEdit;
PriceEditPos =  Win1LeftTop + control.PriceEdit;  %#ok
FollowPriceButtonPos = Win1LeftTop + control.PriceEdit;
AddPriceButtonPos = Win1LeftTop + control.AddPriceButton;
SubtractPriceButtonPos = Win1LeftTop + control.SubtractPriceButton;
OrderButtonPos = Win1LeftTop + control.OrderButton;

%% 下单
SetCursorPos(ContractEdit);
LeftClick;
LeftClick;

% 1705 -> 705
Contract = orderParameters{1};
if ~isempty( intersect({orderParameters{1}(1:2)}, ...
        {'CF','FG','MA','OI','SR','TA','cf','fg','ma','oi','sr','ta'}) )
    Contract(3) = [];
end

% ContractInput(Contract);
clipboard('copy', Contract)
paste;
returnKey;

aa.contract = Contract;

if strcmp( char(orderParameters(2)) , 'Buy' )
    SetCursorPos(buyButtonPos);
    LeftClick;
end
if strcmp( char(orderParameters(2)) , 'Sell' )
    SetCursorPos(sellButtonPos);
    LeftClick;
end

if strcmp( char(orderParameters(3)) , 'Open' )
    if strcmp( char(orderParameters(2)) , 'Buy' )
        aa.LongShort = '多';
    else
        aa.LongShort = '空';
    end
    aa.hands = num2str(cell2mat(orderParameters(4)));
    SetCursorPos(openButtonPos);
    LeftClick;
end
if strcmp( char(orderParameters(3)) , 'EvenUp' )
    aa.LongShort = [];
    aa.hands = [];
    SetCursorPos(evenUpButtonPos);
    LeftClick;
end

% 输入手数
SetCursorPos(handsEditPos);
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
pause(.1);

if (strcmp( char(orderParameters(2)) , 'Buy' ) && ...
        strcmp( char(orderParameters(3)) , 'Open' ))|| ...
        (strcmp( char(orderParameters(2)) , 'Sell' )&& ...
        strcmp( char(orderParameters(2)) , 'EvenUp' ))
    SetCursorPos(AddPriceButtonPos);
else
    SetCursorPos(SubtractPriceButtonPos);
end
% SetCursorPos(AddPriceButtonPos);

for i = 1:3
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
    DisableMouse(false);
    return;
end
rect =  GetWindowPosition(hwin);
Win2LeftTop = [rect(1,1),rect(2,1)];

OkButtonPos = Win2LeftTop + control.OkButton;
CancelButtonPos = Win2LeftTop + control.CancelButton; 
%% “确认窗口”截图,控件位置测试
% OriginalDat = PrtWin1(hwin);
% OriginalDat(:,:,1) = flipud(OriginalDat(:,:,1));
% OriginalDat(:,:,2) = flipud(OriginalDat(:,:,2));
% OriginalDat(:,:,3) = flipud(OriginalDat(:,:,3));
% 
% % imshow(OriginalDat);
% % imshow(OriginalDat(128:158,114:322,:));
% 
% load templet3;
% % imshow(templet3);
% if ~isequal(OriginalDat(128:158,114:322,:) ,templet3)
%     fprintf(2,'错误！\n');
%     return;
% end
%% 操作确认
if strcmp(CancleOrOkFlg,'Cancle')
    SetCursorPos(CancelButtonPos);
else
    SetCursorPos(OkButtonPos);
end

if nargin == 0
    SetCursorPos(CancelButtonPos);
%     LeftClick;
%     return;
end

LeftClick;
%% 恢复光标位置
SetCursorPos( OriginalCurPos );

%% 检查交易是否成功
pause(2);

aa %#ok
% done = ChiCang(aa) %#ok







































































