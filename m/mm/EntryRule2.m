function EntryPos = EntryRule2(h,l,c,N1,N2,updownflag)
% �������̼� ��ȥ ǰһ�����̼� ͻ�� N2 ����atr 
% clear all; clc; close all;
%% ��������
% dstruct = importdata('au888.csv');   % �ƽ�
% % display(dstruct.textdata(1,1))
% data = dstruct.data;
% o = data(:,1); h = data(:,2); l = data(:,3);
% c = data(:,4); v = data(:,5); atr = data(:,7);

%% �볡
% N1 = 20; N2 = 2; updownflag = 'up';
atr = atrfunc(h,l,c,N1);
dc = zeros(size(c)); dc(1) = 0;
dc(2:end) = diff(c);
Entrytmp = find(abs(dc)> N2*atr);

if strcmp(updownflag,'up')
    pos = find(dc>0);
    EntryPos = intersect(Entrytmp,pos);
else
    pos = find(dc<0);
    EntryPos = intersect(Entrytmp,pos);
end


%  plot(c); hold on; plot(EntryPos,c(EntryPos),'r.')











