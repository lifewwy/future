function [status,result] = getJoinQuantData(N)
% clc; clear; close all; 

if nargin == 0
    N = 3;% 参数: 读取 N 个交易日的数据
end

fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end-2));

pythonEXE = [directory,'Py\JionQuant\venv\Scripts\python '];
pyFile = [directory,'Py\JoinQuant1\JQData.py '];

cmdString =  [pythonEXE,pyFile,num2str(N)];
[status,result] = system(cmdString);

% status %#ok 0:success ，即py文件运行没有出现错误。
% result %#ok py文件中print的内容，以及程序出错信息。
fprintf(['status: ', num2str(status),'\n']);
fprintf(['result: ', result,'\n']);





































