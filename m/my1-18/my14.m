clear all; clc; close all;

% ��������
dstruct = importdata('au888.csv');   % �ƽ�
% dstruct = importdata('zn888.csv'); % п
% dstruct = importdata('er888.csv'); % �� 
% dstruct = importdata('cu888.csv'); % ͭ
% dstruct = importdata('pb888.csv'); % Ǧ
% dstruct = importdata('cf888.csv'); % �޻�
dstruct = importdata('c9888.csv'); % ����
% dstruct = importdata('ru888.csv');   % ��
% dstruct = importdata('j9888.csv');   % ��̿
% dstruct = importdata('rb888.csv');   % ���Ƹ�
% dstruct = importdata('sr888.csv');   % ����
% dstruct = importdata('if888.csv');   % ��ָ
% dstruct = importdata('m9888.csv');   % ����

display(dstruct.textdata(1,1))
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5); atr = data(:,7);
% c = c(1:900);
%% go long
% �볡
N = 20; EntryPos = EntryRule1(c,N,'hh');
% N1 = 10; N2 = 1.4; EntryPos = EntryRule2(h,l,c,N1,N2,'up');

% ����
natr1 = 1.5;  natr2 = 1.5;
[posEntry, posExit, Rinit] = ExitRule1('goLong',EntryPos,c,atr,natr1,natr2);

% �������
re = (c(posExit)-c(posEntry))./Rinit;

ep = mean(re); 
tp = sum(re);
op = length(re)*240/length(c);
vr = sum(re>0)/length(re); 
display(['ƽ��������ձ�: ' num2str(ep) '   ������: ' num2str(tp) ...
    '    ���׻���: ' num2str(op) '��/��    ʤ��: ' num2str(vr)]);

pos1 = find(re>=0); pos2 = find(re<0);


%% figure;
% figure; myplotyy([aa,bb,zeros(size(c))],[c,short,long]);
% figure; movavg(c,15,120);
% figure; plot(c); hold on; plot(pos,c(pos),'r.');
figure; plot(c);
figure; bar(pos1,re(pos1),.2,'r'); hold on; bar(pos2,re(pos2),.1)

% figure; plot(c); hold on; stem(posEntry,ones(length(posEntry),1)*max(c));
% stem(posExit,ones(length(posExit),1)*max(c),'r'); ylim([min(c) max(c)]);




















































