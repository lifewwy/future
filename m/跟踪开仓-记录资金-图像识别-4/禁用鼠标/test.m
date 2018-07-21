clc; clear; close all;

% 真实的键盘和鼠标事件被拦截
% 模拟的键盘和鼠标事件通过
DisableMouse(true);

fileNameInput('abc');

pause(10);

% 按 Esc 退出对真实鼠标和键盘消息的拦截

DisableMouse(false);












