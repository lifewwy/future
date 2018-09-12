function GenCCorders(contract1,contract2,handles)

% clear; clc; close all;

if nargin==0
%     contract1 = 'ma1801';
%     contract2 = 'ma1805';
    contract1 = 'p1801';
    contract2 = 'p1805';
%     contract1 = 'ru1801';
%     contract2 = 'ru1805';
%     contract1 = 'y1801';
%     contract2 = 'y1805';
end
%% �˻�ѡ��
AccountSelection = get(handles.TradeAccout,'value');
% AccountSelection = 1;
switch AccountSelection
    case 1
        adInfo = '��ó�ڻ�';
    case 2
        adInfo = '�º��ڻ�';
    case 3
        adInfo = 'SimNow1';
    case 4
        adInfo = 'SimNow2';
end
%% ��������ļ�
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
folder1 = fp(1:pp(end));

listing = dir([folder1,'����*.csv']);
% fileName = [folder1,listing(i).name];
% folder1 = 'C:\D\future\m\���ٿ���-��¼�ʽ�-ͼ��ʶ��-4\��¼�ʽ�\';
% filename = [folder1,'����-',adInfo,'.csv'];


nOrderFile = length(listing);
if isempty(nOrderFile)
    filename = {[folder1,'����-',adInfo,'.csv']};
else
    filename = cell(1,nOrderFile);
    for i = 1:nOrderFile
        filename(i) = {[folder1,listing(i).name]};
    end
end

for i = 1:length(filename)
    
    fid = fopen(filename{i},'a+');
    fprintf(fid, '\n');
    
    fprintf(fid, '%s,', datestr(now,'yyyy/mm/dd'));
    fprintf(fid, '%s,', contract1);
    fprintf(fid, '%s,', '(����Լ)');
    fprintf(fid, '%d\n', NaN);
    fprintf(fid, '%s,', datestr(now,'yyyy/mm/dd'));
    fprintf(fid, '%s,', contract2);
    fprintf(fid, '%s,', '(����Լ)');
    fprintf(fid, '%d\n', NaN);
    
    fclose(fid);
    
end
disp('�����ļ����³ɹ���');

%% д txt �ļ�
% fid=fopen('*.txt','�򿪷�ʽ')
% ˵��������fid���ڴ洢�ļ����ֵ��������صľ��ֵ����0����˵���ļ��򿪳ɹ���
% �ļ������ַ�����ʽ����ʾ���򿪵������ļ��������Ĵ򿪷�ʽ���£�
% 'r'��ֻ����ʽ���ļ���Ĭ�ϵķ�ʽ�������ļ������Ѵ��ڡ�
% 'r+'����д��ʽ���ļ����򿪺��ȶ���д�����ļ������Ѵ��ڡ�
% 'w'���򿪺�д�����ݡ����ļ��Ѵ�������£��������򴴽���
% 'w+'����д��ʽ���ļ����ȶ���д�����ļ��Ѵ�������£��������򴴽���
% 'a'���ڴ򿪵��ļ�ĩ��������ݡ��ļ��������򴴽���
% 'a+'�����ļ����ȶ���������������ݡ��ļ��������򴴽���

% TodayDate = datestr(now,'yyyymmdd');
% fid = fopen(['����',TodayDate,'.txt'],'a');
% fprintf(fid,'%s\r\n','j1709 ƽ��');
% fprintf(fid,'\r\n');
% fprintf(fid,'%s\r\n','j1801 ����');
% fprintf(fid,'\r\n');
% fclose(fid);
















