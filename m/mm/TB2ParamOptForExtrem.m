clear all ; clc; close all;
folder = 'C:\D\future\��ֵϵͳ\';
%% ���� TB ��������
clc;  clearvars -except folder

filename = [folder '�Ż���¼[au888 - 1����].csv'];
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
%     colorbar; title('�� a9888');  
%     map = mycolormap(profit); colormap(map); 
 
    subplot(2,1,2); surf(param1,param2,ar);  view(2); axis tight;
%     colorbar; 
%     map = mycolormap(ar); colormap(map); 
%     colorbar;
    
end

[] %#ok





