function [ index ] = indexFutureCode( futureCode )

diretory = 'C:\D\future\��ʱ����\';

index = [];
for i=1:length(futureCode)
    filename = [diretory, char(futureCode(i)), ...
        '(1����)','.csv'];
    
    if exist(filename,'file')
        
    else
        % disp([filename '�����ڣ�']);
        continue;
    end
   
    index = [index,i]; %#ok

end

