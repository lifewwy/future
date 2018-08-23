function IsDataUpdateCompleted = main_csv888Refresh_daily(h)
% clear; clc;  close all;

fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = [fp(1:pp(end-1)),'m\���ٿ���-��¼�ʽ�-ͼ��ʶ��-4\���ٿ���'];
filename00 = [directory,'\IsDataUpdateCompleted.mat'];

IsDataUpdateCompleted = 0; 
save(filename00,'IsDataUpdateCompleted')

%% ��ʱ���ݸ���

time = clock;
time = str2double([num2str(time(4),'%02.0f'), num2str(time(5),'%02.0f')]);

if ~((time>1530)&&(time<2053))
    fprintf(2,'������ȷʱ�ν�������ά����\n');
    return;
end

filename = 'TA888.csv';
if exist(filename,'file')
else
    return;
end
dstruct = importdata(filename);
% display(dstruct.textdata(1,:));
% contractDate = datenum(dstruct.textdata);
UpdatedDate = dstruct.textdata{end};
[~,DayName] = weekday(UpdatedDate,'long');

% ---------------- 2018.07.13 �޸� -----------------
% % set(0,'DefaultUicontrolFontsize',8)
% choice = questdlg({'�ϴθ�������Ϊ: ';UpdatedDate;DayName}, ...
%     '��������', ...
%     '����','�˳�','�˳�');
% % Handle response
% switch choice
%     case '����'
%     case '�˳�'
%         return;
% end

fprintf(['�ϴθ�������Ϊ: ',UpdatedDate, ' ', DayName ,'\n\n']);
% --------------------------------------------------

[IsTodayClosed,~,~] = IsMarketClosed(now);
% if strcmp(IsTodayClosed(1:2),'����')
if strfind(IsTodayClosed,'����')
    fprintf(2,'�������У���ֹ���ݸ��£�\n');
    return;
end

aa = datenum(UpdatedDate):today;
len = length(aa);
if length(aa) > 2
    for i = 2:len-1
        [IsTodayClosed,~,~] = IsMarketClosed(aa(i));
        if strcmp(IsTodayClosed,'����');
            fprintf(2,'���ݲ��������޷����и��£�\n');
            return;
        end
    end
end

% if length(aa) == 1
%     fprintf(2,'���������Ѿ����£�\n');
%     IsDataUpdateCompleted = 1; 
%     save(filename00,'IsDataUpdateCompleted')
%     return;
% end

%% ��������
fprintf('��ʼ���ݸ���...\n\n');

csv888RefreshOneDay('A',h);
csv888RefreshOneDay('C',h);
csv888RefreshOneDay('RB',h);
csv888RefreshOneDay('M',h);
csv888RefreshOneDay('P',h);
csv888RefreshOneDay('J',h);
csv888RefreshOneDay('ZN',h);
csv888RefreshOneDay('Y',h);
csv888RefreshOneDay('L',h);
csv888RefreshOneDay('AG',h);
csv888RefreshOneDay('TA',h);
csv888RefreshOneDay('SR',h);
csv888RefreshOneDay('AU',h);
csv888RefreshOneDay('FG',h);
csv888RefreshOneDay('MA',h);
csv888RefreshOneDay('RU',h);
csv888RefreshOneDay('AL',h);
csv888RefreshOneDay('OI',h);
csv888RefreshOneDay('RM',h);
csv888RefreshOneDay('CF',h);
csv888RefreshOneDay('I',h);
csv888RefreshOneDay('JM',h);
csv888RefreshOneDay('CU',h);
% csv888RefreshOneDay('RI');
csv888RefreshOneDay('V',h);

csvIF888Refresh('IF',h);

fprintf('\n���ݸ�����ɣ�\n');

GenerateImportFile;  % 20180822

%% ����״̬
IsDataUpdateCompleted = 1; 
save(filename00,'IsDataUpdateCompleted')
end













































