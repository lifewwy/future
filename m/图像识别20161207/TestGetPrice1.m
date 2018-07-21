clear all;  clc;  close all; 
% close all;

%% 载入模板
load templet1

%% 取得窗口位置
title = '国贸期货';
hwin = findWindows(title);

% hwin = [592106 , 67312]; % 窗口句柄
% rect =  GetWindowPosition(hwin) %#ok

%% 截屏
% OriginalDat = PrtScrn(0); 

OriginalDat = PrtWin(hwin);
OriginalDat(:,:,1) = flipud(OriginalDat(:,:,1));
OriginalDat(:,:,2) = flipud(OriginalDat(:,:,2));
OriginalDat(:,:,3) = flipud(OriginalDat(:,:,3));

% imshow(dat);
%% 剪裁出识别区域

dat = OriginalDat( 94:848 ,180:320, :);

%% 转成二值图像
% d = rgb2gray(dat) ;
d = im2bw(dat,0);

%% 行分割
rowIndex = RowDivision(d);


rowMidPos = transpose(35:41:18*41);
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

%% 收盘价数据矩阵初始化

closePrice = zeros(1,length(length(rowIndex)));

%% 列分割及识别
rowWidth = rowIndex (:, 2)-rowIndex (:, 1) + 1;
closePrice( rowWidth<3 ) = NaN;

for i = 1:length(rowIndex)
    if rowWidth(i)>5
        [d2, ColIndex] = ColDivision(d, rowIndex,i);
        [RecogRes, emin] = Recognization (d2, ColIndex,templet1) ;
        % plot (emin) ;
        RecogRes %#ok
        closePrice(i) = RecogRes;
    end
    
end

%% 画图
figure, subplot(121); imshow(dat);
subplot(122); imshow(d2);



    
    
    
    
    
    
    


































