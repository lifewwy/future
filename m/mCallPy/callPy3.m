clc; clear; close all; 

pythonEXE = 'C:\D\xyz\future\Py\JionQuant\venv\Scripts\python ';
pyFile = 'C:\D\xyz\future\Py\JoinQuant1\JQData.py ';
N = 3; % 参数: 读取 N 个交易日的数据
cmdString =  [pythonEXE,pyFile,num2str(N)];
[status,result]=system(cmdString);

status %#ok 0:success





































