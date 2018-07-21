clear all; close all; clc;

x = peaks(100); 
nn = ndims(x); sizex = size(x);

a = 3; b = 2; threshold = 6;

flag = ones(sizex);
flag(1:a,:) = 0; flag(sizex(1)-a+1:sizex(1),:) = 0; 
flag(:,1:b) = 0; flag(:,sizex(2)-b+1:sizex(2)) = 0; 


for i = a+1:sizex(1)-a
    for j = b+1:sizex(2)-b
        for m = i-a:i+a
            for n = j-b:j+b
                if x(m,n)<threshold
                    flag(i,j) = 0;
                    break;
                end
            end
            if flag(i,j)==0
                break;
            end
        end
    end
end

figure; mesh(flag);

if nn==2
    figure; pcolor(x); colormap(jet); colorbar;
end




















