function [format,k,p1,c2] = findnum(num,filename)

format = [];
p1 = [];
c2 = [];

n = [8 8 8 16 32 64 8 16 32 64 32 32 64 64]/8;
x = {'uchar'
    'schar'  
 'int8'    
 'int16'
 'int32'  
 'int64'  
 'uint8'  
 'uint16' 
 'uint32' 
 'uint64' 
 'single' 
 'float32'
 'double'
 'float64' };

% 6023	6023	5985	5994	472688
% 6015	6046	5995	6032	482738
% 6035	6045	6006	6030	373086
% 6026	6074	6024	6043	481030
% 6020	6030	6000	6005	353372
% 6004	6040	5994	6012	368784
% 6017	6024	5951	5962	731968

flg = 0;
for k = 0:50
    k;
    if flg==1
        break;
    end
    for i=1:length(x)
        i;
        fid = fopen(filename, 'r');
        % STATUS = fseek(fid, 1, 'bof'); % position indicator to the byte
        STATUS = fseek(fid, k, 'bof') ;  % STATUS is 0 on success and -1 on failure.
        % POSITION = ftell(fid);
        c1 = fread(fid,x{i});
        fclose(fid);
        pos = find(c1 == num, 1);
        if ~isempty(pos)
           format = x{i};
           k;
           
           p1 = pos*(n(i))+k-n(i);
           fid = fopen(filename, 'r');
           % STATUS = fseek(fid, 1, 'bof'); % position indicator to the byte
           STATUS = fseek(fid, p1, 'bof') ;  % STATUS is 0 on success and -1 on failure.
           % POSITION = ftell(fid);
           c2 = fread(fid,1,x{i});
           fclose(fid);
           flg=1;
           break;
        end
    end
end

end





