clear; clc; close all force;

time = clock;
time = str2double([num2str(time(4),'%02.0f'), num2str(time(5),'%02.0f')]);

if ~((time>1530)&&(time<2056))
    return;
end

title = '�����ڻ�';

winTitle = WindowTitle(title) %#ok
pos1 = strfind(winTitle , 'Ȩ��');
pos2 = strfind(winTitle , '�����ʽ�');
capital = winTitle(pos1+3:pos2-2);
capital(capital == ',') = [];
capital = str2double(capital) %#ok
if isnan(capital)
    fprintf(2, '��ȡ�ʽ����\n');
    return;
end

% datestr(now,'yyyy/mm/dd')

%% д csv �ļ�
time = clock;
time = str2double([num2str(time(4),'%02.0f'), num2str(time(5),'%02.0f')]);

if (time>1530)&&(time<2056)
    fid = fopen(['�ʽ�', '.csv'], 'a+');
    
    fprintf(fid, '%s,', datestr(now,'yyyy/mm/dd'));
    fprintf(fid, '%f\n', capital);
    
    fclose(fid);
    disp(' ���³ɹ���');
end




