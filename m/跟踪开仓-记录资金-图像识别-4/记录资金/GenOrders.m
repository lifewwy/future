function IsSuccessful = GenOrders(handles)
% clear; 
clc;

IsSuccessful = 0;

% 关闭除了主界面的其他图
close(setdiff(findobj('menubar','figure','-or','menubar','none'),gcf));

%% 程序运行时段限制
% TimeWinFlg = 1;
% 
% time = clock;
% time = str2double([num2str(time(4),'%02.0f'), num2str(time(5),'%02.0f')]);
% rightTime = (time>1530)&&(time<2056);
% if (~rightTime)&&(TimeWinFlg==1)
%     fprintf(2,'请在正确时间段运行该程序！\n');
%     return;
% end

%% 设置文件夹
% directory = 'C:\D\future\m\跟踪开仓-记录资金-图像识别-2\记录资金\';
% directory1 = 'D:\wangwy\m\记录资金\';
pp  = mfilename('fullpath');
i = strfind(pp,'\');

folder1 = pp(1:i(end));
% folder2 = 'C:\D\future\';
% 20180214
folder2 = pp(1:i(end-3));
%% 获得当前资金，写持仓文件
% title = '国内期货';

% winTitle = WindowTitle(title) %#ok
% pos1 = strfind(winTitle , '权益');
% pos2 = strfind(winTitle , '可用资金');
% capital = winTitle(pos1+3:pos2-2);
% capital(capital == ',') = [];
% capital = str2double(capital) + 1e6 %#ok
% if isnan(capital)
%     fprintf(2, '获取资金错误！\n');
%     return;
% end

% datestr(now,'yyyy/mm/dd')

AccountSelection = get(handles.TradeAccout,'value');

if AccountSelection == 3
    % SimNow 1   交易阶段(服务时间)：与实际生产环境保持一致
    FRONT_ADDR_MD = 'tcp://180.168.146.187:10010';
    FRONT_ADDR_TD = 'tcp://180.168.146.187:10000';
    BROKER_ID = '9999';
    INVESTOR_ID = '101042';
    PASSWORD = '518888';
end

if AccountSelection == 4
    % SimNow 2
    %  交易阶段(服务时间)：交易日，16：00～次日09：00；非交易日，16：00～次日15：00。
    % 账户、钱、仓跟第一套环境上一个交易日保持一致。
    FRONT_ADDR_MD = 'tcp://180.168.146.187:10031';
    FRONT_ADDR_TD = 'tcp://180.168.146.187:10030';
    BROKER_ID = '9999';
    INVESTOR_ID = '101042';
    PASSWORD = '518888';
end

if AccountSelection == 1
    % 快期-国贸期货
    FRONT_ADDR_TD = 'tcp://61.152.165.100:41201';
    FRONT_ADDR_MD = 'tcp://61.152.165.100:41211';
    BROKER_ID = '0187';
    INVESTOR_ID = '28006311';
    PASSWORD = 'wy518888';
end

if AccountSelection == 2
    % 快期-新湖期货
    FRONT_ADDR_TD = 'tcp://116.228.171.216:41205';
    FRONT_ADDR_MD = 'tcp://116.228.171.216:41213';
    BROKER_ID = '6090';
    INVESTOR_ID = '10501951';
    PASSWORD = 'wy518888';
end

capital = GetAccountInfo(FRONT_ADDR_TD,BROKER_ID,...
    INVESTOR_ID,PASSWORD);
if capital==0
    return;
end

capital = capital+70e4-12e4;

%% 读TB输出文件
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

%% 读风险配置文件
filename = [folder1,'风险配置表.csv'];
if exist(filename,'file') == 2
    d2 = importdata(filename);
end

riskPCT = zeros(nOrders,1);
for n = 1:nOrders
    riskPCT(n) = d2.data(strcmpi(d2.textdata,contract{n}(1:end-4)));
end
% riskPCT
%% 写 csv 文件
fid = fopen([folder1, '资金.csv'], 'a+');
fprintf(fid, '%s,', datestr(now,'yyyy/mm/dd HH:MM:SS'));
fprintf(fid, '%f\n', capital);
fclose(fid);
disp('资金文件更新成功！');

%% 输出订单文件
filename = [folder1,'订单.csv'];

% 2017.09.11 注释掉，换合约时可能写入订单。
% if exist(filename,'file') == 2
%     d3 = importdata(filename);
%     if datenum(d3.textdata{end,1},'yyyy/mm/dd') ...
%             == datenum(datestr(now,'yyyy/mm/dd'),'yyyy/mm/dd')
%         fprintf(2,'订单文件已经是最新！\n');
%         return;
%     end
% end

hands = capital*riskPCT*0.9./risk;
hands = floor(hands) + double((hands-floor(hands))>=0.7);

% fid = fopen(['orders', '.csv'],'wt');
% fid = fopen([directory, 'orders.csv'],'a+');
fid = fopen(filename,'a+');
fprintf(fid, '\n');
for n = 1:nOrders
    fprintf(fid, '%s,', datestr(now,'yyyy/mm/dd'));
    fprintf(fid, '%s,', contract{n});
    fprintf(fid, '%s,', action{n});
    fprintf(fid, '%d\n', hands(n));
end
fclose(fid);
disp('订单文件更新成功！');

IsSuccessful = 1;

end











