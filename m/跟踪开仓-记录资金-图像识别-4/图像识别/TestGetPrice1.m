clear all;  clc;  close all; 
% close all;

%% ����ģ��
load templet1

%% ȡ�ô���λ��
title = '��ó�ڻ�';
hwin = findWindows(title);

% hwin = [592106 , 67312]; % ���ھ��
% rect =  GetWindowPosition(hwin) %#ok

%% ����
% OriginalDat = PrtScrn(0); 

OriginalDat = PrtWin(hwin);
OriginalDat(:,:,1) = flipud(OriginalDat(:,:,1));
OriginalDat(:,:,2) = flipud(OriginalDat(:,:,2));
OriginalDat(:,:,3) = flipud(OriginalDat(:,:,3));

% imshow(dat);
%% ���ó�ʶ������

dat = OriginalDat( 94:848 ,180:320, :);

%% ת�ɶ�ֵͼ��
% d = rgb2gray(dat) ;
d = im2bw(dat,0);

%% �зָ�
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

%% ���̼����ݾ����ʼ��

closePrice = zeros(1,length(length(rowIndex)));

%% �зָʶ��
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

%% ��ͼ
figure, subplot(121); imshow(dat);
subplot(122); imshow(d2);



    
    
    
    
    
    
    


































