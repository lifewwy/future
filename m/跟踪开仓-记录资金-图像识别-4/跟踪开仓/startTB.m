function startTB()

% clc; clear;

MainWinTitle1 = '���׿�����ƽ̨(�콢��) 64λ';
MainWinTitle2 = '���׿�����ƽ̨(�콢��) 64λ (δ��Ӧ)';

fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end-3));
directory = [directory,'AutoRun\'];

copyTime = 1;
pasteTime = 1;
loadMainWinTime = 30;
loadLoginWinTime = 2;
for i = 1:10  % ��������ڼ��ز��ɹ����ظ����ԡ�
    % �������ļ�ִ����ϣ��ú����ŷ��ء�
    [~,~]=dos([directory,'restartTB']);
    pause(loadLoginWinTime);
    clipboard('copy', '1'); pause(copyTime);
    paste; pause(pasteTime);
    returnKey; pause(loadMainWinTime);
    hMainWin1 = findWindows(MainWinTitle1);
    hMainWin2 = findWindows(MainWinTitle2);
    if (hMainWin1~=0)&&(hMainWin2==0)
        fprintf('TB�����ڼ��سɹ���\n');
        break;
    end
end

TBHandle1;


