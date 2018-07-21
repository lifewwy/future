function done = ChiCang(aa)

% clear;  clc;  close all; 

PosFileName = '控件位置_ver6.7.529.csv';
%% 待查询合约
% 开仓
% aa.contract = 'ZN1702';
% aa.LongShort = '多';
% aa.hands = '5';

% 平仓
% aa.contract = 'v1705';
% aa.LongShort = [];
% aa.hands = [];

done = 0;

%% '国内期货'窗口
title = '国内期货';
hwin = findWindows(title);
if hwin == 0
    DisableMouse(false);
    return;
end
SetForegroundWindow(hwin);
rect =  GetWindowPosition(hwin);
Win1LeftTop = [rect(1,1),rect(2,1)];

%% 先将csv文件的内容清空
pp  = mfilename('fullpath');
i = strfind(pp,'\');
directory1 = pp(1:i(end-1));
directory1 = [directory1,'记录资金\'];
fid = fopen([directory1,'CHICANG.csv'], 'wt'); 
fclose(fid);

%% 将持仓情况保存为csv文件
directory2 = pp(1:i(end));
filename = [directory2, PosFileName];
control = GetControlPos(filename);

ChiCangLabelPos = Win1LeftTop + control.ChiCangLabel;
ChiCangPos = Win1LeftTop + control.ChiCang;
SavePos = Win1LeftTop + control.save;

SetCursorPos( ChiCangLabelPos );
LeftClick
pause(3);
SetCursorPos( ChiCangPos );
RightClick;
pause(3);
SetCursorPos( SavePos );
LeftClick;
pause(3);

hwin = GetForegroundWindow;
rect =  GetWindowPosition(hwin);
Win3LeftTop = [rect(1,1),rect(2,1)];

% SetCursorPos(Win3LeftTop + control.fileName);
% LeftClick;

% fileNameInput('CHICANG');
clipboard('copy', 'CHICANG')
paste; spaceKey;

SetCursorPos(Win3LeftTop + control.saveType);
LeftClick;

SetCursorPos(Win3LeftTop + control.saveType + [0,55]);
LeftClick;
returnKey;
pause(3)

%% 读csv文件
xx = importdata([directory1,'CHICANG.csv']);
textdata = xx.textdata  %#ok
contract = textdata(:,2); 
LongShort =  textdata(:,3); 
hands = textdata(:,4);

bb.contract = aa.contract;
rowIndex = find( strcmpi(contract,bb.contract) == 1 );
if ~isempty(rowIndex)
    bb.LongShort = char( LongShort(rowIndex) );
    bb.LongShort(bb.LongShort == ' ') = [];
    bb.hands = char( hands(rowIndex) );
    bb.hands(bb.hands == ' ') = [];
else
    bb.LongShort = [];
    bb.hands = [];
end

% 比较两个结构体是否相等
% if isequal(aa,bb)
%     fprintf(2,['---------- ',aa.contract,'交易成功! ---------- \n']);
% end

bb %#ok

% strcmpi % 忽略大小写 
if strcmpi(aa.contract,bb.contract)&& ...
        isequal(aa.LongShort,bb.LongShort)&& ...
        isequal(aa.hands,bb.hands)
    done = 1;
    fprintf(2,['---------- ',aa.contract,'交易成功! ---------- \n']);
end

DisableMouse(false);









