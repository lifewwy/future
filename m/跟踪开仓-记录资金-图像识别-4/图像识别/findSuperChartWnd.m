
clc; clear; close all;

%% 逐层找到超级图表窗口
MainWinTitle1 = '交易开拓者平台(旗舰版) 64位';
hMainWin1 = findWindows(MainWinTitle1);
if hMainWin1 == 0
    fprintf(2,'没有找到主窗口！\n');
    return;
end
H1 = findChildWinByClassName(hMainWin1,'MDIClient','');
if H1 == 0
    fprintf(2,'没有找到窗口H1！\n');
    return;
end
H2 = findChildWinByClassName(H1,'','TA PTA-TA 1日线');
if H2 == 0
    fprintf(2,'没有找到窗口H2！\n');
    return;
end
H3 = findChildWinByClassName(H2,'AfxFrameOrView110','');
if H3 == 0
    fprintf(2,'没有找到窗口H3！\n');
    return;
end
H4 = findChildWinByClassName(H3,'','TA 1日线') %#ok
if H4 == 0
    fprintf(2,'没有找到窗口H4！\n');
    return;
end










