function GetAccount(handles)
% clear; 
clc;

% 关闭除了主界面的其他图
% close(setdiff(findobj('menubar','figure','-or','menubar','none'),gcf));

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

% pp  = mfilename('fullpath');
% i = strfind(pp,'\');

% folder1 = pp(1:i(end));
% folder2 = 'C:\D\future\';
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

function [str]=num2bankScalar(num)
%      num=floor(num*100)/100;
     str = num2str(num);
%      k=find(str == '.', 1);
%      if(isempty(k))
%          str=[str,'.00'];
%      end
%      FIN = min(length(str),find(str == '.')-1);
%      for i = FIN-2:-3:2
     for i = length(str)-2:-3:2
         str(i+1:end+1) = str(i:end);
         str(i) = ',';
     end
end

function [str]=num2bank(num)
     str = arrayfun(@(x) num2bankScalar(x) , num, 'UniformOutput', false); 
end

strCapital = num2bank(capital);

set(handles.text13,'string',strCapital);
set(handles.text13,'Enable','on');

capital = capital+70e4;

end












