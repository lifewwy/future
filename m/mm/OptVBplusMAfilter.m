clear all ; clc; close all;
folder = 'D:\future\VBplusMAfilter �Ż���¼\';
%% ���� TB ��������
clc;  clearvars -except folder

filename = [folder '�Ż���¼[ru888 - 1����].csv'];
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
    subplot(2,1,1); surf(param1,param2,profit);view(2); axis tight; colorbar; title('�� ru888'); 
    map = mycolormap(profit); colormap(map); 
 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(ar); colormap(map); 
    colorbar;
    
end

[1.8, 1.5] %#ok

%% ���� TB ��������
clc;  clearvars -except folder

filename = [folder '�Ż���¼[IF888 - 1����].csv'];
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
    subplot(2,1,1); surf(param1,param2,profit);view(2); axis tight; colorbar; title('��ָ IF888');  
    map = mycolormap(profit); colormap(map); 
        
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(ar); colormap(map); 
    colorbar;
    
end

[] %#ok

%% ���� TB ��������
clc;  clearvars -except folder

filename = [folder '�Ż���¼[zn888 - 1����].csv'];
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
    subplot(2,1,1); surf(param1,param2,profit);view(2); axis tight; colorbar; title('��п zn888'); 
    map = mycolormap(profit); colormap(map); 
    
   
    
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(ar); colormap(map); 
    colorbar;
    
end

[] %#ok

%% ���� TB ��������
clc;  clearvars -except folder

filename = [folder '�Ż���¼[v9888 - 1����].csv'];
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
    subplot(2,1,1); surf(param1,param2,profit);view(2); axis tight;  colorbar; title('PVC v9888');  
    map = mycolormap(profit); colormap(map); 
  
   
    
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(ar); colormap(map); 
    colorbar;
    
    
end

[] %#ok
































