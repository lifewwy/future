clear all; close all; clc;

x = rand(20,50,30,40);

nn = ndims(x); sizex = size(x);

a = 5; b = 7; c = 8; d = 2; threshold = 20;

flag = ones(sizex);
flag(1:a,:,:,:) = 0; flag(sizex(1)-a+1:sizex(1),:,:,:) = 0;
flag(:,1:b,:,:) = 0; flag(:,sizex(2)-b+1:sizex(2),:,:) = 0;
flag(:,:,1:c,:) = 0; flag(:,:,sizex(3)-c+1:sizex(3),:) = 0;
flag(:,:,:,1:d) = 0; flag(:,:,:,sizex(4)-d+1:sizex(4)) = 0;

for i = a+1:sizex(1)-a
    for j = b+1:sizex(2)-b
        for k = c+1:sizex(3)-c
            for l = d+1:sizex(4)-d
                for i1 = i-a:i+a
                    for j1 = j-b:j+b
                        for k1 = k-c:k+c
                            for l1 = l-d:l+d
                                if x(i1,j1,k1,l1)<threshold
                                    flag(i,j,k,l) = 0;
                                    break;
                                end
                            end
                            if flag(i,j,k,l)==0
                                break;
                            end
                        end
                        if flag(i,j,k,l)==0
                            break;
                        end
                    end
                    if flag(i,j,k,l)==0
                        break;
                    end
                end
            end
        end
    end
end

    
    






















    