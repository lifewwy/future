clc; close all; clear;
% TB: tbv5543_x64_portable 

datFileName = 'C:\D\xyz\future\数据维护\TB批量导入导出\importToTB.dat';

title = '交易开拓者平台(旗舰版) 64位';
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
offset = [130,55]; % 数据维护选项卡
SetCursorPos(WinLeftTop + offset); 
pause(moveMouseTime);
LeftClick; pause(switchTabTime);

% 批量导入按钮
offset = [310,430]; % 批量导入按钮的相对位置
SetCursorPos(WinLeftTop + offset); 
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

% *.wrm 的位置
offset = [40,10];
SetCursorPos(WinLeftTop + [19,143] + offset)
pause(moveMouseTime);
LeftClick; LeftClick; % 双击打开工作室
pause(openWorkRoomTime);









