function IsSuccessful = GetMyAccount(handles)
% clear; 
clc;

IsSuccessful = 0;

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
pp  = mfilename('fullpath');
i = strfind(pp,'\');

folder1 = pp(1:i(end));
% folder2 = 'C:\D\future\';
% 20180214
% folder2 = pp(1:i(end-3));
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

capital = GetAccountInfo1(FRONT_ADDR_TD,BROKER_ID,...
    INVESTOR_ID,PASSWORD,AccountSelection);

if capital==0
    return;
end

if AccountSelection == 1
    capital = capital+70e4-12e4;
else
%     capital = 100;
end
%% ��TB����ļ�
% yyyymmdd = datestr(now,'yyyymmdd');
% % filename = [directory2,'����','20161212','.txt'];
% filename = [folder2,'����',yyyymmdd,'.txt'];
% if exist(filename,'file') == 2
%     d1 = importdata(filename);
% else
%     fprintf(2,'------------ �޽��ף�------------\n');
%     return;
% end
% 
% cy = {'��һ','A'; '����','AL'; '�ƽ�','AU'; '����','C'; '�޻�','CF'; '��ͭ','CU'; 
%     '����', 'FG';'��ָ','IF'; '��̿','J'; '����','L'; '����','M'; '�״�','MA';
%     '������' ,'OI';'�����','P'; '���Ƹ�','RB'; '��', 'RU';'����','SR'; 
%     'PTA','TA'; 'PVC','V'; '����','Y'; '��п','ZN'};
% 
% % ȥ������
% d1( strcmp(d1,'') == 1 ) = [];
% 
% % �ϲ���ͬ����
% warning('off'); %#ok
% d1 = unique(d1,'rows');
% 
% nOrders = length(d1);
% contract = cell(nOrders,1);
% risk = zeros(nOrders,1); 
% action = cell(nOrders,1); 
% for n = 1:nOrders
%     pos1 = strfind( d1{n}, ' ');
%     contract(n) = {d1{n}(pos1(2)+1:pos1(3)-1)};
%     [p1,~] = find(strcmp(contract{n}(1:end-4),cy) == 1);
%     contract(n) = {[cy{p1,2},contract{n}(end-3:end)]};
%     
%     pos2 = strfind( d1{n}, 'ÿ�ַ��գ�');
%     risk(n) = str2double(d1{n}(pos2+5:end));
%     if strcmp( contract{n}(1:end-4) , 'IF')
%         risk(n) = risk(n)*300;
%     end
%     
%     if isempty(pos2)
%         pos2 = pos1(3)+2+2;
%     end;
%     action(n) = {d1{n}(pos1(3)+2:pos2-1)};
%     action{n}(action{n} == ' ') = [];
%     action{n}(action{n} == '��') = [];
% end
% % contract
% % risk
% % action

%% �����������ļ�
% filename = [folder1,'�������ñ�.csv'];
% if exist(filename,'file') == 2
%     d2 = importdata(filename);
% end
% 
% riskPCT = zeros(nOrders,1);
% for n = 1:nOrders
%     riskPCT(n) = d2.data(strcmpi(d2.textdata,contract{n}(1:end-4)));
% end
% % riskPCT
%% д csv �ļ�
switch AccountSelection
    case 1
        adInfo = '��ó�ڻ�';
    case 2
        adInfo = '�º��ڻ�';
    case 3
        adInfo = 'SimNow1';
    case 4
        adInfo = 'SimNow2';
end

fid = fopen([folder1, '�ʽ�-',adInfo,'.csv'], 'a+');
fprintf(fid, '%s,', datestr(now,'yyyy/mm/dd HH:MM:SS'));
fprintf(fid, '%f\n', capital);
fclose(fid);
disp('�ʽ��ļ����³ɹ���');

%% ��������ļ�
% filename = [folder1,'����.csv'];
% 
% % 2017.09.11 ע�͵�������Լʱ����д�붩����
% % if exist(filename,'file') == 2
% %     d3 = importdata(filename);
% %     if datenum(d3.textdata{end,1},'yyyy/mm/dd') ...
% %             == datenum(datestr(now,'yyyy/mm/dd'),'yyyy/mm/dd')
% %         fprintf(2,'�����ļ��Ѿ������£�\n');
% %         return;
% %     end
% % end
% 
% hands = capital*riskPCT*0.9./risk;
% hands = floor(hands) + double((hands-floor(hands))>=0.7);
% 
% % fid = fopen(['orders', '.csv'],'wt');
% % fid = fopen([directory, 'orders.csv'],'a+');
% fid = fopen(filename,'a+');
% fprintf(fid, '\n');
% for n = 1:nOrders
%     fprintf(fid, '%s,', datestr(now,'yyyy/mm/dd'));
%     fprintf(fid, '%s,', contract{n});
%     fprintf(fid, '%s,', action{n});
%     fprintf(fid, '%d\n', hands(n));
% end
% fclose(fid);
% disp('�����ļ����³ɹ���');

%% ����
IsSuccessful = 1;

end











