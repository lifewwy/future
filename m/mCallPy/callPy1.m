clc; clear; close all; 
clear import;

% pyversion('C:\ProgramData\Anaconda3\envs\py2\pythonw.exe')

% py.list([1, 2, 3, 4]);
%% 调用方法 1
% import py.testSum.*
% res1 = sum(5, 7) %#ok

%% 调用方法 2
res2 = py.testSum.sum(5, 7) %#ok
%% 调用模块中的函数
N = py.list({'Jones','Johnson','James'});
names = py.mymod.search(N) %#ok








































