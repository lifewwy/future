function re = readCSVGetFirstRecord(futureCode)

% futureCode = 'SR';

fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end-1));

filename = [directory,futureCode, '888.csv'];

if exist(filename,'file')
else
    return;
end

dstruct = importdata(filename);
% display(dstruct.textdata(1,:));
contractDate = datenum(dstruct.textdata);
csvData = dstruct.data;
csvData = [contractDate, csvData];

re = csvData(1,:);

end