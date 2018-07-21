function control = GetControlPos(filename)

% clear;  clc;  close all; 

%% 读 CSV 文件

% filename = '控件位置_ver6.7.529.csv';

if exist(filename,'file')
else
    return;
end

dstruct = importdata(filename);
% display(dstruct.textdata(1,:));
% textdata = dstruct.textdata;
data = dstruct.data;


control.ContractEdit = data(1,:);
control.buyButton = data(2,:);
control.sellButton = data(3,:);
control.openButton = data(4,:);
control.evenUpButton = data(5,:);
control.handsEdit = data(6,:);
control.PriceEdit = data(7,:);
control.FollowPriceButton = data(8,:);
control.AddPriceButton = data(9,:);
control.SubtractPriceButton = data(10,:);
control.OrderButton = data(11,:);
control.OkButton = data(12,:);
control.CancelButton = data(13,:);
control.ChiCangLabel = data(14,:);
control.ChiCang = data(15,:);
control.save = data(16,:);
control.fileName = data(17,:);
control.saveType = data(18,:);









