function writeToHoldFile(results)

pos = strfind(results ,'�ֲֺ�Լ');
nn = length(pos);

% filename
% 20180214
curdir = mfilename('fullpath');
pp = strfind(curdir,'\');
filename = [curdir(1:pp(end)),'�ֲ�.csv'];
fid = fopen(filename, 'wt');

% fid = fopen(['C:\D\future\m\���ٿ���-��¼�ʽ�-ͼ��ʶ��-4\��¼�ʽ�\�ֲ�', '.csv'], 'wt');

for k = 1:nn+1
    if k == 1
        fprintf(fid, '%s,', '');
        fprintf(fid, '%s,', '��Լ��');
        fprintf(fid, '%s,', '��/��');
        fprintf(fid, '%s\n', '�ܲ�');
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
            fprintf(fid, '%s,', '��');% 2��ͷ��3��ͷ
        end
        if str2double(direction)==3
            fprintf(fid, '%s,', '��');% 2��ͷ��3��ͷ
        end
        fprintf(fid, '%s\n', hands);
    end
end
fclose(fid);
% disp('---------------> �ֲ��ļ����³ɹ���------------->')
disp('�ֲ��ļ����³ɹ���')





