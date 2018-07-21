clear all; close all; clc;

%% 数据
dstruct = importdata('al888(日线).csv');
% dstruct = importdata('白糖.csv');
% display(dstruct.textdata(1,1));
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
cc = data(:,4); v = data(:,5);  atr = atrfunc(h,l,cc,35);

%% 优化
% load mristack; x = mristack;
% sizex = size(x);

simRange1 = 10:20; simRange2 = 1:.2:5; simRange3 = 1:.2:5;
sizex = [length(simRange1), length(simRange2), length(simRange3)];

rrr = zeros(sizex); nCount1 = 0; 
for i = simRange1
    nCount1 = nCount1+1; nCount2 = 0; nCount3 = 0;
    for j = simRange2
        nCount2 = nCount2+1; nCount3 = 0;
        for k = simRange3
            nCount3 = nCount3+1;
            [tp,rrr(nCount1,nCount2,nCount3)] = Entry_PriceBreak_func(o,cc,atr,i,j,k);
        end
    end
end

a = 3; b = 2; c = 3; threshold = 0.5;

flag = ones(sizex);
flag(1:a,:,:) = 0; flag(sizex(1)-a+1:sizex(1),:,:) = 0;
flag(:,1:b,:) = 0; flag(:,sizex(2)-b+1:sizex(2),:) = 0;
flag(:,:,1:c) = 0; flag(:,:,sizex(3)-c+1:sizex(3)) = 0;

for i = a+1:sizex(1)-a
    i %#ok
    for j = b+1:sizex(2)-b
        for k = c+1:sizex(3)-c
            for i1 = i-a:i+a
                for j1 = j-b:j+b
                    for k1 = k-c:k+c
                        if rrr(i1,j1,k1) < threshold  
                            flag(i,j,k) = 0;
                            break;
                        end
                    end
                    if flag(i,j,k)==0
                        break;
                    end
                end
                if flag(i,j,k)==0
                    break;
                end
            end
        end
    end
end

plot(flag(:))



















