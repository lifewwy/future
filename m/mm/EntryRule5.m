function pos = EntryRule5(c,atr,nWindowSize,N,flgCrossOverOrUnder)

% ͨ��ͻ�ƣ�ͨ���Ǿ��߼Ӽ�N����atr

% clear all; clc; close all;

%% ��������
% % dstruct = importdata('au888.csv');   % �ƽ�
% dstruct = importdata('zn888.csv'); % п
% dstruct = importdata('er888.csv'); % �� 
% dstruct = importdata('cu888.csv'); % ͭ
% dstruct = importdata('pb888.csv'); % Ǧ
% dstruct = importdata('cf888.csv'); % �޻�
% dstruct = importdata('c9888.csv'); % ����
% % dstruct = importdata('ru888.csv');   % ��
% % dstruct = importdata('a9888.csv');
% % dstruct = importdata('ta888.csv');
% 
% display(dstruct.textdata(1,1))
% data = dstruct.data;
% o = data(:,1); h = data(:,2); l = data(:,3);
% c = data(:,4); v = data(:,5); atr = data(:,7);
%%
% nWindowSize = 50; N = 3;
[short,~] = movavg(c,nWindowSize,nWindowSize);
uppr = short+N*atr;
lowr = short-N*atr;

if strcmp(flgCrossOverOrUnder , 'crossOver')
    pos = CrossOver(c,uppr);
else
    pos = CrossUnder(c,lowr);
end




















