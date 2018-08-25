function [contract,action,risk] = readStrategyOutputFile()
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
%% ��TB����ļ�
fprintf('��TB����ļ�...\n');

yyyymmdd = datestr(now,'yyyymmdd');
% filename = [directory2,'����','20161212','.txt'];
filename = [folder2,'����',yyyymmdd,'.txt'];
if exist(filename,'file') == 2
    d1 = importdata(filename);
else
    fprintf(2,'------------ �޽��ף�------------\n');
    return;
end

cy = {'��һ','A'; '����','AL'; '�ƽ�','AU'; '����','C'; '�޻�','CF'; '��ͭ','CU'; 
    '����', 'FG';'��ָ','IF'; '��̿','J'; '����','L'; '����','M'; '�״�','MA';
    '������' ,'OI';'�����','P'; '���Ƹ�','RB'; '��', 'RU';'����','SR'; 
    'PTA','TA'; 'PVC','V'; '����','Y'; '��п','ZN'};

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
    [p1,~] = find(strcmp(contract{n}(1:end-4),cy) == 1);
    contract(n) = {[cy{p1,2},contract{n}(end-3:end)]};
    
    pos2 = strfind( d1{n}, 'ÿ�ַ��գ�');
    risk(n) = str2double(d1{n}(pos2+5:end));
    if strcmp( contract{n}(1:end-4) , 'IF')
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











