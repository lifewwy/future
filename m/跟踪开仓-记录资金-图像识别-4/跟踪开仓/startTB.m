function startTB()

% clc; clear;

MainWinTitle1 = '���׿�����ƽ̨(�콢��) 64λ';
MainWinTitle2 = '���׿�����ƽ̨(�콢��) 64λ (δ��Ӧ)';

fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end-3));
directory = [directory,'AutoRun\'];

copyTime = 1; %#ok
pasteTime = 1;%#ok
loadMainWinTime = 30;
loadLoginWinTime = 2;
for i = 1:10  % ��������ڼ��ز��ɹ����ظ����ԡ�
    % �������ļ�ִ����ϣ��ú����ŷ��ء�
    [~,~]=dos([directory,'restartTB']);
    pause(loadLoginWinTime);
    
    % �����¼���룬�س���¼
    % clipboard('copy', '1'); pause(copyTime);
    % paste; pause(pasteTime);
    % returnKey; pause(loadMainWinTime);
    
    % �ѻ���TB������Ҫ�����¼����
    % Ҳ������Ϊ���Ӳ��Ϸ��������޷��������
    AltplusO; pause(loadMainWinTime); 
    
    hMainWin1 = findWindows(MainWinTitle1);
    hMainWin2 = findWindows(MainWinTitle2);
    % ���������ڻ����������...
    hWin = findChildWinByClassName(0,'Ghost','');
    if (hMainWin1~=0)&&(hMainWin2==0)&&(hWin==0)
        fprintf('TB�����ڼ��سɹ���\n');
        status = TBHandle1;
        if status==1
            findSuperChartWnd;
        end
        break;
    else
        fprintf(2,[num2str(i),'...TB�����ڼ���ʧ�ܣ�\n']);
    end
    
end




