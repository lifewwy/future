clear all; clc; close all;

% ��������
% dstruct = importdata('au888.csv');   % �ƽ�
% dstruct = importdata('zn888.csv'); % п
dstruct = importdata('��.csv'); %  
% dstruct = importdata('cu888.csv'); % ͭ
% dstruct = importdata('pb888.csv'); % Ǧ
% dstruct = importdata('cf888.csv'); % �޻�
% dstruct = importdata('c9888.csv'); % ����
% dstruct = importdata('ru888.csv');   % ��
% dstruct = importdata('j9888.csv');   % ��̿
% dstruct = importdata('rb888.csv');   % ���Ƹ�
% dstruct = importdata('sr888.csv');   % ����
% dstruct = importdata('if888.csv');   % ��ָ

display(dstruct.textdata(1,1))
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5); atr = data(:,7);
% c = c(1:900);
%% go long
% % �볡���� 
% % Perform decomposition at level 3 of s using db5. 
wavename = 'db5'; N = 5;
for i = 1:300
    [cc,ll] = wavedec(c(1:i),N,wavename);
    a = wrcoef('a',cc,ll,wavename,N);
    plot(a); hold on;
end
% postmp1 = find(diff(sign(gradient(a1)))==2)+1;
%% С��



%% figure;
% plot(a); hold on; plot(c,'r');
% figure; plot(c); hold on; plot(a,'r'); plot(a1,'g'); grid;
% figure; plot(a1); hold on; plot(a2,'r')






















































