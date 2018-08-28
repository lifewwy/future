function TBHandle()
% clc; close all; clear;
% TB: tbv5543_x64_portable 

% 事先确实按钮或者选项卡的位置，将鼠标移过去，发鼠标点击消息。
offset1 = [130,55]; % 数据维护选项卡
offset2 = [310,430]; % 批量导入按钮的相对位置
offset3 = [19,143] + [40,10];  % *.wrm 的位置

datFileName = 'C:\D\xyz\future\数据维护\TB批量导入导出\importToTB.dat';

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

MainWinTitle1 = '交易开拓者平台(旗舰版) 64位';
MainWinTitle2 = '交易开拓者平台(旗舰版) 64位 (未响应)';
hMainWin1 = findWindows(MainWinTitle1);
hMainWin2 = findWindows(MainWinTitle2);
if (hMainWin1==0)||(hMainWin2~=0)
    fprintf(2,'TB主窗口加载失败！\n');
    return;
end

SetForegroundWindowAndMaxmize(hMainWin1);

% 快捷键打开数据管理对话框
CtrlplusM; pause(openDiaglogTime);
title = '数据管理';
hwin = findWindows(title);
if hwin == 0
    fprintf(2,'数据管理对话框打开失败！\n');
    return;
end
rect =  GetWindowPosition(hwin);
WinLeftTop = [rect(1,1),rect(2,1)];
% offset1 = [130,55]; % 数据维护选项卡
SetCursorPos(WinLeftTop + offset1); 
pause(moveMouseTime);
LeftClick; pause(switchTabTime);

% 批量导入按钮
SetCursorPos(WinLeftTop + offset2); 
pause(moveMouseTime);
LeftClick; pause(openDiaglogTime);

hwinTmp = findWindows('选择批量导入数据文件');
if hwinTmp==0
    fprintf(2,'选择批量导入数据文件对话框打开失败！\n');
    return;
end


clipboard('copy', datFileName); pause(copyTime);
paste; pause(pasteTime);
returnKey; pause(importFileTime);

% 如果数据文件不存在，跳出消息框，标题为'选择批量导入数据文件'
hwinTmp = findWindows('选择批量导入数据文件');
if hwinTmp~=0
    fprintf(2,' 文件不存在！\n');
    return;
end

% 批量数据导入完成消息框
returnKey; % messageBox OK
pause(closeMessageBoxTime);

% 关闭数据管理对话框
CloseWindow(hwin); pause(closeDiaglogTime);

% 快捷键打开工作室对话框
CtrlplusR; pause(openDiaglogTime);
title = '打开工作室';
hwin = findWindows(title);
if hwin == 0
    fprintf(2,'打开工作室对话框打开失败！\n');
    return;
end


rect =  GetWindowPosition(hwin);
WinLeftTop = [rect(1,1),rect(2,1)];
SetCursorPos(WinLeftTop + offset3)
pause(moveMouseTime);
LeftClick; LeftClick; % 双击打开工作室
pause(openWorkRoomTime);

end









