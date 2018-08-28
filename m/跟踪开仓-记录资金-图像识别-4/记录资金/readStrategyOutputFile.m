function [contract,action,risk] = readStrategyOutputFile()
% clear; 
clc;

contract = [];
action = [];
risk = [];
%% 设置文件夹
% directory = 'C:\D\future\m\跟踪开仓-记录资金-图像识别-2\记录资金\';
% directory1 = 'D:\wangwy\m\记录资金\';
pp  = mfilename('fullpath');
i = strfind(pp,'\');

% folder1 = pp(1:i(end));
% folder2 = 'C:\D\future\';
% 20180214
folder2 = pp(1:i(end-3));
%% 读MATLAB策略输出文件
fprintf('读MATLAB策略输出文件...\n');

yyyymmdd = datestr(now,'yyyymmdd');
% filename = [directory2,'交易','20161212','.txt'];
filename = [folder2,'交易',yyyymmdd,'.txt'];
if exist(filename,'file') == 2
    d1 = importdata(filename);
else
    fprintf(2,'------------ 无交易！------------\n');
    return;
end

cy = {'豆一','A'; '沪铝','AL'; '黄金','AU'; '玉米','C'; '棉花','CF'; '沪铜','CU'; 
    '玻璃', 'FG';'股指','IF'; '焦炭','J'; '塑料','L'; '豆粕','M'; '甲醇','MA';
    '菜籽油' ,'OI';'棕榈油','P'; '螺纹钢','RB'; '橡胶', 'RU';'白糖','SR'; 
    'PTA','TA'; 'PVC','V'; '豆油','Y'; '沪锌','ZN'};

% 去除空行
d1( strcmp(d1,'') == 1 ) = [];

% 合并相同的行
warning('off'); %#ok
d1 = unique(d1,'rows');

nOrders = length(d1);
contract = cell(nOrders,1);
risk = zeros(nOrders,1); 
action = cell(nOrders,1); 
for n = 1:nOrders
    pos1 = strfind( d1{n}, ' ');
    
    contract(n) = {d1{n}(pos1(2)+1:pos1(3)-1)};
    [p1,~] = find(strcmp(contract{n}(1:end-4),cy) == 1);
    contract(n) = {[cy{p1,2},contract{n}(end-3:end)]};
    
    pos2 = strfind( d1{n}, '每手风险：');
    risk(n) = str2double(d1{n}(pos2+5:end));
    if strcmp( contract{n}(1:end-4) , 'IF')
        risk(n) = risk(n)*300;
    end
    
    if isempty(pos2)
        pos2 = pos1(3)+2+2;
    end;
    action(n) = {d1{n}(pos1(3)+2:pos2-1)};
    action{n}(action{n} == ' ') = [];
    action{n}(action{n} == '；') = [];
end

% contract
% risk
% action



end











