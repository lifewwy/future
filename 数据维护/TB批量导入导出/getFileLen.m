function fL = getFileLen(filename)
fid = fopen(filename); 
fseek(fid,0,'eof'); 
fL = ftell(fid); % �ֽ���
fclose(fid);