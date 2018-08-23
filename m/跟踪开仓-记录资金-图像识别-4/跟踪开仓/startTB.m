function startTB()

% clc; clear;

MainWinTitle1 = '交易开拓者平台(旗舰版) 64位';
MainWinTitle2 = '交易开拓者平台(旗舰版) 64位 (未响应)';

fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end-3));
directory = [directory,'AutoRun\'];

copyTime = 1;
pasteTime = 1;
loadMainWinTime = 30;
loadLoginWinTime = 2;
for i = 1:10  % 如果主窗口加载不成功，重复尝试。
    % 批处理文件执行完毕，该函数才返回。
    [~,~]=dos([directory,'restartTB']);
    pause(loadLoginWinTime);
    clipboard('copy', '1'); pause(copyTime);
    paste; pause(pasteTime);
    returnKey; pause(loadMainWinTime);
    hMainWin1 = findWindows(MainWinTitle1);
    hMainWin2 = findWindows(MainWinTitle2);
    if (hMainWin1~=0)&&(hMainWin2==0)
        fprintf('TB主窗口加载成功！\n');
        break;
    end
end

TBHandle1;


