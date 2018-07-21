clear all ; clc; close all;
folder = 'D:\future\˫���߸���ֹ�� �Ż���¼ ����������\';
%% ���� TB ��������
clc;  clearvars -except folder

filename = [folder,'�Ż���¼[SR888 - 1����] SlowMA60Day.csv'];
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
    subplot(2,1,1); surf(param1,param2,profit);view(2); axis tight;   
    map = mycolormap(profit); colormap(map); 
    colorbar; title('���� SR888');
   
    
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(ar); colormap(map); 
    colorbar;
    
end

[9, 2.5] %#ok

%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder,'�Ż���¼[a9888 - 1����] SlowMA60Day.csv'];

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
    subplot(2,1,1); surf(param1,param2,profit);view(2); axis tight;   
    map = mycolormap(profit); colormap(map); 
    colorbar; title('��һ a9888');
   
    
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(ar); colormap(map); 
    colorbar;
    
end

[8, 4.2] %#ok
        
%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder,'�Ż���¼[v9888 - 1����]SlowMA120Day.csv'];

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
    subplot(2,1,1); surf(param1,param2,profit);view(2); axis tight;   
    map = mycolormap(profit); colormap(map); 
    colorbar; title('PVC v9888');
    
    
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(ar); colormap(map); 
    colorbar;
    
end

[ ] %#ok


















