function TBcreateContract(v)
% clc; close all; clear;

% TB: tbv5543_x64_portable 

% v = {'RU',0,1,10,1,0.06,'1.00'};

moveMouseTime = .2;
openDiaglogTime = .5;
copyTime = .1;
pasteTime = .1;
TabKeyTime = .1;

hwin = findWindows('交易开拓者平台(旗舰版) 64位');
SetForegroundWindowAndMaxmize(hwin);

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
offset = [289,80]+[40,13]; % 自定义商品按钮
SetCursorPos(WinLeftTop + offset); 
pause(moveMouseTime);
% 打开商品属性选项卡
LeftClick; pause(openDiaglogTime);

hwin = findWindows('商品属性');
if hwin == 0
    fprintf(2,'商品属性对话框打开失败！\n');
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








