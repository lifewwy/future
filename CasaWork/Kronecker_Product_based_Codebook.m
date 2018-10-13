clc; clear; % close all; 

% uniform rectangular arrays (URA)

Nvtx = 8; 
Nhtx = 8;

Nh = 32; % number of beam in horizontal direction
Nv = 16; % % number of beam in vertical direction

array = phased.URA('Size',[Nhtx Nhtx],'ElementSpacing',[1,1]*5);
% 'ElementSpacing'  [SpacingBetweenRows,SpacingBetweenColumns]
hsv = phased.SteeringVector('SensorArray',array);
fc = 3e8;  % lambda = 1
ang = [30;40];
a = step(hsv,fc,ang);

% w = a;

m = 9; % mth vertical codevecotr
belta = 4;
n = 32; % nth horizontal codevecotr
cvm = Nvtx^0.5*exp(1i*2*pi*m*(0:Nvtx-1)'/belta/Nv);
chn = Nhtx^0.5*exp(1i*2*pi*n*(0:Nhtx-1)'/Nh);

codevector = kron(cvm,chn);
w = codevector;

figure;
pattern(array,fc,0:0.1:180,-45:0.1:45,...
    'CoordinateSystem','rectangular',...
    'Type','power','PropagationSpeed',3e8,'Weight',w);

% pattern(array,fc,-180:180,-90:90,...
%     'CoordinateSystem','polar',...
%     'Type','directivity','PropagationSpeed',3e8,'Weight',w);

% plotResponse(array,fc,3e8,'Format','Line','Weight',w);




