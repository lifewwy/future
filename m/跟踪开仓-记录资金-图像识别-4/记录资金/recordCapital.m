clear; clc; close all force;

time = clock;
time = str2double([num2str(time(4),'%02.0f'), num2str(time(5),'%02.0f')]);

if ~((time>1530)&&(time<2056))
    return;
end

title = '国内期货';

winTitle = WindowTitle(title) %#ok
pos1 = strfind(winTitle , '权益');
pos2 = strfind(winTitle , '可用资金');
capital = winTitle(pos1+3:pos2-2);
capital(capital == ',') = [];
capital = str2double(capital) %#ok
if isnan(capital)
    fprintf(2, '获取资金错误！\n');
    return;
end

% datestr(now,'yyyy/mm/dd')

%% 写 csv 文件
time = clock;
time = str2double([num2str(time(4),'%02.0f'), num2str(time(5),'%02.0f')]);

if (time>1530)&&(time<2056)
    fid = fopen(['资金', '.csv'], 'a+');
    
    fprintf(fid, '%s,', datestr(now,'yyyy/mm/dd'));
    fprintf(fid, '%f\n', capital);
    
    fclose(fid);
    disp(' 更新成功！');
end




