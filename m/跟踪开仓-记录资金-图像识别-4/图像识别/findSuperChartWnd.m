function  findSuperChartWnd()
ContractName = {'��','A'; '��','AL'; '�ƽ�','AU'; '����','C'; '�޻�','CF'; 'ͭ','CU'; 
    '����', 'FG';'��ָ','IF'; '��̿','J'; '����','L'; '����','M'; '�״�','MA';
    '����' ,'OI';'�����','P'; '����','RB'; '��', 'RU';'����','SR'; 
    'PTA','TA'; 'PVC','V'; '����','Y'; 'п','ZN'};
sizeCN = size(ContractName);
status = zeros(1,sizeCN(1));
for i = 1:sizeCN(1)
    status(i) = subfunc(ContractName(i,:));
end

if sum(status) == sizeCN(1)
    fprintf('����ͼ��ȫ���򿪳ɹ���\n');
end

function status = subfunc(cn)
% clc; clear; close all;
status = 0;

if nargin==0
    name1 = 'TA PTA-TA 1����';
    name2 = 'TA 1����';
    name = 'PTA';
else
    name1 = [cn{:,2}, ' ', cn{:,1}, '-', cn{:,2},' 1����'];
    name2 = [cn{:,2}, ' 1����'];
    name = cn{:,1};
end


%% ����ҵ�����ͼ����
MainWinTitle1 = '���׿�����ƽ̨(�콢��) 64λ';
hMainWin1 = findWindows(MainWinTitle1);
if hMainWin1 == 0
    fprintf(2,[name,' û���ҵ������ڣ�\n']);
    return;
end
H1 = findChildWinByClassName(hMainWin1,'MDIClient','');
if H1 == 0
    fprintf(2,[name,' û���ҵ�����H1��\n']);
    return;
end
H2 = findChildWinByClassName(H1,'',name1);
if H2 == 0
    fprintf(2,[name,' û���ҵ�����H2��\n']);
    return;
end
H3 = findChildWinByClassName(H2,'AfxFrameOrView110','');
if H3 == 0
    fprintf(2,[name,' û���ҵ�����H3��\n']);
    return;
end
H4 = findChildWinByClassName(H3,'',name2);% %#ok
if H4 == 0
    fprintf(2,[name,' û���ҵ�����H4��\n']);
    return;
else
    % fprintf('OK��\n');
    status = 1;
end

end

end



