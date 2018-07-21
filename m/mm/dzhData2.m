% 大智慧的月份合约数据 和 TB连续合约数据对照 
clear all ; clc; close all;
%% TB 连续合约数据
filename = 'ru888TB.csv';
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    
    date1 = datenum(dstruct.textdata(2:end,1));
    data1 = dstruct.data;
    Kdata1  = [date1, data1];
end

%% 大智慧月份合约数据
filename = 'ru1405dzh.xls';
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    
    date2 = dstruct.textdata(3:end,1);
    data2 = dstruct.data;
    Kdata2 = [datenum(date2) data2(:,1:4)];
end

% 找出日期相同的位置
[~,pos2,pos1] = intersect(Kdata1(:,1),Kdata2(:,1));
SameDatePos(:,1) = pos1;  SameDatePos(:,2) = pos2; 

SameDateAndPricePos1 = find(Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) == 0);
SameDateAndPricePos2 = find(Kdata1(SameDatePos(:,2),3) - Kdata2(SameDatePos(:,1),3) == 0);
SameDateAndPricePos3 = find(Kdata1(SameDatePos(:,2),4) - Kdata2(SameDatePos(:,1),4) == 0);
SameDateAndPricePos4 = find(Kdata1(SameDatePos(:,2),5) - Kdata2(SameDatePos(:,1),5) == 0);
SameDateAndPricePos = intersect( intersect(SameDateAndPricePos1,SameDateAndPricePos2), ...
    intersect(SameDateAndPricePos3,SameDateAndPricePos4) );

% 相同的日期和价格是否连续
if sum(sum(diff(SameDatePos(SameDateAndPricePos,:)))) == length(SameDateAndPricePos)*2-2
    disp('OK!');
end


% plot( Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) ); grid; .

% figure; plot(Kdata1(:,2)); hold on; % 连续合约收盘价
figure; hold on; % 连续合约收盘价

x = SameDatePos(SameDateAndPricePos,2); pos = find(diff(x)~=1); 
y = Kdata2(SameDatePos(SameDateAndPricePos,1),2);
color = rand(1,3);
for i = 1:length(pos)
    if i==1
        plot(x(1:pos(1)),y(1:pos(1)),'Color',rand(1,3));
    else
        plot(x(pos(i-1)+1:pos(i)),y(pos(i-1)+1:pos(i)),'Color',color);
    end
end
plot(x(pos(end)+1:end),y(pos(end)+1:end),'Color',color);

    
% plot(SameDatePos(SameDateAndPricePos,2),Kdata2(SameDatePos(SameDateAndPricePos,1),2),'r','LineWidth',2);


%% 大智慧月份合约数据
clearvars -except Kdata1

filename = 'ru1409dzh.xls';
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    
    date2 = dstruct.textdata(3:end,1);
    data2 = dstruct.data;
    Kdata2 = [datenum(date2) data2(:,1:4)];
end

% 找出日期相同的位置
[~,pos2,pos1] = intersect(Kdata1(:,1),Kdata2(:,1));
SameDatePos(:,1) = pos1;  SameDatePos(:,2) = pos2; 

SameDateAndPricePos1 = find(Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) == 0);
SameDateAndPricePos2 = find(Kdata1(SameDatePos(:,2),3) - Kdata2(SameDatePos(:,1),3) == 0);
SameDateAndPricePos3 = find(Kdata1(SameDatePos(:,2),4) - Kdata2(SameDatePos(:,1),4) == 0);
SameDateAndPricePos4 = find(Kdata1(SameDatePos(:,2),5) - Kdata2(SameDatePos(:,1),5) == 0);
SameDateAndPricePos = intersect( intersect(SameDateAndPricePos1,SameDateAndPricePos2), ...
    intersect(SameDateAndPricePos3,SameDateAndPricePos4) );

% 相同的日期和价格是否连续
if sum(sum(diff(SameDatePos(SameDateAndPricePos,:)))) == length(SameDateAndPricePos)*2-2
    disp('OK!');
end


% plot( Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) ); grid; .

% figure; plot(Kdata1(:,2)); hold on;


x = SameDatePos(SameDateAndPricePos,2); pos = find(diff(x)~=1); 
y = Kdata2(SameDatePos(SameDateAndPricePos,1),2);
color = rand(1,3);
for i = 1:length(pos)
    if i==1
        plot(x(1:pos(1)),y(1:pos(1)),'Color',rand(1,3));
    else
        plot(x(pos(i-1)+1:pos(i)),y(pos(i-1)+1:pos(i)),'Color',color);
    end
