function TBHandle1()
% clc; close all; clear;
% TB: tbv5543_x64_portable 

datFileName = 'C:\D\xyz\future\����ά��\TB�������뵼��\importToTB.dat';

offset3 = [19,143] + [40,10];  % *.wrm ��λ��

alpha = 5;
moveMouseTime = 2*alpha;
openDiaglogTime = 5*alpha;
switchTabTime = 2*alpha;
copyTime = 3*alpha;
pasteTime = 3*alpha;
importFileTime = 5*alpha;
closeMessageBoxTime = 1*alpha;
closeDiaglogTime = 2*alpha;
openWorkRoomTime = 5*alpha;


MainWinTitle1 = '���׿�����ƽ̨(�콢��) 64λ';
MainWinTitle2 = '���׿�����ƽ̨(�콢��) 64λ (δ��Ӧ)';
hMainWin1 = findWindows(MainWinTitle1);
hMainWin2 = findWindows(MainWinTitle2);
if (hMainWin1==0)||(hMainWin2==1)
    fprintf(2,'TB�����ڼ���ʧ�ܣ�\n');
    return;
end

SetForegroundWindowAndMaxmize(hMainWin1);

% ������ݹ���Ի����Ѿ��򿪣��ȹر�����
title = '���ݹ���';
hwin = findWindows(title);
if hwin ~= 0
    CloseWindow(hwin); pause(closeDiaglogTime);
end

% ��ݼ������ݹ���Ի���
CtrlplusM; pause(openDiaglogTime);
title = '���ݹ���';
hwinDataManage = findWindows(title);
if hwinDataManage == 0
    fprintf(2,'���ݹ���Ի����ʧ�ܣ�\n');
    return;
end

% ͨ����ݼ��л�ѡ� Ctrl+Tab
CtrlplusTab; pause(switchTabTime);

hwin = findChildWin(hwinDataManage,'����ά��');
if hwin == 0
    fprintf(2,'û���л�������ά��ѡ���\n');
    return;
end

% ȡ���������밴ť���
hwin = findChildWin(hwin,'��������');
if hwin == 0
    fprintf(2,'û���ҵ� �������� ��ť��\n');
    return;
end

ClickButton(hwin);
pause(openDiaglogTime);
% % ͨ����ť�����ȷ����ťλ��
% rect = GetWindowPosition(hwin);
% % �������밴ť
% cp = mean(transpose(reshape(rect,2,2)));
% SetCursorPos(cp); 
% pause(moveMouseTime);
% LeftClick; pause(openDiaglogTime);

hwinTmp = findWindows('ѡ���������������ļ�');
if hwinTmp==0
    fprintf(2,'ѡ���������������ļ��Ի����ʧ�ܣ�\n');
    return;
end

clipboard('copy', datFileName); pause(copyTime);
paste; pause(pasteTime);
returnKey; pause(importFileTime);

% ��������ļ������ڣ�������Ϣ�򣬱���Ϊ'ѡ���������������ļ�'
hwinTmp = findWindows('ѡ���������������ļ�');
if hwinTmp~=0
    fprintf(2,' �ļ������ڣ�\n');
    return;
end

% �������ݵ��������Ϣ��
returnKey; % messageBox OK
pause(closeMessageBoxTime);

% �ر����ݹ���Ի���
CloseWindow(hwinDataManage); pause(closeDiaglogTime);


% ��ݼ��򿪹����ҶԻ���
CtrlplusR; pause(openDiaglogTime);
title = '�򿪹�����';
hwin = findWindows(title);
if hwin == 0
    fprintf(2,'�򿪹����ҶԻ����ʧ�ܣ�\n');
    return;
end
rect =  GetWindowPosition(hwin);
WinLeftTop = [rect(1,1),rect(2,1)];

SetCursorPos(WinLeftTop + offset3)
pause(moveMouseTime);
LeftClick; LeftClick; % ˫���򿪹�����
pause(openWorkRoomTime);

end









