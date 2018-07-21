clear all; clc; close all;

%% ��������
dstruct = importdata('����.csv');  
display(dstruct.textdata(1,1))
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5); atr = data(:,7);
%% ����
% % nWindwoSize = 50; Natr = 3;
% simRang1 = 10:80; simRang2 = .2:.1:5;
% tp = zeros(length(simRang1),length(simRang2));
% vr = zeros(length(simRang1),length(simRang2));
% ep = zeros(length(simRang1),length(simRang2));
% nCount1 = 0; nCount2 = 0;
% for nWindwoSize = simRang1
%     nWindwoSize %#ok
%     nCount1 = nCount1+1;
%     for Natr = simRang2
%         nCount2 = nCount2+1;
%         [~,~,re,t]= opt(c,atr,nWindwoSize, Natr );
%         tp(nCount1,nCount2) = t;
%         ep(nCount1,nCount2) = mean(re);
%         vr(nCount1,nCount2) = sum(re>0)/length(re); 
%     end
%     nCount2 = 0;
% end
% 
% tp = sign(tp)*10.*log10(abs(tp));
% figure; surf(simRang2,simRang1,tp);
% az = 0; el = 90; view(az, el);

%% �Ż����
nWindwoSize = 62; Natr = 3.3;
[posEntry,posExit,re,t] = opt(c,atr,nWindwoSize,Natr);  


disp(['���ݳ���: ',num2str(length(c)),',  ����:  ',num2str(mean(re)), ...
    ',  ������:  ' num2str(t) ,',  ʤ��:  ', num2str(sum(re>0)/length(re))]);

figure; bar(re);

pos1 = EntryRule5(c,atr,nWindwoSize,Natr,'crossOver');
pos2 = EntryRule5(c,atr,nWindwoSize,Natr,'crossUnder');

% figure; plot(c); hold on; stem(posEntry,ones(length(posEntry),1)*max(c));
% stem(posExit,ones(length(posExit),1)*max(c),'r'); ylim([min(c) max(c)]);

figure; plot(c); hold on; stem(pos1,ones(length(pos1),1)*max(c));
stem(pos2,ones(length(pos2),1)*max(c),'r'); ylim([min(c) max(c)]);
title('�볡λ��');