end
plot(x(pos(end)+1:end),y(pos(end)+1:end),'Color',color);


% plot(SameDatePos(SameDateAndPricePos,2),Kdata2(SameDatePos(SameDateAndPricePos,1),2),'Color',rand(1,3));

%% 大智慧月份合约数据
clearvars -except Kdata1

filename = 'ru1503dzh.xls';
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    
    date2 = dstruct.textdata(3:end,1);
    data2 = dstruct.data;
    Kdata2 = [datenum(date2) data2(:,1:4)];
end

% 找出日期相同的位置
[~,pos2,pos1] = intersect(Kdata1(:,1),Kdata2(:,1));
SameDatePos(:,1) = pos1;  SameDatePos(:,2) = pos2; 

SameDateAndPricePos1 = find(Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) == 0);
SameDateAndPricePos2 = find(Kdata1(SameDatePos(:,2),3) - Kdata2(SameDatePos(:,1),3) == 0);
SameDateAndPricePos3 = find(Kdata1(SameDatePos(:,2),4) - Kdata2(SameDatePos(:,1),4) == 0);
SameDateAndPricePos4 = find(Kdata1(SameDatePos(:,2),5) - Kdata2(SameDatePos(:,1),5) == 0);
SameDateAndPricePos = intersect( intersect(SameDateAndPricePos1,SameDateAndPricePos2), ...
    intersect(SameDateAndPricePos3,SameDateAndPricePos4) );

% 相同的日期和价格是否连续
if sum(sum(diff(SameDatePos(SameDateAndPricePos,:)))) == length(SameDateAndPricePos)*2-2
    disp('OK!');
end


% plot( Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) ); grid; .

% figure; plot(Kdata1(:,2)); hold on;
% plot(SameDatePos(SameDateAndPricePos,2),Kdata2(SameDatePos(SameDateAndPricePos,1),2),'Color',rand(1,3));


x = SameDatePos(SameDateAndPricePos,2); pos = find(diff(x)~=1); 
y = Kdata2(SameDatePos(SameDateAndPricePos,1),2);
color = rand(1,3);
for i = 1:length(pos)
    if i==1
        plot(x(1:pos(1)),y(1:pos(1)),'Color',rand(1,3));
    else
        plot(x(pos(i-1)+1:pos(i)),y(pos(i-1)+1:pos(i)),'Color',color);
    end
end
plot(x(pos(end)+1:end),y(pos(end)+1:end),'Color',color);

%% 大智慧月份合约数据
clearvars -except Kdata1

filename = 'ru1404dzh.xls';
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    
    date2 = dstruct.textdata(3:end,1);
    data2 = dstruct.data;
    Kdata2 = [datenum(date2) data2(:,1:4)];
end

% 找出日期相同的位置
[~,pos2,pos1] = intersect(Kdata1(:,1),Kdata2(:,1));
SameDatePos(:,1) = pos1;  SameDatePos(:,2) = pos2; 

SameDateAndPricePos1 = find(Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) == 0);
SameDateAndPricePos2 = find(Kdata1(SameDatePos(:,2),3) - Kdata2(SameDatePos(:,1),3) == 0);
SameDateAndPricePos3 = find(Kdata1(SameDatePos(:,2),4) - Kdata2(SameDatePos(:,1),4) == 0);
SameDateAndPricePos4 = find(Kdata1(SameDatePos(:,2),5) - Kdata2(SameDatePos(:,1),5) == 0);
SameDateAndPricePos = intersect( intersect(SameDateAndPricePos1,SameDateAndPricePos2), ...
    intersect(SameDateAndPricePos3,SameDateAndPricePos4) );

% 相同的日期和价格是否连续
if sum(sum(diff(SameDatePos(SameDateAndPricePos,:)))) == length(SameDateAndPricePos)*2-2
    disp('OK!');
end


% plot( Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) ); grid; .

% figure; plot(Kdata1(:,2)); hold on;
% plot(SameDatePos(SameDateAndPricePos,2),Kdata2(SameDatePos(SameDateAndPricePos,1),2),'Color',rand(1,3));

x = SameDatePos(SameDateAndPricePos,2); pos = find(diff(x)~=1); 
y = Kdata2(SameDatePos(SameDateAndPricePos,1),2);
color = rand(1,3);
for i = 1:length(pos)
    if i==1
        plot(x(1:pos(1)),y(1:pos(1)),'Color',rand(1,3));
    else
        plot(x(pos(i-1)+1:pos(i)),y(pos(i-1)+1:pos(i)),'Color',color);
    end
