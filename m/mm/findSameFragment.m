function [ startPoint1, startPoint2, FragmentLength ] = findSameFragment( x1,x2 )
% 寻找两个序列中相同的一小段
% x1 = rand(1e3,1);
% x2 = rand(2e3,1);

% x1(401:508) = x2(601:708);

startPoint1 = -1; startPoint2 = -1; FragmentLength = -1;


WinLen = 5;
Winx1 = buffer(x1,WinLen,WinLen-1,'nodelay');
Winx2 = buffer(x2,WinLen,WinLen-1,'nodelay');

N1 = length(Winx1);
N2 = length(Winx2);

r = ones(N1,N2)*500;

for i = 1:N1
    for j = 1:N2
        r(i,j) = sum(abs(Winx1(:,i)-Winx2(:,j)));
    end
end

pos = find(r==0);
[sub1,sub2] = ind2sub([N1,N2],pos);

if (sum(diff(sub1)==1)==length(sub1)-1) ...
        && (sum(diff(sub2)==1)==length(sub2)-1)
    
    startPoint1 = sub1(1);
    startPoint2 = sub2(1);
    FragmentLength = sub1(end)-sub1(1)+WinLen;
    %     x1( sub1(1):sub1(end)+WinLen-1 ) -...
    %         x2( sub2(1):sub2(end)+WinLen-1 )
end

end
























