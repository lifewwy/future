clear all; clc; close all;

% ��������
dstruct = importdata('ͭ.csv'); 
% dstruct = importdata('zn888.csv'); 
% dstruct = importdata('er888.csv'); % �� 
% dstruct = importdata('cu888.csv');
% dstruct = importdata('pb888.csv'); % Ǧ
% dstruct = importdata('cf888.csv'); % �޻�
% dstruct = importdata('c9888.csv'); % ����

display(dstruct.textdata(1,1))
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5); atr = data(:,7);
%% go long


% ����
[posEntry, posExit, Rinit] = ExitRule1('goLong',posEntry,c,atr,3,4);

% �������
re = (c(posExit)-c(posEntry))./Rinit;

ep = mean(re); 
op = length(re)*240/length(c);
vr = sum(re>0)/length(re); 
display(['ƽ��������ձ�: ' num2str(ep) ...
    '    ���׻���: ' num2str(op) '��/��    ʤ��: ' num2str(vr)]);

pos1 = find(re>=0); pos2 = find(re<0);

%% go short
% clearvars -except c atr
% �볡����

% ����
[posEntry, posExit ,Rinit] = ExitRule1('goShort',posEntry,c,atr,3,4);

re = (c(posEntry)-c(posExit))./Rinit;

ep = mean(re); 
op = length(re)*240/length(c);
vr = sum(re>0)/length(re); 
display(['ƽ��������ձ�: ' num2str(ep) ...
    '    ���׻���: ' num2str(op) '��/��    ʤ��: ' num2str(vr)]);

pos1 = find(re>=0); pos2 = find(re<0);

%% ��ͼ

figure; bar(pos1,re(pos1),.2,'r'); hold on; bar(pos2,re(pos2),.1)

% subplot(2,2,3); movavg(c,ShortAveragePeriod,LongAveragePeriod);

% figure; hist(re,20);

% figure; plot(atr); hold on; plot(c); plot(short,'r'); plot(long,'k');
figure; movavg(c,20,240); hold on; plot(atr(240:end)); grid;

% figure; plot(c); hold on; plot(short,'r'); 
% plot(posEntry3,c(posEntry3),'ro');

figure; plot(c); hold on; stem(posEntry,ones(length(posEntry),1)*max(c));
stem(posExit,ones(length(posExit),1)*max(c),'r'); ylim([min(c) max(c)]);

% figure; xrange = LongAveragePeriod+fitLength-1:length(c);
% plotyy(xrange,slope(xrange),xrange,long(xrange)); grid;

% figure; plot(a); hold on; plot(c,'r'); plot(posEntry1,c(posEntry1),'go')

% figure; plot(c); hold on; plot(short,'r'); plot(long,'k');
% hold on; plot(posEntry,c(posEntry),'ro');





















