end
plot(x(pos(end)+1:end),y(pos(end)+1:end),'Color',color);

%% 大智慧月份合约数据
clearvars -except Kdata1

filename = 'ru1406dzh.xls';
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    
    date2 = dstruct.textdata(3:end,1);
    data2 = dstruct.data;
    Kdata2 = [datenum(date2) data2(:,1:4)];
end

% 找出日期相同的位置
[~,pos2,pos1] = intersect(Kdata1(:,1),Kdata2(:,1));
SameDatePos(:,1) = pos1;  SameDatePos(:,2) = pos2; 

SameDateAndPricePos1 = find(Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) == 0);
SameDateAndPricePos2 = find(Kdata1(SameDatePos(:,2),3) - Kdata2(SameDatePos(:,1),3) == 0);
SameDateAndPricePos3 = find(Kdata1(SameDatePos(:,2),4) - Kdata2(SameDatePos(:,1),4) == 0);
SameDateAndPricePos4 = find(Kdata1(SameDatePos(:,2),5) - Kdata2(SameDatePos(:,1),5) == 0);
SameDateAndPricePos = intersect( intersect(SameDateAndPricePos1,SameDateAndPricePos2), ...
    intersect(SameDateAndPricePos3,SameDateAndPricePos4) );

% 相同的日期和价格是否连续
if sum(sum(diff(SameDatePos(SameDateAndPricePos,:)))) == length(SameDateAndPricePos)*2-2
    disp('OK!');
end


% plot( Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) ); grid; .

% plot(SameDatePos(SameDateAndPricePos,2),Kdata2(SameDatePos(SameDateAndPricePos,1),2),'Color',rand(1,3));


x = SameDatePos(SameDateAndPricePos,2); pos = find(diff(x)~=1); 
y = Kdata2(SameDatePos(SameDateAndPricePos,1),2);
color = rand(1,3);
for i = 1:length(pos)
    if i==1
        plot(x(1:pos(1)),y(1:pos(1)),'Color',rand(1,3));
    else
        plot(x(pos(i-1)+1:pos(i)),y(pos(i-1)+1:pos(i)),'Color',color);
    end
end
plot(x(pos(end)+1:end),y(pos(end)+1:end),'Color',color);


%% 大智慧月份合约数据
clearvars -except Kdata1

filename = 'ru1407dzh.xls';
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    
    date2 = dstruct.textdata(3:end,1);
    data2 = dstruct.data;
    Kdata2 = [datenum(date2) data2(:,1:4)];
end

% 找出日期相同的位置
[~,pos2,pos1] = intersect(Kdata1(:,1),Kdata2(:,1));
SameDatePos(:,1) = pos1;  SameDatePos(:,2) = pos2; 

SameDateAndPricePos1 = find(Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) == 0);
SameDateAndPricePos2 = find(Kdata1(SameDatePos(:,2),3) - Kdata2(SameDatePos(:,1),3) == 0);
SameDateAndPricePos3 = find(Kdata1(SameDatePos(:,2),4) - Kdata2(SameDatePos(:,1),4) == 0);
SameDateAndPricePos4 = find(Kdata1(SameDatePos(:,2),5) - Kdata2(SameDatePos(:,1),5) == 0);
SameDateAndPricePos = intersect( intersect(SameDateAndPricePos1,SameDateAndPricePos2), ...
    intersect(SameDateAndPricePos3,SameDateAndPricePos4) );

% 相同的日期和价格是否连续
if sum(sum(diff(SameDatePos(SameDateAndPricePos,:)))) == length(SameDateAndPricePos)*2-2
    disp('OK!');
end


% plot( Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) ); grid; .

% plot(SameDatePos(SameDateAndPricePos,2),Kdata2(SameDatePos(SameDateAndPricePos,1),2),'Color',rand(1,3));

x = SameDatePos(SameDateAndPricePos,2); pos = find(diff(x)~=1); 
y = Kdata2(SameDatePos(SameDateAndPricePos,1),2);
color = rand(1,3);
for i = 1:length(pos)
    if i==1
        plot(x(1:pos(1)),y(1:pos(1)),'Color',rand(1,3));
    else
        plot(x(pos(i-1)+1:pos(i)),y(pos(i-1)+1:pos(i)),'Color',color);
    end
