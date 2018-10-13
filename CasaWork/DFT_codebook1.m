clc; close all; clear;



%% steering vector
% hULA = phased.ULA('NumElements',8,'ElementSpacing',0.5);
% hsv = phased.SteeringVector('SensorArray',hULA);
% Fc = 3e8;
% ANG = [30; 20];
% a = step(hsv,Fc,ANG);
%% DFT codebook
M = 8; % number of elements
N = 16; % size of codebook

hULA = phased.ULA('NumElements',M,'ElementSpacing',0.5);
hsv = phased.SteeringVector('SensorArray',hULA);
Fc = 3e8;



for n = 1:N
    w = exp(1i*2*pi/N*n*(0:M-1)'); % nth DFT codevector
   
    ncount = 0;
    range = -90:90;
    res = zeros(1,length(range));
    for theta = range
        ncount = ncount+1;
        a = step(hsv,Fc,theta);
        res(ncount) = abs(w'*a);
    end
    
    plot(range,res); hold on;
end




