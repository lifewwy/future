clc; clear; close all; 

pythonEXE = 'C:\D\xyz\future\Py\JionQuant\venv\Scripts\python ';
pyFile = 'C:\D\xyz\future\Py\JoinQuant1\JQData.py ';
N = 3; % ����: ��ȡ N �������յ�����
cmdString =  [pythonEXE,pyFile,num2str(N)];
[status,result]=system(cmdString);

status %#ok 0:success





































