clc; close all; clear;
% TB: tbv5543_x64_portable 

datFileName = 'C:\D\xyz\future\����ά��\TB�������뵼��\importToTB.dat';

title = '���׿�����ƽ̨(�콢��) 64λ';
hwin = findWindows(title);
SetForegroundWindowAndMaxmize(hwin);

moveMouseTime = 2;
openDiaglogTime = 2;
switchTabTime = 2;
copyTime = 3;
pasteTime = 3;
importFileTime = 3;
closeMessageBoxTime = 1;
closeDiaglogTime = 2;
openWorkRoomTime = 5;

% ��ݼ������ݹ���Ի���
CtrlplusM; pause(openDiaglogTime);
title = '���ݹ���';
hwin = findWindows(title);
if hwin == 0
    fprintf(2,'���ݹ���Ի����ʧ�ܣ�\n');
    return;
end
rect =  GetWindowPosition(hwin);
WinLeftTop = [rect(1,1),rect(2,1)];
offset = [130,55]; % ����ά��ѡ�
SetCursorPos(WinLeftTop + offset); 
pause(moveMouseTime);
LeftClick; pause(switchTabTime);

% �������밴ť
offset = [310,430]; % �������밴ť�����λ��
SetCursorPos(WinLeftTop + offset); 
pause(moveMouseTime);
LeftClick; pause(openDiaglogTime);

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
CloseWindow(hwin); pause(closeDiaglogTime);

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

% *.wrm ��λ��
offset = [40,10];
SetCursorPos(WinLeftTop + [19,143] + offset)
pause(moveMouseTime);
LeftClick; LeftClick; % ˫���򿪹�����
pause(openWorkRoomTime);









