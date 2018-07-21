% clear all;  clc;  close all; 

clearvars -except closePrice RecordTimes ...
    templet1 t1 t2 t3 t4;

RecordTimes = RecordTimes+1 %#ok

%% 取系统时间
time = clock;    hour = time(4);
minute = time(5); second = time(6);

if ( hour == 2 ) && ( minute == 30 )
    stop(t1);
end

if ( hour == 15 ) && ( minute == 15 )
    stop(t2);
    fileName = ['closePrice',num2str(datenum(date))];
    eval([fileName,' = closePrice;']);
    tt = ['save ',  fileName, ' ', fileName];
    eval(tt);
end
    

%% 取得窗口位置
title = '国贸期货';
hwin = findWindows(title);

% hwin = [592106 , 67312]; % 窗口句柄
rect =  GetWindowPosition(hwin);

%% 截屏
OriginalDat = PrtScrn(1); 

% imshow(dat);
%% 剪裁出识别区域

RowRange = rect(2,1)+94:rect(2,1)+848 ;
ColRange = rect(1,1)+180:rect(1,1)+320;

dat = OriginalDat( RowRange , ColRange, :);

%% 转成二值图像
% d = rgb2gray(dat) ;
d = im2bw(dat,0);

%% 行分割
rowIndex = RowDivision(d);

%% 删除无效行
rowMidDistance = 41;
rowMidPos = transpose(35:41:18*rowMidDistance);
rowMidRange = [rowMidPos-5, rowMidPos+5];

deleteRowFlag = zeros(1,length(rowMidPos));
for m = 1:length(rowIndex)
    flag = 0;
    for n = 1:length(rowMidRange)
        flag = flag+~isempty( intersect( ...
            rowIndex(m,1):rowIndex(m,2), ...
            rowMidRange(n,1):rowMidRange(n,2) ) );
    end
    deleteRowFlag(m) = flag;
end
rowIndex(deleteRowFlag==0,:) = [];

%% 列分割及识别
rowWidth = rowIndex (:, 2)-rowIndex (:, 1) + 1;
closePriceTmp = zeros(1,length(rowMidPos));
closePriceTmp(rowWidth<5) = NaN;

for i = 1:length(rowIndex)
    if rowWidth(i)>=5
        [d2, ColIndex] = ColDivision(d, rowIndex,i);
        [RecogRes, emin] = Recognization (d2, ColIndex,templet1) ;
        % plot (emin) ;
        % RecogRes %#ok
        closePriceTmp(i) = RecogRes;
    end
    
end
% closePriceTmp

closePrice(RecordTimes,1) = datenum(date);
closePrice(RecordTimes,2) = hour;
closePrice(RecordTimes,3) = minute;
closePrice(RecordTimes,4) = second;
closePrice(RecordTimes,5:end) = closePriceTmp;

% closePrice(RecordTimes,2:4)


%% 画图
% figure, subplot(121); imshow(dat);
% subplot(122); imshow(d2);



    
    
    
    
    
    
    


































