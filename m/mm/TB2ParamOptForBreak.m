clear all ; clc; close all;
folder = 'D:\future\ͻ��-����ֹ�� �Ż���¼ ����������\';
%% ���� TB ��������
clc;  clearvars -except folder

filename = [folder '�Ż���¼[SR888 - 1����].csv'];
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
    subplot(2,1,1); surf(param1,param2,profit);view(2); axis tight; colorbar; title('���� SR888');  
    map = mycolormap(profit); colormap(map); 
 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(ar); colormap(map); 
    colorbar;
    
end

[26, 2.3] %#ok
        
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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('�ƽ� au888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
end
[11, 4.7] %#ok
%% ���� TB ��������

clc;  clearvars -except folder
filename = [folder '�Ż���¼[a9888 - 1����].csv'];

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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('��һ a9888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
end
[15, 4] %#ok

%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder '�Ż���¼[ag888 - 1����].csv'];
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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight;  title('���� ag888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
end
[30, 1.5] %#ok

%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder '�Ż���¼[m9888 - 1����].csv'];

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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('���� m9888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[11, 2] %#ok
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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('п zn888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[61, 2.1] %#ok

%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder '�Ż���¼[OI888 - 1����].csv'];
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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('������ OI888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[9, .9] %#ok


%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder '�Ż���¼[j9888 - 1����].csv'];
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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('��̿ j9888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[32, 2.5] %#ok

%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder '�Ż���¼[p9888 - 1����].csv'];
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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('����� p9888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[49, 4] %#ok


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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('�� ru888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[12, 1.8] %#ok
%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder '�Ż���¼[bu888 - 1����].csv'];

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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('���� bu888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[7, 1] %#ok

%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder '�Ż���¼[rb888 - 1����].csv'];

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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('���Ƹ� rb888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[15, 2.7] %#ok

%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder '�Ż���¼[al888 - 1����].csv'];

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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('���� al888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[31, 1.4] %#ok

%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder '�Ż���¼[CF888 - 1����].csv'];

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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('�޻� CF888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[10, 2.2] %#ok

%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder '�Ż���¼[cu888 - 1����].csv'];
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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('��ͭ cu888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[19, 2.4] %#ok

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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('��ָ IF888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[17, 2.2] %#ok

%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder '�Ż���¼[c9888 - 1����].csv'];

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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('���� c9888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[25, 3.3] %#ok

%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder '�Ż���¼[l9888 - 1����].csv'];

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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('���� l9888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[43, 2.7] %#ok

%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder '�Ż���¼[y9888 - 1����].csv'];

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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('���� y9888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[90, 4] %#ok
%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder '�Ż���¼[TA888 - 1����].csv'];

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
%% ���� TB ��������
clc;  clearvars -except folder
filename = [folder '�Ż���¼[FG888 - 1����].csv'];

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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('���� FG888');
    map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    map = mycolormap(profit); colormap(map); 
    
end
[12,1.9] %#ok


%% ���� TB ��������

clc;  clearvars -except folder
filename = [folder '�Ż���¼[RI888 - 1����].csv'];

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
    subplot(2,1,1); surf(param1,param2,profit);  colorbar; view(2); axis tight; title('���� RI888');
    % map = mycolormap(profit); colormap(map); 
    subplot(2,1,2); surf(param1,param2,ar); colorbar; view(2); axis tight;
    % map = mycolormap(profit); colormap(map); 
    
end
[] %#ok





