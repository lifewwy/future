function GetAccount(handles)
% clear; 
clc;

% �رճ��������������ͼ
% close(setdiff(findobj('menubar','figure','-or','menubar','none'),gcf));

%% ��������ʱ������
% TimeWinFlg = 1;
% 
% time = clock;
% time = str2double([num2str(time(4),'%02.0f'), num2str(time(5),'%02.0f')]);
% rightTime = (time>1530)&&(time<2056);
% if (~rightTime)&&(TimeWinFlg==1)
%     fprintf(2,'������ȷʱ������иó���\n');
%     return;
% end

%% �����ļ���
% directory = 'C:\D\future\m\���ٿ���-��¼�ʽ�-ͼ��ʶ��-2\��¼�ʽ�\';
% directory1 = 'D:\wangwy\m\��¼�ʽ�\';

% pp  = mfilename('fullpath');
% i = strfind(pp,'\');

% folder1 = pp(1:i(end));
% folder2 = 'C:\D\future\';
%% ��õ�ǰ�ʽ�д�ֲ��ļ�
% title = '�����ڻ�';

% winTitle = WindowTitle(title) %#ok
% pos1 = strfind(winTitle , 'Ȩ��');
% pos2 = strfind(winTitle , '�����ʽ�');
% capital = winTitle(pos1+3:pos2-2);
% capital(capital == ',') = [];
% capital = str2double(capital) + 1e6 %#ok
% if isnan(capital)
%     fprintf(2, '��ȡ�ʽ����\n');
%     return;
% end

% datestr(now,'yyyy/mm/dd')

AccountSelection = get(handles.TradeAccout,'value');

if AccountSelection == 3
    % SimNow 1   ���׽׶�(����ʱ��)����ʵ��������������һ��
    FRONT_ADDR_MD = 'tcp://180.168.146.187:10010';
    FRONT_ADDR_TD = 'tcp://180.168.146.187:10000';
    BROKER_ID = '9999';
    INVESTOR_ID = '101042';
    PASSWORD = '518888';
end

if AccountSelection == 4
    % SimNow 2
    %  ���׽׶�(����ʱ��)�������գ�16��00������09��00���ǽ����գ�16��00������15��00��
    % �˻���Ǯ���ָ���һ�׻�����һ�������ձ���һ�¡�
    FRONT_ADDR_MD = 'tcp://180.168.146.187:10031';
    FRONT_ADDR_TD = 'tcp://180.168.146.187:10030';
    BROKER_ID = '9999';
    INVESTOR_ID = '101042';
    PASSWORD = '518888';
end

if AccountSelection == 1
    % ����-��ó�ڻ�
    FRONT_ADDR_TD = 'tcp://61.152.165.100:41201';
    FRONT_ADDR_MD = 'tcp://61.152.165.100:41211';
    BROKER_ID = '0187';
    INVESTOR_ID = '28006311';
    PASSWORD = 'wy518888';
end

if AccountSelection == 2
    % ����-�º��ڻ�
    FRONT_ADDR_TD = 'tcp://116.228.171.216:41205';
    FRONT_ADDR_MD = 'tcp://116.228.171.216:41213';
    BROKER_ID = '6090';
    INVESTOR_ID = '10501951';
    PASSWORD = 'wy518888';
end

capital = GetAccountInfo(FRONT_ADDR_TD,BROKER_ID,...
    INVESTOR_ID,PASSWORD);

function [str]=num2bankScalar(num)
%      num=floor(num*100)/100;
     str = num2str(num);
%      k=find(str == '.', 1);
%      if(isempty(k))
%          str=[str,'.00'];
%      end
%      FIN = min(length(str),find(str == '.')-1);
%      for i = FIN-2:-3:2
     for i = length(str)-2:-3:2
         str(i+1:end+1) = str(i:end);
         str(i) = ',';
     end
end

function [str]=num2bank(num)
     str = arrayfun(@(x) num2bankScalar(x) , num, 'UniformOutput', false); 
end

strCapital = num2bank(capital);

set(handles.text13,'string',strCapital);
set(handles.text13,'Enable','on');

capital = capital+70e4;

end












