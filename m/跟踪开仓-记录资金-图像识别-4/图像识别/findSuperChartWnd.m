function  findSuperChartWnd()
ContractName = {'大豆','A'; '铝','AL'; '黄金','AU'; '玉米','C'; '棉花','CF'; '铜','CU'; 
    '玻璃', 'FG';'股指','IF'; '焦炭','J'; '塑料','L'; '豆粕','M'; '甲醇','MA';
    '菜油' ,'OI';'棕榈油','P'; '螺纹','RB'; '橡胶', 'RU';'白糖','SR'; 
    'PTA','TA'; 'PVC','V'; '豆油','Y'; '锌','ZN'};
sizeCN = size(ContractName);
status = zeros(1,sizeCN(1));
for i = 1:sizeCN(1)
    status(i) = subfunc(ContractName(i,:));
end

if sum(status) == sizeCN(1)
    fprintf('超级图表全部打开成功！\n');
end

function status = subfunc(cn)
% clc; clear; close all;
status = 0;

if nargin==0
    name1 = 'TA PTA-TA 1日线';
    name2 = 'TA 1日线';
    name = 'PTA';
else
    name1 = [cn{:,2}, ' ', cn{:,1}, '-', cn{:,2},' 1日线'];
    name2 = [cn{:,2}, ' 1日线'];
    name = cn{:,1};
end


%% 逐层找到超级图表窗口
MainWinTitle1 = '交易开拓者平台(旗舰版) 64位';
hMainWin1 = findWindows(MainWinTitle1);
if hMainWin1 == 0
    fprintf(2,[name,' 没有找到主窗口！\n']);
    return;
end
H1 = findChildWinByClassName(hMainWin1,'MDIClient','');
if H1 == 0
    fprintf(2,[name,' 没有找到窗口H1！\n']);
    return;
end
H2 = findChildWinByClassName(H1,'',name1);
if H2 == 0
    fprintf(2,[name,' 没有找到窗口H2！\n']);
    return;
end
H3 = findChildWinByClassName(H2,'AfxFrameOrView110','');
if H3 == 0
    fprintf(2,[name,' 没有找到窗口H3！\n']);
    return;
end
H4 = findChildWinByClassName(H3,'',name2);% %#ok
if H4 == 0
    fprintf(2,[name,' 没有找到窗口H4！\n']);
    return;
else
    % fprintf('OK！\n');
    status = 1;
end

end

end



