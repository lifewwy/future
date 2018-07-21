function [ c ] = closePriceArray( futureCode, dtCell, index)

diretory = 'C:\D\future\��ʱ����\';

c = zeros(length(dtCell),length(index));
for i=1:length(index)
    filename = [diretory, char(futureCode(index(i))), ...
        '(1����)','.csv'];
    
    if exist(filename,'file')
    else
        % disp([filename '�����ڣ�']);
        return;
    end
    
    dstruct = importdata(filename);
    % display(dstruct.textdata(1,:));
    
    dateAndTime = dstruct.textdata;
    [~,pos1,pos2] = intersect(dtCell, ...
            dstruct.textdata);
        
    if length(pos1)~=length(dateAndTime)
        fprintf(2,'����\n');
        continue;
    end
    
    csvData = dstruct.data;
    c(pos1,i) = csvData(pos2,4);
end

end

