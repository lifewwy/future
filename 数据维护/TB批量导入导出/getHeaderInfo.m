function headInfo = getHeaderInfo(offset,nbytes)

% offset = 1524;
% nbytes = 12;

filename =  'export.dat';

fid = fopen(filename, 'r');
fseek(fid,offset,'bof');

if offset>0
    fseek(fid,-4,'cof');
    % ��һ����Լ�����һ����¼�����һ����
    % ������֤
    v = fread(fid,1, 'int32' ) %#ok
end

headInfo = fread(fid,nbytes, 'uchar' );

% �ú�Լ�ļ�¼��
% ������֤
n = fread(fid,1,'int32' ) %#ok

    
end


