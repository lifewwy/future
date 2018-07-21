function writeToHoldFile(results)

pos = strfind(results ,'持仓合约');
nn = length(pos);

% filename
% 20180214
curdir = mfilename('fullpath');
pp = strfind(curdir,'\');
filename = [curdir(1:pp(end)),'持仓.csv'];
fid = fopen(filename, 'wt');

% fid = fopen(['C:\D\future\m\跟踪开仓-记录资金-图像识别-4\记录资金\持仓', '.csv'], 'wt');

for k = 1:nn+1
    if k == 1
        fprintf(fid, '%s,', '');
        fprintf(fid, '%s,', '合约号');
        fprintf(fid, '%s,', '多/空');
        fprintf(fid, '%s\n', '总仓');
    else
        vv = results(pos(k-1):pos(k-1)+40);
        pos1 = find(vv==':');
        pos2 = find(vv==';');
        contract = vv(pos1(1)+1:pos2(1)-1);
        hands = vv(pos1(2)+1:pos2(2)-1);
        direction = vv(pos1(3)+1:pos2(3)-1);
        fprintf(fid, '%s,', '');
        fprintf(fid, '%s,', contract);
        if str2double(direction)==2
            fprintf(fid, '%s,', '多');% 2多头，3空头
        end
        if str2double(direction)==3
            fprintf(fid, '%s,', '空');% 2多头，3空头
        end
        fprintf(fid, '%s\n', hands);
    end
end
fclose(fid);
% disp('---------------> 持仓文件更新成功！------------->')
disp('持仓文件更新成功！')





