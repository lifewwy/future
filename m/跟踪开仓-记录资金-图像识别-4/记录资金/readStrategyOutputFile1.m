function [contract,action,risk] = readStrategyOutputFile1(TBStrategyFlg)
% clear; 
clc;

contract = [];
action = [];
risk = [];
%% �����ļ���
% directory = 'C:\D\future\m\���ٿ���-��¼�ʽ�-ͼ��ʶ��-2\��¼�ʽ�\';
% directory1 = 'D:\wangwy\m\��¼�ʽ�\';
pp  = mfilename('fullpath');
i = strfind(pp,'\');

% folder1 = pp(1:i(end));
% folder2 = 'C:\D\future\';
% 20180214
folder2 = pp(1:i(end-3));
%% ����������ļ�
if TBStrategyFlg==0
    fprintf('��MATLAB��������ļ�...\n');
else
    fprintf('��TB��������ļ�...\n');
end

yyyymmdd = datestr(now,'yyyymmdd');
% filename = [directory2,'����','20161212','.txt'];

if TBStrategyFlg==0
    filename = [folder2,'����',yyyymmdd,'.txt'];
else
    filename = [folder2,'����',yyyymmdd,'TB.txt'];
end


if exist(filename,'file') == 2
    d1 = importdata(filename);
else
    fprintf(2,'------------ �޽��ף�------------\n');
    return;
end

% MATLAB ���Ժ��������
cy1 = {'��һ','A'; '����','AL'; '�ƽ�','AU'; '����','C'; '�޻�','CF'; '��ͭ','CU'; 
    '����', 'FG';'��ָ','IF'; '��̿','J'; '����','L'; '����','M'; '�״�','MA';
    '������' ,'OI';'�����','P'; '���Ƹ�','RB'; '��', 'RU';'����','SR'; 
    'PTA','TA'; 'PVC','V'; '����','Y'; '��п','ZN'};

% TB ���Ժ�������� 20180828
cy2 = {'A','A'; 'AL','AL'; 'AU','AU'; 'C','C'; 'CF','CF'; 'CU','CU'; 
    'FG', 'FG';'IF','IF'; 'J','J'; 'L','L'; 'M','M'; 'MA','MA';
    'OI' ,'OI';'P','P'; 'RB','RB'; 'RU', 'RU';'SR','SR'; 'Y','Y'; 'ZN','ZN'};

cy = [cy1;cy2];

% ȥ������
d1( strcmp(d1,'') == 1 ) = [];

% �ϲ���ͬ����
warning('off'); %#ok
d1 = unique(d1,'rows');

nOrders = length(d1);
contract = cell(nOrders,1);
risk = zeros(nOrders,1); 
action = cell(nOrders,1); 
for n = 1:nOrders
    pos1 = strfind( d1{n}, ' ');
    
    contract(n) = {d1{n}(pos1(2)+1:pos1(3)-1)};
    [p1,~] = find(strcmp(contract{n}(1:end-4),cy(:,1)) == 1);
    if ~isempty(p1)
        contract(n) = {[cy{p1,2},contract{n}(end-3:end)]};
    end
    
    pos2 = strfind( d1{n}, 'ÿ�ַ��գ�');
    risk(n) = str2double(d1{n}(pos2+5:end));
    
    % TB ���Ժ����������IF�����Ѿ�����300
    if strcmp( {d1{n}(pos1(2)+1:pos1(3)-1)} , '��ָ')
        risk(n) = risk(n)*300;
    end
    
    if isempty(pos2)
        pos2 = pos1(3)+2+2;
    end;
    action(n) = {d1{n}(pos1(3)+2:pos2-1)};
    action{n}(action{n} == ' ') = [];
    action{n}(action{n} == '��') = [];
end

% contract
% risk
% action



end











