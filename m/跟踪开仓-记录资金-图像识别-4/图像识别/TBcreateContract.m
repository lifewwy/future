function TBcreateContract(v)
% clc; close all; clear;

% TB: tbv5543_x64_portable 

% v = {'RU',0,1,10,1,0.06,'1.00'};

moveMouseTime = .2;
openDiaglogTime = .5;
copyTime = .1;
pasteTime = .1;
TabKeyTime = .1;

hwin = findWindows('���׿�����ƽ̨(�콢��) 64λ');
SetForegroundWindowAndMaxmize(hwin);

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
offset = [289,80]+[40,13]; % �Զ�����Ʒ��ť
SetCursorPos(WinLeftTop + offset); 
pause(moveMouseTime);
% ����Ʒ����ѡ�
LeftClick; pause(openDiaglogTime);

hwin = findWindows('��Ʒ����');
if hwin == 0
    fprintf(2,'��Ʒ���ԶԻ����ʧ�ܣ�\n');
    return;
end


clipboard('copy', v{1}); pause(copyTime);
paste; pause(pasteTime);
Tabkey; pause(TabKeyTime);
clipboard('copy', v{2}); pause(copyTime);
paste; pause(pasteTime);
Tabkey; pause(TabKeyTime);
clipboard('copy', v{3}); pause(copyTime);
paste; pause(pasteTime);
Tabkey; pause(TabKeyTime);
clipboard('copy', v{4}); pause(copyTime);
paste; pause(pasteTime);
Tabkey; pause(TabKeyTime);
Tabkey; pause(TabKeyTime);
clipboard('copy', v{5}); pause(copyTime);
paste; pause(pasteTime);
Tabkey; pause(TabKeyTime);
clipboard('copy', v{6}); pause(copyTime);
paste; pause(pasteTime);
Tabkey; pause(TabKeyTime);
clipboard('copy', v{7}); pause(copyTime);
paste; pause(pasteTime);
Tabkey; pause(TabKeyTime);
clipboard('copy', v{8}); pause(copyTime);
paste; pause(pasteTime);
Tabkey; pause(TabKeyTime);
clipboard('copy', v{9}); pause(copyTime);
paste; pause(pasteTime);
returnKey;








