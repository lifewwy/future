clear all ; clc; close all;
folder = 'D:\future\突破-跟踪止损 优化记录 （两参数）\';
%% 分析 TB 参数报告
clc;  clearvars -except folder

filename = [folder '优化记录[SR888 - 1日线].csv'];
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1));
    profit = data(:,3);
    profit = reshape(profit,[],length(param1));
    
    figure; 
    subplot(2,1,1); surf(param1,param2,profit);view(2); axis tight; colorbar; title('白糖 SR888');  
    map = mycolormap(profit); colormap(map); 
 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(ar); colormap(map); 
    colorbar;
    
end

[26, 2.3] %#ok
        
%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[au888 - 1日线].csv'];
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1));
    profit = data(:,3);
    profit = reshape(profit,[],length(param1));
    
    figure; 
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('黄金 au888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
end
[11, 4.7] %#ok
%% 分析 TB 参数报告

clc;  clearvars -except folder
filename = [folder '优化记录[a9888 - 1日线].csv'];

if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1));
    profit = data(:,3);
    profit = reshape(profit,[],length(param1));
    
    figure; 
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('豆一 a9888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
end
[15, 4] %#ok

%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[ag888 - 1日线].csv'];
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1));
    profit = data(:,3);
    profit = reshape(profit,[],length(param1));
    
    figure; 
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight;  title('白银 ag888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
end
[30, 1.5] %#ok

%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[m9888 - 1日线].csv'];

if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1));
    profit = data(:,3);
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('豆粕 m9888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[11, 2] %#ok
%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[zn888 - 1日线].csv'];

if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1));
    profit = data(:,3);
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('锌 zn888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[61, 2.1] %#ok

%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[OI888 - 1日线].csv'];
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1));
    profit = data(:,3);
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('菜籽油 OI888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[9, .9] %#ok


%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[j9888 - 1日线].csv'];
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1));
    profit = data(:,3); 
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('焦炭 j9888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[32, 2.5] %#ok

%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[p9888 - 1日线].csv'];
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1));
    profit = data(:,3); 
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('棕榈油 p9888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[49, 4] %#ok


%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[ru888 - 1日线].csv'];
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1));
    profit = data(:,3); 
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('橡胶 ru888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[12, 1.8] %#ok
%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[bu888 - 1日线].csv'];

if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1)); 
    profit = data(:,3); 
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('沥青 bu888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[7, 1] %#ok

%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[rb888 - 1日线].csv'];

if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1));
    profit = data(:,3); 
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('螺纹钢 rb888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[15, 2.7] %#ok

%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[al888 - 1日线].csv'];

if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1));
    profit = data(:,3); 
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('沪铝 al888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[31, 1.4] %#ok

%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[CF888 - 1日线].csv'];

if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1));
    profit = data(:,3); 
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('棉花 CF888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[10, 2.2] %#ok

%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[cu888 - 1日线].csv'];
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1)); 
    profit = data(:,3); 
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('沪铜 cu888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[19, 2.4] %#ok

%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[IF888 - 1日线].csv'];
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1)); 
    profit = data(:,3); 
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('股指 IF888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[17, 2.2] %#ok

%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[c9888 - 1日线].csv'];

if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1)); 
    profit = data(:,3); 
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('玉米 c9888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[25, 3.3] %#ok

%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[l9888 - 1日线].csv'];

if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1)); 
    profit = data(:,3); 
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('塑料 l9888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[43, 2.7] %#ok

%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[y9888 - 1日线].csv'];

if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1)); 
    profit = data(:,3); 
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('豆油 y9888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[90, 4] %#ok
%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[TA888 - 1日线].csv'];

if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1)); 
    profit = data(:,3); 
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('PTA TA888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[22, 3.3] %#ok
%% 分析 TB 参数报告
clc;  clearvars -except folder
filename = [folder '优化记录[FG888 - 1日线].csv'];

if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1)); 
    profit = data(:,3); 
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('玻璃 FG888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[12,1.9] %#ok


%% 分析 TB 参数报告

clc;  clearvars -except folder
filename = [folder '优化记录[RI888 - 1日线].csv'];

if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    data = dstruct.data;
    
    data = sortrows(data);
    
    param1 = data(:,1); param2 = data(:,2);
    param1 = unique(param1);  param2 = unique(param2);
    
    ar = data(:,3)./data(:,7)./(-data(:,30)); 
    ar = reshape(ar,[],length(param1)); 
    profit = data(:,3); 
    profit = reshape(profit,[],length(param1));
    
    figure;  
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('稻谷 RI888');
    % map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    % map = mycolormap(profit); colormap(map); 
    
end
[] %#ok





