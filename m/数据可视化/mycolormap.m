function map = mycolormap(x)

% x = peaks(20)-6;
x1 = unique(x(:));
l1 = length(find(x1<0));
l2 = numel(x1)-l1;
map = jet(max([l1,l2])*2);
m = round(length(map)/2);
map = [map(m-l1+1:m,:); map(m+1:m+l2,:)];
% surf(x); colormap(map); colorbar;