function startTB()

% clc; clear;

MainWinTitle1 = '交易开拓者平台(旗舰版) 64位';
MainWinTitle2 = '交易开拓者平台(旗舰版) 64位 (未响应)';

fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end-3));
directory = [directory,'AutoRun\'];

copyTime = 1; %#ok
pasteTime = 1;%#ok
loadMainWinTime = 30;
loadLoginWinTime = 2;
for i = 1:10  % 如果主窗口加载不成功，重复尝试。
    % 批处理文件执行完毕，该函数才返回。
    [~,~]=dos([directory,'restartTB']);
    pause(loadLoginWinTime);
    
    % 输入登录密码，回车登录
    % clipboard('copy', '1'); pause(copyTime);
    % paste; pause(pasteTime);
    % returnKey; pause(loadMainWinTime);
    
    % 脱机打开TB，不需要输入登录密码
    % 也不会因为连接不上服务器而无法打开软件。
    AltplusO; pause(loadMainWinTime); 
    
    hMainWin1 = findWindows(MainWinTitle1);
    hMainWin2 = findWindows(MainWinTitle2);
    % 正在连接期货行情服务器...
    hWin = findChildWinByClassName(0,'Ghost','');
    if (hMainWin1~=0)&&(hMainWin2==0)&&(hWin==0)
        fprintf('TB主窗口加载成功！\n');
        TBHandle1;
        break;
    else
        fprintf(2,[num2str(i),'...TB主窗口加载失败！\n']);
    end
    
end




