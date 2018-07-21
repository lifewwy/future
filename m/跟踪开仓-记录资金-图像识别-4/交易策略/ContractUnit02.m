function u = ContractUnit02(contractName)

% clear all; close all; clc;
% contractName = 'if888';

% directory = 'C:\D\future\����λ��\';
% 20180214
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end-3));
directory = [directory,'����λ��\'];

d = importdata([directory,'��Լ��Ϣ.txt']);
cy = {'��һ','A'; '����','AL'; '�ƽ�','AU'; '����','C'; '�޻�','CF'; '��ͭ','CU'; 
    '����', 'FG';'��ָ','IF'; '��̿','J'; '����','L'; '����','M'; '�״�','MA';
    '������' ,'OI';'�����','P'; '���Ƹ�','RB'; '��', 'RU';'����','SR'; 
    'PTA','TA'; 'PVC','V'; '����','Y'; '��п','ZN'};

contractName = contractName(1:end-3);
categoryName = cy{strcmpi(cy(:,2),contractName),1};

if strcmpi(contractName,'if')
    u = 300;
    return;
end

sized = size(d.textdata);
for i = 1:sized(1)
    if strcmp(d.textdata{i,2}(1:end-4),categoryName)
        u = d.data(i);
        return;
    end
end


u = nan; 
disp('��Լ�������');


% switch contractName
%     case 'a888'
%         u = 10;
%         return;
%     case 'c888'
%         u = 10;
%         return;
%     case 'rb888'
%         u = 10;
%         return;
%     case 'm888'
%         u = 10;
%         return;
%     case 'p888'
%         u = 10;
%         return;
%     case 'j888'
%         u = 100;
%         return;
%     case 'zn888'
%         u = 5;
%         return;
%     case 'y888'
%         u = 10;
%         return;
%     case 'l888'
%         u = 5;
%         return;
%     case 'ag888'
%         u = 15;
%         return;
%     case 'ta888'
%         u = 5;
%         return;
%     case 'sr888'
%         u = 10;
%         return;
%     case 'au888'
%         u = 1000;
%         return;
%     case 'fg888'
%         u = 20;
%         return;
%     case 'ma888'
%         u = 10;
%         return;
%     case 'ru888'
%         u = 10;
%         return;
%     case 'al888'
%         u = 5;
%         return;
%     case 'oi888'
%         u = 10;
%         return;
%     case 'rm888'
%         u = 10;
%         return;
%     case 'cf888'
%         u = 5;
%         return;
%     case 'i888'
%         u = 100;
%         return;
%     case 'jm888'
%         u = 60;
%         return;
%     case 'cu888'
%         u = 5;
%         return;
%     case 'ri888'
%         u = 20;
%         return;
%     case 'v888'
%         u = 5;
%         return;
%     case 'if888'
%         u = 300;
%         return;
%     otherwise
%         u = nan;
%         disp('��Լ�������')
% end

end


































