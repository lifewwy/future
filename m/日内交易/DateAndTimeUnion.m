function [ dtCell, dtNum] = DateAndTimeUnion( futureCode )

% 最大时间集

diretory = 'C:\D\future\分时数据\';

index = [];
for i=1:length(futureCode)
    filename = [diretory, char(futureCode(i)), ...
        '(1分钟)','.csv'];
    
    if exist(filename,'file')
        disp([filename]);
    else
        % disp([filename '不存在！']);
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
        disp('日期时间没有按顺序排列！');
        dtNum = [];
    end
    
end


end

