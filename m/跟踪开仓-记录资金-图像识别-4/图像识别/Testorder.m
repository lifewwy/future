%% �µ����Գ���
clear;  clc;  close all; 

%% �µ�����
Contract = 'ma1705'; handsNum = 1;
BuyOrSell = 'Sell';       % 'Buy','Sell'
OpenOrEvenUp = 'EvenUp'; % 'Open','EvenUp'
orderParameters = {Contract, BuyOrSell, OpenOrEvenUp, handsNum};

% handsNum = randi(20,1); 
% price = randi(2800,1);
% ContractIndex = randi(18,1);
% orderParameters = {ContractIndex, 'buy', 'evenUp', handsNum, price};
% action, 1: openDuo; 2: closeDuo; 3: openKong; 4: closeKong
% action = 2;
% orderParameters = {ContractIndex, actioin, handsNum, price};
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

%% ȡ�����鴰��λ�ã����ڱ��⡰��ó�ڻ�������ʾ������
title = '��ó�ڻ�';
hwin = findWindows(title);
if hwin == 0
    return;
end

rect =  GetWindowPosition(hwin);

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
    return;
end

SetForegroundWindow(hwin);

rect =  GetWindowPosition(hwin);

%% ���ڽ�ͼ���ؼ�λ�ò���
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
    fprintf(2,'����\n');
    return;
end

%% �µ��ؼ�λ��
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

%% �µ�

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

% ��������
SetCursorPos(NumEditPos);
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

if (strcmp( char(orderParameters(2)) , 'Buy' ) && ...
        strcmp( char(orderParameters(3)) , 'Open' ))|| ...
        (strcmp( char(orderParameters(2)) , 'Sell' )&& ...
        strcmp( char(orderParameters(2)) , 'EvenUp' ))
    SetCursorPos(AddPriceButtonPos);
else
    SetCursorPos(SubtractPriceButtonPos);
end
SetCursorPos(AddPriceButtonPos);

for i = 1:2
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
    return;
end
rect =  GetWindowPosition(hwin);
OkButtonPos = [rect(1,1)+167,rect(2,1)+149];
CancelButtonPos = [rect(1,1)+274,rect(2,1)+149];
%% ��ȷ�ϴ��ڡ���ͼ,�ؼ�λ�ò���
OriginalDat = PrtWin1(hwin);
OriginalDat(:,:,1) = flipud(OriginalDat(:,:,1));
OriginalDat(:,:,2) = flipud(OriginalDat(:,:,2));
OriginalDat(:,:,3) = flipud(OriginalDat(:,:,3));

% imshow(OriginalDat);
% imshow(OriginalDat(128:158,114:322,:));

load templet3;
% imshow(templet3);
if ~isequal(OriginalDat(128:158,114:322,:) ,templet3)
    fprintf(2,'����\n');
    return;
end
%% ����ȷ��
SetCursorPos(CancelButtonPos);
% SetCursorPos(OkButtonPos);
LeftClick;

%% �ָ����λ��
SetCursorPos( OriginalCurPos );








































































