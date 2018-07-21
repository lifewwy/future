function Testorder1Func(orderPara)

% clear;  clc;  close all;
clc;

PosFileName = '�ؼ�λ��_ver6.7.529.csv';

% ������ʵ�����ͼ����¼�
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

%% �µ�����
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

%% ������ʽת��

aaa = orderPara{2};
spacePos = find(aaa == ' ');

orderParameters = {orderPara{1},aaa(1:spacePos-1),aaa(spacePos+1:end), ...
    str2double(orderPara{3})};

aaa %#ok
%% �ر��ڵ�����
hwin = findWindows('��֤��������');
if hwin
    CloseWindow(hwin)
end

hwin = findWindows('��Ϣ');
if hwin
    CloseWindow(hwin)
end

hwin = findWindows('��ʷ�˵�');
if hwin
    CloseWindow(hwin)
end

%% ȡ�����鴰��λ�ã����ڱ��⡰�Ļ��ƾ�������ʾ������
% title = '�Ļ��ƾ�';
% hwin = findWindows(title);
% if hwin == 0
%     return;
% end
% 
% rect =  GetWindowPosition(hwin);

%% ȡ���ڻ���Լ�����鴰���е�λ��
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

%% ȡ�ù��λ��
OriginalCurPos = GetCursorPos;

%% ����Ʒ��ѡ��
% SetCursorPos(ContractPos(cell2mat(orderParameters(1)),:));
% % SetForegroundWindow(hwin);
% % SwitchToThisWindow(hwin);
% LeftClick;

%% ȡ���µ�����λ�ã����ڱ��⡰�����ڻ�������ʾ������
title = '�����ڻ�';
hwin = findWindows(title);
if hwin == 0
    DisableMouse(false);
    return;
end

SetForegroundWindow(hwin);
pause(.2);

rect =  GetWindowPosition(hwin);
Win1LeftTop = [rect(1,1),rect(2,1)];

%% ���ڽ�ͼ���ؼ�λ�ò���
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
%     fprintf(2,'����\n');
%     return;
% end

%% �µ��ؼ�λ��
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

%% �µ�
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
        aa.LongShort = '��';
    else
        aa.LongShort = '��';
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

% ��������
SetCursorPos(handsEditPos);
LeftClick; 
keyboardInput2(cell2mat(orderParameters(4)));

% % ����۸�
% SetCursorPos(PriceEditPos);
% LeftClick;
% keyboardInput3(cell2mat(orderParameters(5)));

% �ڸ��̼۵Ļ����ϼӼۻ����
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

% �µ�
SetCursorPos(OrderButtonPos);
LeftClick;

pause(1);
%% ����ȷ�϶Ի���
title = '����ȷ��';
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
%% ��ȷ�ϴ��ڡ���ͼ,�ؼ�λ�ò���
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
%     fprintf(2,'����\n');
%     return;
% end
%% ����ȷ��
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
%% �ָ����λ��
SetCursorPos( OriginalCurPos );

%% ��齻���Ƿ�ɹ�
pause(2);

aa %#ok
% done = ChiCang(aa) %#ok







































































