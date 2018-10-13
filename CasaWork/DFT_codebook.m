clc; close all; clear;


M = 8; % number of elements
N = 16; % size of codebook
% n = 10;


% k = 2*pi*d/lambda;
k = 2*pi*0.5;


for n = 1:N
    w = exp(1i*2*pi/N*n*(0:M-1)'); % nth DFT codevector
%     w = exp(-1i*(0:M-1)'*k*sin(deg2rad(0))); % beamforming vector
    
    ncount = 0;
    range = -90:90;
    res = zeros(1,length(range));
    for theta = range
        ncount = ncount+1;
        a = exp(-1i*(0:M-1)'*k*sin(deg2rad(theta)));
        res(ncount) = abs(w'*a);
    end
    
    plot(range,res); hold on;
end




