function EntryPos = EntryRule1(c,N,hhllflag)
% ���̼�ͻ�� N ���¸߻��µ�
% clear all; clc; close all;
%% ��������
% dstruct = importdata('au888.csv');   % �ƽ�
% % display(dstruct.textdata(1,1))
% data = dstruct.data;
% o = data(:,1); h = data(:,2); l = data(:,3);
% c = data(:,4); v = data(:,5); atr = data(:,7);

%% �볡
% N = 20;
if strcmp(hhllflag,'hh')
    hh = hhigh(c,N);
    EntryPos = find(hh == c);
else
    
    ll = llow(c,N);
    EntryPos = find(ll == c);
    
end
