
clc; clear; close all;

%% ����ҵ�����ͼ����
MainWinTitle1 = '���׿�����ƽ̨(�콢��) 64λ';
hMainWin1 = findWindows(MainWinTitle1);
if hMainWin1 == 0
    fprintf(2,'û���ҵ������ڣ�\n');
    return;
end
H1 = findChildWinByClassName(hMainWin1,'MDIClient','');
if H1 == 0
    fprintf(2,'û���ҵ�����H1��\n');
    return;
end
H2 = findChildWinByClassName(H1,'','TA PTA-TA 1����');
if H2 == 0
    fprintf(2,'û���ҵ�����H2��\n');
    return;
end
H3 = findChildWinByClassName(H2,'AfxFrameOrView110','');
if H3 == 0
    fprintf(2,'û���ҵ�����H3��\n');
    return;
end
H4 = findChildWinByClassName(H3,'','TA 1����') %#ok
if H4 == 0
    fprintf(2,'û���ҵ�����H4��\n');
    return;
end










