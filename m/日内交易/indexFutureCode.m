function [ index ] = indexFutureCode( futureCode )

diretory = 'C:\D\future\分时数据\';

index = [];
for i=1:length(futureCode)
    filename = [diretory, char(futureCode(i)), ...
        '(1分钟)','.csv'];
    
    if exist(filename,'file')
        
    else
        % disp([filename '不存在！']);
        continue;
    end
   
    index = [index,i]; %#ok

end

