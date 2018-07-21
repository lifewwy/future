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
%% ����
nWindwoSize = 50; Natr = 3;

pos1 = EntryRule5(c,atr,nWindwoSize,Natr,'crossOver');
pos2 = EntryRule5(c,atr,nWindwoSize,Natr,'crossUnder');
flgpos1 = ones(size(pos1));
flgpos2 = zeros(size(pos2));

pos = [pos1 ; pos2];
flgpos = [flgpos1 ; flgpos2];

[pos,i] = sort(pos);
flgpos = flgpos(i);

posEntry = pos(1);
re = zeros(size(pos)); nCount = 1; 

for i=1:length(pos)
    
    if flgpos(i)==1
        flgGoLongOrShort = 'goLong';
    else
        flgGoLongOrShort = 'goShort';
    end
    [posExit ,Rinit] = ExitRule90(flgGoLongOrShort,posEntry,c,atr,Natr,Natr);
    
    if flgpos(i)==1
        re(nCount) = (c(posExit)-c(posEntry))./Rinit;
    else
        re(nCount) = (c(posEntry)-c(posExit))./Rinit;
    end
    
    tmp = find(pos>posExit);
    if isempty(tmp)
        break;
    else
        posEntry = pos(tmp(1));
        nCount = nCount+1;
    end
end

%% �������

re = re(1:nCount);
tp = sum(re);
bar(re);


















