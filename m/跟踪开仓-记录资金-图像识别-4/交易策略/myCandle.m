function myCandle(data1)

rise= data1(:,1)>data1(:,4);
data2=data1;
data2(rise,:)=0;
data3=data1;
down= data1(:,1)<data1(:,4);
data3(down,:)=0;
stay= data1(:,1)~=data1(:,4);
data4=data1;
data4(stay,:)=0;
candle(data2(:,2),data2(:,3),data2(:,4),data2(:,1),[1, 0.2941, 0.2941]);
hold on
candle(data3(:,2),data3(:,3),data3(:,4),data3(:,1),[0,1,1]);
hold on
candle(data4(:,2),data4(:,3),data4(:,4),data4(:,1),[1,1,1]);











