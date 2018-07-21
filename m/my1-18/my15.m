clear all; clc; close all;

%% ��������
dstruct = importdata('au888.csv');   % �ƽ�
dstruct = importdata('zn888.csv'); % п
% dstruct = importdata('er888.csv'); % �� 
% dstruct = importdata('cu888.csv'); % ͭ
% dstruct = importdata('pb888.csv'); % Ǧ
dstruct = importdata('cf888.csv'); % �޻�
dstruct = importdata('c9888.csv'); % ����
dstruct = importdata('ru888.csv');   % ��
% dstruct = importdata('j9888.csv');   % ��̿
% dstruct = importdata('rb888.csv');   % ���Ƹ�
dstruct = importdata('sr888.csv');   % ����
% dstruct = importdata('if888.csv');   % ��ָ
% dstruct = importdata('m9888.csv');   % ����


display(dstruct.textdata(1,1))
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5); atr = data(:,7);
%%
% pos1 = EntryRule4(c,20,2,'crossOver');
% pos2 = EntryRule3('long',c,10,60)
% pos = EntryRule1(c,30,'hh')
% pos = intersect(pos1,pos2);

nWindwoSize = 50; Natr = 3;
pos = EntryRule5(c,atr,nWindwoSize,Natr,'crossOver');
[posEntry, posExit ,Rinit] = ExitRule1('goLong',pos,c,atr,Natr,Natr);
%%
% �������
re = (c(posExit)-c(posEntry))./Rinit;

ep = mean(re); 
tp = sum(re);
op = length(re)*240/length(c);
vr = sum(re>0)/length(re); 
display(['ƽ��������ձ�: ' num2str(ep) '   ������: ' num2str(tp) ...
    '    ���׻���: ' num2str(op) '��/��    ʤ��: ' num2str(vr)]);

pos1 = find(re>=0); pos2 = find(re<0);

figure; bar(pos1,re(pos1),.2,'r'); hold on; bar(pos2,re(pos2),.1)
%%
% pos1 = EntryRule4(c,20,2,'crossOver');
% pos2 = EntryRule3('long',c,10,60)
% pos = EntryRule1(c,30,'hh')
% pos = intersect(pos1,pos2);

pos = EntryRule5(c,atr,nWindwoSize,Natr,'crossUnder');
[posEntry, posExit ,Rinit] = ExitRule1('goShort',pos,c,atr,Natr,Natr);
%%
% �������
re = (c(posEntry)-c(posExit))./Rinit;

ep = mean(re); 
tp = sum(re);
op = length(re)*240/length(c);
vr = sum(re>0)/length(re); 
display(['ƽ��������ձ�: ' num2str(ep) '   ������: ' num2str(tp) ...
    '    ���׻���: ' num2str(op) '��/��    ʤ��: ' num2str(vr)]);

pos1 = find(re>=0); pos2 = find(re<0);

figure; bar(pos1,re(pos1),.2,'r'); hold on; bar(pos2,re(pos2),.1)



















