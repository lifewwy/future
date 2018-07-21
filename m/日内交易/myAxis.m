clear; close all force; clc;

%% ÀýÒ»
x=-10:0.1:10;

y1=2*x+1; 
y2=x.*x; 
y3=-x.*x+20;
plot(x,y1,x,y2,x,y3);
axis off;
hold on;

xlim=max(abs(x));
ylim=max(abs([y1,y2]));

axis(gca,[-xlim xlim -ylim ylim]);
xx = get(gca,'xtick');

yy=get(gca,'ytick');
dx=mean(diff(yy))/5;
dy=mean(diff(xx))/5;

axis(gca,[-xlim xlim -ylim ylim]);
set(gca,'units','normalized');
pos1=get(gca,'position');

s1=[pos1(1) pos1(2)+pos1(4)/2];
s2 = [pos1(1)+pos1(3) pos1(2)+pos1(4)/2];
s3 = [pos1(1)+pos1(3)/2 pos1(2)];

s4 = [pos1(1)+pos1(3)/2 pos1(2)+pos1(4)];
annotation('arrow',[s1(1) s2(1)],[s1(2) s2(2)])
annotation('arrow',[s3(1) s4(1)],[s3(2) s4(2)])
for i=1:length(xx)-1
    if xx(i)~=0
        plot([xx(i),xx(i)],[0,dx],'k');
        text(xx(i),-dx/5,num2str(xx(i)),'HorizontalAlignment','center','VerticalAlignment','top');
    end
end
for i = 1:length(yy)-1
    if ~eq(yy(i),0);
        plot([0,dy],[yy(i),yy(i)],'k');
        hold on
        text(-dy/5,yy(i),num2str(yy(i)),'HorizontalAlignment','right');
    end
end
text(-dy/5,-dx/5,num2str(0),'HorizontalAlignment','right','VerticalAlignment','top');



%% Àý¶þ
clear; clc; % close all force; 

x=-5:10; y=-5:10; figure;
plot(x,y); axis off; hold on;

plot([0 0],[min(y) max(y)],'k',[min(x) max(x)],[0 0],'k');

ax=[max(x),max(x)-0.3,max(x)-0.3;0,0.2,-0.2];
fill(ax(1,:),ax(2,:),'k');

ay=[0,0.15,-0.15;max(y),max(y)-0.4,max(y)-0.4];
fill(ay(1,:),ay(2,:),'k'); hold on
for i=1:length(x)-1
    if x(i)~=0
        plot([x(i),x(i)],[0,0.1],'k'); hold on
        a=text(x(i),-0.4,num2str(x(i)));
        set(a,'HorizontalAlignment','center')
    end
    if y(i)~=0
        plot([0,0.1],[y(i),y(i)],'k'); hold on
        b=text(-0.4,y(i),num2str(y(i)));
        set(b,'HorizontalAlignment','center')
    end
end
c=text(-0.4,-0.4,num2str(0));
set(c,'HorizontalAlignment','center')





























