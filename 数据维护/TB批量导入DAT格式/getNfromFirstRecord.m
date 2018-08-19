function N = getNfromFirstRecord(filename,pos)

fid = fopen(filename, 'r');
fseek(fid,pos,'bof');
N = fread(fid,1,'int32' );
fclose(fid);