end
plot(x(pos(end)+1:end),y(pos(end)+1:end),'Color',color);


%% 大智慧月份合约数据
clearvars -except Kdata1

filename = 'ru1501dzh.xls';
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    
    date2 = dstruct.textdata(3:end,1);
    data2 = dstruct.data;
    Kdata2 = [datenum(date2) data2(:,1:4)];
end

% 找出日期相同的位置
[~,pos2,pos1] = intersect(Kdata1(:,1),Kdata2(:,1));
SameDatePos(:,1) = pos1;  SameDatePos(:,2) = pos2; 

SameDateAndPricePos1 = find(Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) == 0);
SameDateAndPricePos2 = find(Kdata1(SameDatePos(:,2),3) - Kdata2(SameDatePos(:,1),3) == 0);
SameDateAndPricePos3 = find(Kdata1(SameDatePos(:,2),4) - Kdata2(SameDatePos(:,1),4) == 0);
SameDateAndPricePos4 = find(Kdata1(SameDatePos(:,2),5) - Kdata2(SameDatePos(:,1),5) == 0);
SameDateAndPricePos = intersect( intersect(SameDateAndPricePos1,SameDateAndPricePos2), ...
    intersect(SameDateAndPricePos3,SameDateAndPricePos4) );

% 相同的日期和价格是否连续
if sum(sum(diff(SameDatePos(SameDateAndPricePos,:)))) == length(SameDateAndPricePos)*2-2
    disp('OK!');
end


% plot( Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) ); grid; .

% plot(SameDatePos(SameDateAndPricePos,2),Kdata2(SameDatePos(SameDateAndPricePos,1),2),'Color',rand(1,3));

x = SameDatePos(SameDateAndPricePos,2); pos = find(diff(x)~=1); 
y = Kdata2(SameDatePos(SameDateAndPricePos,1),2);
color = rand(1,3);
for i = 1:length(pos)
    if i==1
        plot(x(1:pos(1)),y(1:pos(1)),'Color',rand(1,3));
    else
        plot(x(pos(i-1)+1:pos(i)),y(pos(i-1)+1:pos(i)),'Color',color);
    end
end
plot(x(pos(end)+1:end),y(pos(end)+1:end),'Color',color);


%% 大智慧月份合约数据
clearvars -except Kdata1

filename = 'ru1411dzh.xls';
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    
    date2 = dstruct.textdata(3:end,1);
    data2 = dstruct.data;
    Kdata2 = [datenum(date2) data2(:,1:4)];
end

% 找出日期相同的位置
[~,pos2,pos1] = intersect(Kdata1(:,1),Kdata2(:,1));
SameDatePos(:,1) = pos1;  SameDatePos(:,2) = pos2; 

SameDateAndPricePos1 = find(Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) == 0);
SameDateAndPricePos2 = find(Kdata1(SameDatePos(:,2),3) - Kdata2(SameDatePos(:,1),3) == 0);
SameDateAndPricePos3 = find(Kdata1(SameDatePos(:,2),4) - Kdata2(SameDatePos(:,1),4) == 0);
SameDateAndPricePos4 = find(Kdata1(SameDatePos(:,2),5) - Kdata2(SameDatePos(:,1),5) == 0);
SameDateAndPricePos = intersect( intersect(SameDateAndPricePos1,SameDateAndPricePos2), ...
    intersect(SameDateAndPricePos3,SameDateAndPricePos4) );

% 相同的日期和价格是否连续
if sum(sum(diff(SameDatePos(SameDateAndPricePos,:)))) == length(SameDateAndPricePos)*2-2
    disp('OK!');
end


% plot( Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) ); grid; .

% plot(SameDatePos(SameDateAndPricePos,2),Kdata2(SameDatePos(SameDateAndPricePos,1),2),'Color',rand(1,3));

x = SameDatePos(SameDateAndPricePos,2); pos = find(diff(x)~=1); 
y = Kdata2(SameDatePos(SameDateAndPricePos,1),2);
color = rand(1,3);
for i = 1:length(pos)
    if i==1
        plot(x(1:pos(1)),y(1:pos(1)),'Color',rand(1,3));
    else
        plot(x(pos(i-1)+1:pos(i)),y(pos(i-1)+1:pos(i)),'Color',color);
    end
end
plot(x(pos(end)+1:end),y(pos(end)+1:end),'Color',color);

