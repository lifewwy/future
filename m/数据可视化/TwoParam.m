clear; clc; close all;
% 2������

%% ������
folder = 'C:\D\xyz\future\�Ż���¼\TwoParameters\';
filename = [folder '�Ż���¼���ײ��Բ����Ż�[m1901 - 1����].csv'];

dstruct = importdata(filename);
td = dstruct.textdata(1,:)';
display(td);
data = dstruct.data;

data = sortrows(data);
%% ���� TB ��������

param1 = data(:,1); param2 = data(:,2);
param1 = unique(param1);  param2 = unique(param2);


ar = data(:,3)./data(:,7)./(-data(:,30));
% ar(ar<max(ar)*0.5) = NaN;
ar = reshape(ar,[],length(param1));

profit1 = data(:,find(strcmp(td,'������'),1)-1);
profit1(profit1<max(profit1)*0.2) = NaN;
profit = reshape(profit1,[],length(param1));

MaxDown = data(:,find(strcmp(td,'����ʲ��س�����%'),1)-1);
MaxDown = reshape(MaxDown,[],length(param1));

wr = data(:,find(strcmp(td,'ӯ������'),1)-1);
wr = reshape(wr,[],length(param1));

odds = data(:,find(strcmp(td,'ӯ����'),1)-1); % ����
odds = reshape(odds,[],length(param1));
%% surf

figure('Name','������','NumberTitle','off');
surf(param1,param2,profit);view(2); axis tight;
map = mycolormap(profit); colormap(map);

% figure; surf(param1,param2,ar);  view(2); axis tight;
% map = mycolormap(ar); colormap(map);

figure('Name','����ʲ��س�','NumberTitle','off');
surf(param1,param2,MaxDown);  view(2); axis tight;
% map = mycolormap(MaxDown); colormap(map);

figure('Name','ʤ��','NumberTitle','off');
surf(param1,param2,wr);  view(2); axis tight;

figure('Name','����','NumberTitle','off');
surf(param1,param2,odds);  view(2); axis tight;

% �ڽ�����ĵ��������£�nPeriodBreakԽСԽ��,��ȡ1ʱ�͵��ڲ�ֹ��
% ����������������Ҳ��ʼ�ղ�ֹ��
% figure;  grid;hold on;
% for nPeriodBreak=1:10
%     plot(param2,profit(:,nPeriodBreak));
% end
% figure; plotyy(param2,wr(:,1),param2,odds(:,1)); grid;


% һ�������̶�
figure; grid; plot(param2,profit(:,param1==42)); grid;
figure; grid; plot(param1,profit(param2==2.9,:)); grid;



%% ѡ���������״�ͼ
% [~,ind,~] = intersect(data(:,1:2),[10,2.6],'rows');
% indicator = {'����ʲ��س�����%',...
%     '������������',...
%     'ӯ������'};
% MaxDown = data(ind,find(strcmp(td,indicator{1}),1)-1);
% N = data(ind,find(strcmp(td,indicator{2}),1)-1);
% WinRate = data(ind,find(strcmp(td,indicator{3}),1)-1)/100;
% 
% maxValue = [1 20 1];
% minValue = [0 0 0];
% h = spiderplot([MaxDown,N,WinRate]', maxValue, ...
%     minValue, ['r' 'g' 'b']',indicator);
% % set(h.axis, 'LineWidth', 2);
% set(h.plots(1), 'LineWidth', 2);




























