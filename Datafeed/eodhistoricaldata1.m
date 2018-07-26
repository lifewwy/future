% https://eodhistoricaldata.com/

% 具体见如下网页
% https://eodhistoricaldata.com/knowledgebase/api-for-historical-data-and-volumes/

url = 'https://eodhistoricaldata.com/api/eod/AAPL.US?api_token=OeAFFmMliFG5orCUuwAKQ8l4WWFQ67YX&period=d';
outfilename = websave('AAPL.US.csv',url); %#ok

% 5b58b853733183.22292691 该 token 一天能用 5 次
% 注册了用户 lifewwy
url = 'https://eodhistoricaldata.com/api/eod/MSFT.US?api_token=5b58b853733183.22292691&period=d';
outfilename = websave('MSFT.US.csv',url); %#ok

d = importdata('MSFT.US.csv');
d = d.data;
c = d(:,5); % Adjusted_close
plot(c);

url = 'https://eodhistoricaldata.com/api/eod/PEP.US?api_token=5b58b853733183.22292691&period=d';
outfilename = websave('PEP.US.csv',url);




