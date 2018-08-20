function headInfo = getHeaderInfo(offset,nbytes)

% offset = 1524;
% nbytes = 12;

filename =  'export.dat';

fid = fopen(filename, 'r');
fseek(fid,offset,'bof');

if offset>0
    fseek(fid,-4,'cof');
    % 上一个合约的最后一条记录的最后一个数
    % 用作验证
    v = fread(fid,1, 'int32' ) %#ok
end

headInfo = fread(fid,nbytes, 'uchar' );

% 该合约的记录数
% 用作验证
n = fread(fid,1,'int32' ) %#ok

    
end


