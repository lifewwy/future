clear; clc; close all;

% ������ʤ�ʡ�����֮��Ĺ�ϵ 
% profit = (WinRate.*(1+odds)-1).*N.*abs(avgLoss);
% odds: ����
%% ������
folder = 'C:\D\xyz\future\�Ż���¼\TwoParameters\';
filename = [folder '�Ż���¼���ײ��Բ����Ż�[y1901 - 1����].csv'];

dstruct = importdata(filename);
td = dstruct.textdata(1,:)';
display(td);
data = dstruct.data;

data = sortrows(data);

%% ��֤��ʽ
profit = data(:,find(strcmp(td,'������'),1)-1);

indicator = {'ƽ��ӯ��',...
    'ƽ������',...
    'ӯ������'};

nGain = data(:,find(strcmp(td,'ӯ������'),1)-1);
nLoss = data(:,find(strcmp(td,'��������'),1)-1);
TotalGain = data(:,find(strcmp(td,'��ӯ��'),1)-1);
TotalLoss = data(:,find(strcmp(td,'�ܿ���'),1)-1);

% avgGain = data(:,find(strcmp(td,indicator{1}),1)-1); % ӯ�����׵�ƽ��ӯ��
% avgLoss = data(:,find(strcmp(td,indicator{2}),1)-1); % �����׵�ƽ������

avgGain = TotalGain./nGain; % ӯ�����׵�ƽ��ӯ��
avgLoss = TotalLoss./nLoss; % �����׵�ƽ������

WinRate = data(:,find(strcmp(td,indicator{3}),1)-1)/100;
% WinRate = nGain./(nGain+nLoss);

odds = abs(avgGain./avgLoss);  % ����
% odds = data(:,find(strcmp(td,'ӯ����'),1)-1);
N = nGain+nLoss;               % ���״���

p1 = nGain.*avgGain + nLoss.*avgLoss;
p2 = (WinRate.*(1+odds)-1).*N.*abs(avgLoss);
p3 = TotalGain+TotalLoss;

figure;plot(profit); hold on; plot(p2-max(p2)-abs(min(p1)),'r');

%% ��֤��ʽ
% N = 500;           % ���״���
% x = randi([-50,300],1,N);
% WinRate = sum(x>0)/length(x);
% avgGain = sum(x(x>0))/sum(x>0); % ӯ�����׵�ƽ��ӯ��
% avgLoss = sum(x(x<0))/sum(x<0); % �����׵�ƽ������
% odds = abs(avgGain/avgLoss);  % ����
% p1 = (WinRate*(1+odds)-1)*N*abs(avgLoss);
% p2 = sum(x);
% e = p1./p2 %#ok
%% ֹ������ʤ��֮��Ĺ�ϵ
nATRExit = data(:,find(strcmp(td,'P:nATRExit'),1)-1);
R = [nATRExit,WinRate];

title = 'ֹ������ʤ��֮��Ĺ�ϵ';
xlabel = 'ֹ����';
ylabel = 'ʤ��';
titleAndLabel = {title,xlabel,ylabel};
RelationFunc(R,titleAndLabel)
%% ֹ����������֮��Ĺ�ϵ
nATRExit = data(:,find(strcmp(td,'P:nATRExit'),1)-1);
R = [nATRExit,odds];

title = 'ֹ����������֮��Ĺ�ϵ';
xlabel = 'ֹ����';
ylabel = '����';
titleAndLabel = {title,xlabel,ylabel};
RelationFunc(R,titleAndLabel)
%% ֹ����������֮��Ĺ�ϵ
nATRExit = data(:,find(strcmp(td,'P:nATRExit'),1)-1);
R = [nATRExit,profit];

title = 'ֹ����������֮��Ĺ�ϵ';
xlabel = 'ֹ����';
ylabel = '����';
titleAndLabel = {title,xlabel,ylabel};
RelationFunc(R,titleAndLabel)







































