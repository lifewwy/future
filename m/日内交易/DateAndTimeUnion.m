function [ dtCell, dtNum] = DateAndTimeUnion( futureCode )

% ���ʱ�伯

diretory = 'C:\D\future\��ʱ����\';

index = [];
for i=1:length(futureCode)
    filename = [diretory, char(futureCode(i)), ...
        '(1����)','.csv'];
    
    if exist(filename,'file')
        disp([filename]);
    else
        % disp([filename '�����ڣ�']);
        continue;
    end
    
    dstruct = importdata(filename);
    % display(dstruct.textdata(1,:));
    
    % dateAndTime = dstruct.textdata;
    % csvData = dstruct.data;
    
    index = [index,i]; %#ok
    
    if length(index) == 1
        dtCell = dstruct.textdata;
    else
        [dtCell,~,~] = union(dtCell, ...
            dstruct.textdata);
        
    end
    
end

if nargout==2
    
    dtNum = datenum(dtCell);
    
    [~,i] = sort(dtNum);
    if sum(diff(i)-1) ~= 0
        disp('����ʱ��û�а�˳�����У�');
        dtNum = [];
    end
    
end


end