%% 大智慧月份合约数据
clearvars -except Kdata1

filename = 'ru1410dzh.xls';
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    
    date2 = dstruct.textdata(3:end,1);
    data2 = dstruct.data;
    Kdata2 = [datenum(date2) data2(:,1:4)];
end

% 找出日期相同的位置
[~,pos2,pos1] = intersect(Kdata1(:,1),Kdata2(:,1));
SameDatePos(:,1) = pos1;  SameDatePos(:,2) = pos2; 

SameDateAndPricePos1 = find(Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) == 0);
SameDateAndPricePos2 = find(Kdata1(SameDatePos(:,2),3) - Kdata2(SameDatePos(:,1),3) == 0);
SameDateAndPricePos3 = find(Kdata1(SameDatePos(:,2),4) - Kdata2(SameDatePos(:,1),4) == 0);
SameDateAndPricePos4 = find(Kdata1(SameDatePos(:,2),5) - Kdata2(SameDatePos(:,1),5) == 0);
SameDateAndPricePos = intersect( intersect(SameDateAndPricePos1,SameDateAndPricePos2), ...
    intersect(SameDateAndPricePos3,SameDateAndPricePos4) );

% 相同的日期和价格是否连续
if sum(sum(diff(SameDatePos(SameDateAndPricePos,:)))) == length(SameDateAndPricePos)*2-2
    disp('OK!');
end


% plot( Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) ); grid; .

% plot(SameDatePos(SameDateAndPricePos,2),Kdata2(SameDatePos(SameDateAndPricePos,1),2),'Color',rand(1,3));

x = SameDatePos(SameDateAndPricePos,2); pos = find(diff(x)~=1); 
y = Kdata2(SameDatePos(SameDateAndPricePos,1),2);
color = rand(1,3);
for i = 1:length(pos)
    if i==1
        plot(x(1:pos(1)),y(1:pos(1)),'Color',rand(1,3));
    else
        plot(x(pos(i-1)+1:pos(i)),y(pos(i-1)+1:pos(i)),'Color',color);
    end
end
plot(x(pos(end)+1:end),y(pos(end)+1:end),'Color',color);


%% 大智慧月份合约数据
clearvars -except Kdata1

filename = 'ru1408dzh.xls';
if exist(filename,'file')
    dstruct = importdata(filename);
    display(dstruct.textdata(1,:));
    
    date2 = dstruct.textdata(3:end,1);
    data2 = dstruct.data;
    Kdata2 = [datenum(date2) data2(:,1:4)];
end

% 找出日期相同的位置
[~,pos2,pos1] = intersect(Kdata1(:,1),Kdata2(:,1));
SameDatePos(:,1) = pos1;  SameDatePos(:,2) = pos2; 

SameDateAndPricePos1 = find(Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) == 0);
SameDateAndPricePos2 = find(Kdata1(SameDatePos(:,2),3) - Kdata2(SameDatePos(:,1),3) == 0);
SameDateAndPricePos3 = find(Kdata1(SameDatePos(:,2),4) - Kdata2(SameDatePos(:,1),4) == 0);
SameDateAndPricePos4 = find(Kdata1(SameDatePos(:,2),5) - Kdata2(SameDatePos(:,1),5) == 0);
SameDateAndPricePos = intersect( intersect(SameDateAndPricePos1,SameDateAndPricePos2), ...
    intersect(SameDateAndPricePos3,SameDateAndPricePos4) );

% 相同的日期和价格是否连续
if sum(sum(diff(SameDatePos(SameDateAndPricePos,:)))) == length(SameDateAndPricePos)*2-2
    disp('OK!');
end


% plot( Kdata1(SameDatePos(:,2),2) - Kdata2(SameDatePos(:,1),2) ); grid; .

% plot(SameDatePos(SameDateAndPricePos,2),Kdata2(SameDatePos(SameDateAndPricePos,1),2),'Color',rand(1,3));


x = SameDatePos(SameDateAndPricePos,2); pos = find(diff(x)~=1); 
y = Kdata2(SameDatePos(SameDateAndPricePos,1),2);
color = rand(1,3);
for i = 1:length(pos)
    if i==1
        plot(x(1:pos(1)),y(1:pos(1)),'Color',rand(1,3));
    else
        plot(x(pos(i-1)+1:pos(i)),y(pos(i-1)+1:pos(i)),'Color',color);
    end
end
plot(x(pos(end)+1:end),y(pos(end)+1:end),'Color',color);
























