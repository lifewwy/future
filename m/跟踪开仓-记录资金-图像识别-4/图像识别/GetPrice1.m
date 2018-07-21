% clear all;  clc;  close all; 

clearvars -except closePrice RecordTimes ...
    templet1 t1 t2 t3 t4;

%% �Զ��������ڳ���ʱ�Ĵ���
% if findWindows('�Զ�����')
%     % return;
%     ReconnectionNum = ReconnectionNum+1;
% end

%% �ر��ڵ����ڣ����ܻ��谭����� SwitchToThisWindow ��
hwin = findWindows('��֤��������');
if hwin
    CloseWindow(hwin)
end

hwin = findWindows('��Ϣ');
if hwin
    CloseWindow(hwin)
end

hwin = findWindows('��ʷ�˵�');
if hwin
    CloseWindow(hwin)
end

%% ȡϵͳʱ��
time = clock;  
year = time(1); month = time(2);  
day =  time(3); hour = time(4);
minute = time(5); second = time(6);

if ( hour == 2 ) && ( minute == 30 )
    
    stop(t1);
    
    closePrice = closePrice(1:RecordTimes, :);
    myDateStr = datestr(datenum(date),'yyyy/mm/dd');
    myDateStr(myDateStr == '/') = [];
    fileName = ['closePrice', myDateStr, '_1'];
    eval([fileName,' = closePrice;']);
    tt = ['save ',  fileName, ' ', fileName];
    eval(tt);
    
end

if ( hour == 15 ) && ( minute == 15 )
    
    stop(t2);
    
    closePrice = closePrice(1:RecordTimes, :);
    myDateStr = datestr(datenum(date),'yyyy/mm/dd');
    myDateStr(myDateStr == '/') = [];
    fileName = ['closePrice', myDateStr, '_2'];
    eval([fileName,' = closePrice;']);
    tt = ['save ',  fileName, ' ', fileName];
    eval(tt);
    
end
    

%% ����ˢ��
hwin = findWindows('��ó�ڻ�');

% hwin = [592106 , 67312]; % ���ھ��
% rect =  GetWindowPosition(hwin);

SwitchToThisWindow(hwin);
F11;

pause(0.2);
%% ����
% OriginalDat = PrtScrn(1); 

OriginalDat = PrtWin1(hwin);
OriginalDat(:,:,1) = flipud(OriginalDat(:,:,1));
OriginalDat(:,:,2) = flipud(OriginalDat(:,:,2));
OriginalDat(:,:,3) = flipud(OriginalDat(:,:,3));

% imshow(dat);
%% ���ó�ʶ������

RowRange = 94:858 ;
ColRange = 180:315;

dat = OriginalDat( RowRange , ColRange, :);

%% ת�ɶ�ֵͼ��
% d = rgb2gray(dat) ;
d = im2bw(dat,0);

imshow(d);

%% �зָ�
rowIndex = RowDivision(d);

%% ɾ����Ч��
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

%% �зָʶ��
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

RecordTimes = RecordTimes+1 %#ok

dt= str2double( [ num2str(year, '%04.0f') ...
    num2str(month, '%02.0f') ...
    num2str(day, '%02.0f') ...
    num2str(hour, '%02.0f') ...
    num2str(minute, '%02.0f') ...
    num2str(second, '%04.1f') ] );

closePrice(RecordTimes,1) = dt;
closePrice(RecordTimes,2:end) = closePriceTmp;

%% ��ͼ
% figure, subplot(121); imshow(dat);
% subplot(122); imshow(d2);



    
    
    
    
    
    
    


































