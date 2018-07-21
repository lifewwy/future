function u = ContractUnit02(contractName)

% clear all; close all; clc;
% contractName = 'if888';

% directory = 'C:\D\future\交易位置\';
% 20180214
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end-3));
directory = [directory,'交易位置\'];

d = importdata([directory,'合约信息.txt']);
cy = {'豆一','A'; '沪铝','AL'; '黄金','AU'; '玉米','C'; '棉花','CF'; '沪铜','CU'; 
    '玻璃', 'FG';'股指','IF'; '焦炭','J'; '塑料','L'; '豆粕','M'; '甲醇','MA';
    '菜籽油' ,'OI';'棕榈油','P'; '螺纹钢','RB'; '橡胶', 'RU';'白糖','SR'; 
    'PTA','TA'; 'PVC','V'; '豆油','Y'; '沪锌','ZN'};

contractName = contractName(1:end-3);
categoryName = cy{strcmpi(cy(:,2),contractName),1};

if strcmpi(contractName,'if')
    u = 300;
    return;
end

sized = size(d.textdata);
for i = 1:sized(1)
    if strcmp(d.textdata{i,2}(1:end-4),categoryName)
        u = d.data(i);
        return;
    end
end


u = nan; 
disp('合约代码错误！');


% switch contractName
%     case 'a888'
%         u = 10;
%         return;
%     case 'c888'
%         u = 10;
%         return;
%     case 'rb888'
%         u = 10;
%         return;
%     case 'm888'
%         u = 10;
%         return;
%     case 'p888'
%         u = 10;
%         return;
%     case 'j888'
%         u = 100;
%         return;
%     case 'zn888'
%         u = 5;
%         return;
%     case 'y888'
%         u = 10;
%         return;
%     case 'l888'
%         u = 5;
%         return;
%     case 'ag888'
%         u = 15;
%         return;
%     case 'ta888'
%         u = 5;
%         return;
%     case 'sr888'
%         u = 10;
%         return;
%     case 'au888'
%         u = 1000;
%         return;
%     case 'fg888'
%         u = 20;
%         return;
%     case 'ma888'
%         u = 10;
%         return;
%     case 'ru888'
%         u = 10;
%         return;
%     case 'al888'
%         u = 5;
%         return;
%     case 'oi888'
%         u = 10;
%         return;
%     case 'rm888'
%         u = 10;
%         return;
%     case 'cf888'
%         u = 5;
%         return;
%     case 'i888'
%         u = 100;
%         return;
%     case 'jm888'
%         u = 60;
%         return;
%     case 'cu888'
%         u = 5;
%         return;
%     case 'ri888'
%         u = 20;
%         return;
%     case 'v888'
%         u = 5;
%         return;
%     case 'if888'
%         u = 300;
%         return;
%     otherwise
%         u = nan;
%         disp('合约代码错误！')
% end

end


































