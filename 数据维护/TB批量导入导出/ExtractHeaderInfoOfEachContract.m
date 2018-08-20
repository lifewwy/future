clc;close all; clear;

% ��ȡexport.dat�ļ���ÿ����Լ��ͷ��Ϣ

% ���ȼٶ�֪����Լ�Ⱥ�˳�򣬼�ÿ����Լ��һ����¼������
filename = 'export.dat';
load firstRecordOfContracts;
x = firstRecordOfContracts;

sx = size(x);
endPos = 0;
headInfo = cell(1,sx(1));
for i = 1:sx(1)
    dt = x{i,2};
    df = x{i,3};
    % ĳ��Լ��һ����¼��ͷλ��(�ֽڣ�
    beginPos = findRowInDAT(filename,dt,df,endPos); 
    % ��ȡ�ú�Լ�ļ�¼��
    N = getNfromFirstRecord(filename,beginPos);
    endPos = N*56+beginPos;
    
    if i==1
        sp = 0;
    end
    nbytes = beginPos-sp;

    headInfo(i) = {getHeaderInfo(sp,nbytes)};
 
    sp = endPos;
    
end

save headInfo headInfo












