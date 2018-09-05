function [status,result] = getJoinQuantData(N)
% clc; clear; close all; 

if nargin == 0
    N = 3;% ����: ��ȡ N �������յ�����
end

fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end-2));

pythonEXE = [directory,'Py\JionQuant\venv\Scripts\python '];
pyFile = [directory,'Py\JoinQuant1\JQData.py '];

cmdString =  [pythonEXE,pyFile,num2str(N)];
[status,result] = system(cmdString);

% status %#ok 0:success ����py�ļ�����û�г��ִ���
% result %#ok py�ļ���print�����ݣ��Լ����������Ϣ��
fprintf(['status: ', num2str(status),'\n']);
fprintf(['result: ', result,'\n']);





































