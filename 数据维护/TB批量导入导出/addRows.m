clc; clear; close all;
filename = 'E.dat';

% ��ÿ����Լ��β���������ݼ�¼
%% �ļ�����
fL = getFileLen(filename);

% �ҵ�ĳ����Լ�ĵ�һ����¼��λ�ã�����¼���ȡ�
% ���ȼٶ�֪����Լ�Ⱥ�˳�򣬼�ÿ����Լ��һ����¼������
ContratCode = 'SR';
x = ContractQueue;
[I,J] = find(strcmp(x,ContratCode),1);

startPos = 0;
for i = 1:I
    dt = x{i,2};
    df = x{i,3};
    % ĳ��Լ��һ����¼��ͷλ��(�ֽڣ�
    pos = findRowInDAT(filename,dt,df,startPos); 
    % ��ȡ�ú�Լ�ļ�¼��
    N = getNfromFirstRecord(filename,pos);
    startPos = N*56+pos;
end

% pos �޸ļ�¼����λ��
% N ԭ���ļ�¼��
% startPos �����¼����ʼλ��
y = [datenum('2018-08-20'),2,8,1,4,25602,35625;
    datenum('2018-08-21'),2,8,1,4,25602,35625;
    datenum('2018-08-22'),2,8,1,4,25602,35625;
    datenum('2018-08-23'),2,8,1,4,25602,35625];

status = InsertRecords(filename,y,pos,N,startPos);














