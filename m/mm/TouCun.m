clear all; clc; close all

vr = 0.2;
ep1 = -1.5;
ep2 = 10;

x = [-ones(1,21) , -5*ones(1,3) 10*ones(1,6)];
Nsim = 6e6;
result = zeros(1,Nsim);
for i = 1:Nsim
    a = x(randi(30,1));
    if a == -1
        result(i) = -1;
    elseif a == -5
        result(i) = -5;
    elseif a==10
        result(i) = 10;
    end
end



t = reshape(result,1000,[]);
tt = sum(t); min(tt)
max(tt)
hist(tt/1000,20)




















