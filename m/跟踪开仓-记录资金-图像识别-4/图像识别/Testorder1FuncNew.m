function Doneflg = Testorder1FuncNew(orderParameters)

handles = evalin('base','handles');  
TradableContract = evalin('base','TradableContract');  
%% 登录参数
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
%% 下单
Contract = orderParameters{1};
if ~isempty( intersect({orderParameters{1}(1:2)}, ...
        {'CF','FG','MA','OI','SR','TA','cf','fg','ma','oi','sr','ta'}) )
    Contract(3) = [];
end

Contract = TradableContract{strcmpi(TradableContract,Contract)};

% Contract = 'a1801';

% Sell_Buy = '0'; % 买
% Sell_Buy = '1'; % 卖
% Open_Close = '0'; % 开仓
% Open_Close = '1'; % 平仓
% Volume = '1';

Volume = orderParameters{3};

sb = orderParameters{2};
pos = find(sb==' ');
aa = sb(1:pos-1);
bb = sb(pos+1:end);
if strcmp(aa,'Buy')
    Sell_Buy = '0';
else
    Sell_Buy = '1';
end

if strcmp(bb,'Open')
    Open_Close = '0';
else
    Open_Close = '1';
end

[Doneflg,results] = PlanceOrder1(Contract,Sell_Buy,Open_Close,...
    Volume,FRONT_ADDR_TD,FRONT_ADDR_MD,...
    BROKER_ID, INVESTOR_ID,PASSWORD); 

pos1 = strfind(results,'[ErrorMsg]');
if ~isempty(pos1)
    vv = results(pos1(end):pos1(end)+60);
    pos2 = find(vv==']');
    ErrorMsg = vv(1:pos2(3));
    
    if Doneflg~=1
        fprintf(2,ErrorMsg);
    end
else
    fprintf(2,'未找到关键字 [ErrorMsg] !\n');
end

end




































































