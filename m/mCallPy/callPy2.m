clc; clear; close all; 

% matlab调用Python的.py脚本文件
% https://blog.csdn.net/yanerhao/article/details/78669640
%% 1
str = python('matlab_readlines.py','test.txt'); 
eval(['c = ' str]) 
celldisp(c) 

%% 2 
cmdString = 'python C:\D\xyz\future\Py\JionQuant\Bokeh\candlestick.py';
[status,result]=system(cmdString);
status %#ok 0:success





































