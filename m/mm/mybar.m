function mybar(x)

% clear all; close all; clc;
% n = 100; x = randn(n,1);

sizex = size(x);
if sizex(1)==1
    x = x.';
end

h = bar(x); colormap(jet(13));

ch = get(h,'Children');

t = x;  t(t>=0) = 2; t(t<0) = 1;

set(ch,'FaceVertexCData',t)

axis tight;