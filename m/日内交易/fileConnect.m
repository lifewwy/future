function fileConnect(futureCode)

% clear; clc; close all;
% ƴ�ӷ�ʱ�ߵ�������Լ

diretory1 = 'C:\D\future\����ά��\';
% futureCode = 'j';

filename = [diretory1, futureCode, ...
    '888','.csv'];
    
if exist(filename,'file')
else
    disp('�ļ������ڣ�');
    return;
end
    
dstruct = importdata(filename);

% display(dstruct.textdata(1,:));
ddate = dstruct.textdata;

csvData = dstruct.data;

unique(csvData(:,6)) 


%% ������Լ������ƴ��
diretory1 = 'C:\D\future\��ʱ����\�·ݺ�Լ\';
diretory2 = 'C:\D\future\��ʱ����\';
Contract = unique(csvData(:,6));
nCount = 0;
flg = 0;
for i = 1:length(Contract)
    
    filename = [diretory1, futureCode, ...
        num2str(Contract(i)), '(1����).csv'];
    
    if exist(filename,'file')
        nCount = nCount+1;
        flg = 1;
        disp([filename, ' !']);
    else
        disp([filename,' �����ڣ�']);
        if flg == 1
            fprint(2,'�·ݺ�Լ�ж�\n');
        end
        continue;
    end
    
    t = datenum(ddate(csvData(:,6) == Contract(i)));
    
    dstruct1 = importdata(filename);
    
    % display(dstruct.textdata(1,:));
    ddate1 = dstruct1.textdata; 
    ddate1 = floor( datenum(ddate1) );
    
    pos1 = find(ddate1 == t(1));
    pos2 = find(ddate1 == t(end));
    
    ddate1 = dstruct1.textdata( pos1(1) : pos2(end) ) ;
    csvData1 = dstruct1.data(pos1(1) : pos2(end),:);
    
    % д csv �ļ�
    if nCount == 1
        fid = fopen([diretory2 ,futureCode,'(1����)', '.csv'], 'wt');
    end
    
    size_csvData = size(csvData1);
    for k = 1:size_csvData(1)
        fprintf(fid, '%s,', char(ddate1(k)));
        fprintf(fid, '%f,', csvData1(k,1));
        fprintf(fid, '%f,', csvData1(k,2));
        fprintf(fid, '%f,', csvData1(k,3));
        fprintf(fid, '%f,', csvData1(k,4));
        fprintf(fid, '%f,', csvData1(k,5));
        fprintf(fid, '%f\n', csvData1(k,6));
    end


end

fclose(fid);

    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    