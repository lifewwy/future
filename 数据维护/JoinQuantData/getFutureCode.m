function [C,cn] = getFutureCode(contracts) 

% clc; clear; close all; 

% load contracts;

s = length(contracts);
% contracts = contracts(randperm(s))

code = cell(1,s);
for i = 1:s
    c = contracts{i};
    c = c(1:find(c=='.')-1);
    code(i) = {c(isstrprop(c,'alpha'))};
end

% [C,IA,IC] = unique(A,'stable') returns the values of C in the same order
% that they appear in A
[C,~,IC] = unique(code,'stable'); 

cn = zeros(1,length(C));
for i = 1:length(C)
    cn(i) = length(find(IC==i));
end











