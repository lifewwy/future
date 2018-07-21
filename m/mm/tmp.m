close all; clc; clear all;

%% 小波分析
% load c;
% 
% c1 = c(1:500);
% c2 = c(1:1000);
% c3 = c(1:2000);
% c4 = c(1:3000);
% 
% wavename = 'db4'; N = 4;
% [cc,ll] = wavedec(c1,N,wavename);
% a1 = wrcoef('a',cc,ll,wavename,N);
% 
% wavename = 'db4'; N = 4;
% [cc,ll] = wavedec(c2,N,wavename);
% a2 = wrcoef('a',cc,ll,wavename,N);
% 
% wavename = 'db4'; N = 4;
% [cc,ll] = wavedec(c3,N,wavename);
% a3 = wrcoef('a',cc,ll,wavename,N);
% 
% wavename = 'db4'; N = 4;
% [cc,ll] = wavedec(c4,N,wavename);
% a4 = wrcoef('a',cc,ll,wavename,N);
% 
% plot(a1); hold on; plot(a2,'k');plot(a3,'r');plot(a4,'g');

%% 小波分析

load c;
c = c(1:1e3);

wavename = 'db4'; N = 2;
M = 50;
a = zeros(length(c)-M,1);
for i = 1:length(c)
    c1 = c(1:i);
    [cc,ll] = wavedec(c1,N,wavename);
    a1 = wrcoef('a',cc,ll,wavename,N);
    
    if i>M
        a(i-M) = a1(end-M);
    end
    
end

[cc,ll] = wavedec(c,N,wavename);
a2 = wrcoef('a',cc,ll,wavename,N);

plot(a2,'r'); hold on; plot(a);

%% 读复权数据
clear all ; clc; close all;

dstruct = importdata('zn888(日线).csv');  
display(dstruct.textdata(1,1));
data = dstruct.data;

o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5); 
atr = atrfunc(h,l,c,12);


















