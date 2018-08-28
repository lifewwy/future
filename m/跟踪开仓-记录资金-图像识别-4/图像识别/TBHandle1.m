function TBHandle1()
% clc; close all; clear;
% TB: tbv5543_x64_portable 

datFileName = 'C:\D\xyz\future\数据维护\TB批量导入导出\importToTB.dat';

% offset3 = [19,143] + [40,10];  % *.wrm 的位置

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


MainWinTitle1 = '交易开拓者平台(旗舰版) 64位';
MainWinTitle2 = '交易开拓者平台(旗舰版) 64位 (未响应)';
hMainWin1 = findWindows(MainWinTitle1);
hMainWin2 = findWindows(MainWinTitle2);
if (hMainWin1==0)||(hMainWin2~=0)
    fprintf(2,'TB主窗口加载失败！\n');
    return;
end

SetForegroundWindowAndMaxmize(hMainWin1);

% 如果数据管理对话框已经打开，先关闭它。
title = '数据管理';
hwin = findWindows(title);
if hwin ~= 0
    CloseWindow(hwin); pause(closeDiaglogTime);
end

% 快捷键打开数据管理对话框
CtrlplusM; pause(openDiaglogTime);
title = '数据管理';
hwinDataManage = findWindows(title);
if hwinDataManage == 0
    fprintf(2,'数据管理对话框打开失败！\n');
    return;
end

% 通过快捷键切换选项卡 Ctrl+Tab
CtrlplusTab; pause(switchTabTime);

hwin = findChildWin(hwinDataManage,'数据维护');
if hwin == 0
    fprintf(2,'没有切换到数据维护选项卡！\n');
    return;
end

% 取得批量导入按钮句柄
hwin = findChildWin(hwin,'批量导入');
if hwin == 0
    fprintf(2,'没有找到 批量导入 按钮！\n');
    return;
end

ClickButton(hwin);
pause(openDiaglogTime);
% % 通过按钮句柄，确定按钮位置
% rect = GetWindowPosition(hwin);
% % 批量导入按钮
% cp = mean(transpose(reshape(rect,2,2)));
% SetCursorPos(cp); 
% pause(moveMouseTime);
% LeftClick; pause(openDiaglogTime);

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
CloseWindow(hwinDataManage); pause(closeDiaglogTime);


% 快捷键打开工作室对话框
CtrlplusR; pause(openDiaglogTime);
title = '打开工作室';
hwin = findWindows(title);
if hwin == 0
    fprintf(2,'打开工作室对话框打开失败！\n');
    return;
end

DownArrow; % 选中工作室
pause(moveMouseTime);
returnKey;
pause(openWorkRoomTime);

% rect =  GetWindowPosition(hwin);
% WinLeftTop = [rect(1,1),rect(2,1)];
% SetCursorPos(WinLeftTop + offset3)
% pause(moveMouseTime);
% LeftClick; LeftClick; % 双击打开工作室
% pause(openWorkRoomTime);

end









