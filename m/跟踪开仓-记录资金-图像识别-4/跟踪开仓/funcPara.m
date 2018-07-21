clear; clc; close all force;

% cnn.layers = {
%     struct('type', 'i') %input layer
%     struct('type', 'c', 'outputmaps', 6, 'kernelsize', 5) %convolution layer
%     struct('type', 's', 'scale', 2) %sub sampling layer
%     struct('type', 'c', 'outputmaps', 12, 'kernelsize', 5) %convolution layer
%     struct('type', 's', 'scale', 2) %subsampling layer
%     };

% order.details = {
%     struct('contract', 'cu1702', 'action', 'Buy Open', 'hands', 5, 'price', 2035)
%     struct('contract', 'sr1705', 'action', 'Sell Open', 'hands', 10, 'price', 123)
%     struct('contract', 'y1705', 'action', 'Buy EvenUp', 'hands', 17, 'price', 458)
%     struct('contract', 'ru1705', 'action', 'Sell EvenUp', 'hands', 62, 'price', 1023)
%     };
% 
% contract = order.details{1}.contract %#ok
% action = order.details{2}.action %#ok
% hands = order.details{3}.hands %#ok
% price = order.details{4}.price %#ok

order = {
    struct('contract', 'cu1702', 'action', 'Buy Open', 'hands', 5, 'price', 2035)
    struct('contract', 'sr1705', 'action', 'Sell Open', 'hands', 10, 'price', 123)
    struct('contract', 'y1705', 'action', 'Buy EvenUp', 'hands', 17, 'price', 458)
    struct('contract', 'ru1705', 'action', 'Sell EvenUp', 'hands', 62, 'price', 1023)
    };

contract = order{1}.contract %#ok
action = order{2}.action %#ok
hands = order{3}.hands %#ok
price = order{4}.price %#ok











