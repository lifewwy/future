function dtNormalization( futureCode )

%% �����ں�ʱ���׼��Ϊ yyyy/mm/dd HH:MM
% clear; clc; close all;

%% �� CSV �ļ�

% diretory = 'C:\D\future\m\���ڽ���\';
% futureCode = [{'C'},{'RB'},{'M'},{'P'},...
%     {'J'},{'ZN'},{'Y'},{'RU'},{'L'},...
%     {'TA'},{'SR'}, ...
%     {'MA'},{'AL'},{'OI'},...
%     {'CU'}];


diretory = 'C:\D\future\��ʱ����\';
filename = [diretory, futureCode, '(1����)', '.csv'];

if exist(filename,'file')
else
    disp('�ļ������ڣ�');
    return;
end

dstruct = importdata(filename);
csvData = dstruct.data;
dt = dstruct.textdata;

dtStr = datestr(datenum(dt),'yyyy/mm/dd HH:MM');

% д csv �ļ�
fid = fopen(filename, 'wt');

for k = 1:size(dtStr,1)
    % dtStr(k,:)
    fprintf(fid, '%s,', dtStr(k,:));
    fprintf(fid, '%f,', csvData(k,1));
    fprintf(fid, '%f,', csvData(k,2));
    fprintf(fid, '%f,', csvData(k,3));
    fprintf(fid, '%f,', csvData(k,4));
    fprintf(fid, '%f,', csvData(k,5));
    fprintf(fid, '%f\n', csvData(k,6));
end
fclose(fid);
disp([filename,' ���ڱ�׼���ɹ���'])




















































































































































