function csvIF888Refresh(futureCode,handles,fc,kDataJoinQuant)

% clear all ; clc;  close all;

%% �����ڻ����� �·ݺ�Լ
kData = SinaData(futureCode);

%% �� CSV �ļ�
% directory = 'C:\D\future\����ά��\';
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end));

filename = [directory,futureCode, '888.csv'];
if exist(filename,'file')
else
    return;
end

dstruct = importdata(filename);
% display(dstruct.textdata(1,:));
contractDate = datenum(dstruct.textdata);
csvData = dstruct.data;
csvData = [contractDate, csvData];

%% ���ݸ���ά��

% ��Ҫ���������
cdate = intersect( kData(:,1), csvData(end,1)+1 : datenum(date) );

if strcmp(futureCode , 'if')||strcmp(futureCode , 'IF')
    threshold = 1;
else
    threshold = 1.2;
end

if isempty(cdate)
    disp([filename,' �Ѿ��������ļ���']);
else
    
    currentContract = csvData(end,end);
    
    for k = 1:length(cdate)
        
        pos1 = find( kData(:,1) == cdate(k));
        
        pos3 = find( kData(:,7) == currentContract);
        pos4 = intersect(pos1,pos3);
        
        % �����ػ���Լ
        pos1 = pos1(kData(pos1,7) >= currentContract);
        
        % ���������ֵ���ڵ���
        % [~,pos2] = max(kData(pos1,6));
        % pos = pos1(pos2);    
        
        [~,ndx] = dsort(kData(pos1,6));
        pos3 = find(kData(pos1,end)==currentContract);
        if isempty(pos3)
            fprintf(2,[futureCode,' : ���ݴ���\n']);
            return;
        end
        if (kData(pos1(ndx(1)),end) ~= currentContract) && ...
                (kData(pos1(ndx(1)),6)/kData(pos1(pos3),6) > threshold)
            pos = pos1(ndx(1));
        else
            pos = pos1(pos3);
        end
        
  
        asdf = max(abs(kData(pos,2:5) - csvData(end,2:5))) / csvData(end,2);
        if (asdf>.5)
            fprintf(2,[futureCode,' : ���ݴ���\n']);
            return;
        end
        
        deltaOpen = kData(pos,2) - kData(pos4,2);
        csvData(:,2:5) = csvData(:,2:5) + deltaOpen;          
        csvData =  [csvData ; kData(pos,:)]; %#ok
        
        % �Ƚ� Sina Data �� JoinQuant Data 20180905
        if ~isempty(fc)
            commonData = intersect(kDataJoinQuant{strcmp(fc,futureCode)},kData(pos,:),'rows');
            if isempty(commonData)
                fprintf(2,'����Դ��ͻ!\n');
            end
        end
        
        % ��ӡ����Լ���
        if csvData(end,end) ~= csvData(end-1,end)
            fprintf(2,[datestr(csvData(end,1),'yyyy-mm-dd'),': ', futureCode, num2str(csvData(end-1,end)), ' -> ', ...
                futureCode, num2str(csvData(end,end)),'\n']);
            contract1 = [futureCode, num2str(csvData(end-1,end))];
            contract2 = [futureCode, num2str(csvData(end,end))];
            GenCCorders(contract1,contract2,handles);
        end
        
        currentContract = csvData(end,end);
        
    end
    
    
    % д csv �ļ�
    % directory = 'C:\D\future\����ά��\';
    fid = fopen([[directory,futureCode,'888'], '.csv'], 'wt');
    
    size_csvData = size(csvData);
    for k = 1:size_csvData(1)
        fprintf(fid, '%s,', datestr(csvData(k,1),'yyyy-mm-dd'));
        fprintf(fid, '%f,', csvData(k,2));
        fprintf(fid, '%f,', csvData(k,3));
        fprintf(fid, '%f,', csvData(k,4));
        fprintf(fid, '%f,', csvData(k,5));
        fprintf(fid, '%f,', csvData(k,6));
        fprintf(fid, '%f\n', csvData(k,7));
    end
    fclose(fid);
    disp([filename,' ���³ɹ���'])
    
    
end


end
















