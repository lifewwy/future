function TBHandle()
% clc; close all; clear;
% TB: tbv5543_x64_portable 

% ����ȷʵ��ť����ѡ���λ�ã�������ƹ�ȥ�����������Ϣ��
offset1 = [130,55]; % ����ά��ѡ�
offset2 = [310,430]; % �������밴ť�����λ��
offset3 = [19,143] + [40,10];  % *.wrm ��λ��

datFileName = 'C:\D\xyz\future\����ά��\TB�������뵼��\importToTB.dat';

alpha = 2;
moveMouseTime = 2*alpha;
openDiaglogTime = 2*alpha;
switchTabTime = 2*alpha;
copyTime = 3*alpha;
pasteTime = 3*alpha;
importFileTime = 3*alpha;
closeMessageBoxTime = 1*alpha;
closeDiaglogTime = 2*alpha;
openWorkRoomTime = 5*alpha;

MainWinTitle1 = '���׿�����ƽ̨(�콢��) 64λ';
MainWinTitle2 = '���׿�����ƽ̨(�콢��) 64λ (δ��Ӧ)';
hMainWin1 = findWindows(MainWinTitle1);
hMainWin2 = findWindows(MainWinTitle2);
if (hMainWin1==0)||(hMainWin2~=0)
    fprintf(2,'TB�����ڼ���ʧ�ܣ�\n');
    return;
end

SetForegroundWindowAndMaxmize(hMainWin1);

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
% offset1 = [130,55]; % ����ά��ѡ�
SetCursorPos(WinLeftTop + offset1); 
pause(moveMouseTime);
LeftClick; pause(switchTabTime);

% �������밴ť
SetCursorPos(WinLeftTop + offset2); 
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
SetCursorPos(WinLeftTop + offset3)
pause(moveMouseTime);
LeftClick; LeftClick; % ˫���򿪹�����
pause(openWorkRoomTime);

end









