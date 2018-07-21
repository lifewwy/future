function pos = EntryRule4(c,nWindowSize,nstd,flgCrossOverOrUnder)
% bollinger


% clear all; clc; close all;

%% 导入数据
% dstruct = importdata('au888.csv');   % 黄金
% dstruct = importdata('zn888.csv'); % 锌
% dstruct = importdata('er888.csv'); % 稻 
% dstruct = importdata('cu888.csv'); % 铜
% dstruct = importdata('pb888.csv'); % 铅
% dstruct = importdata('cf888.csv'); % 棉花
% dstruct = importdata('c9888.csv'); % 玉米
% dstruct = importdata('ru888.csv');   % 橡胶
% dstruct = importdata('a9888.csv');
% dstruct = importdata('ta888.csv');
 
% display(dstruct.textdata(1,1))
% data = dstruct.data;
% o = data(:,1); h = data(:,2); l = data(:,3);
% c = data(:,4); v = data(:,5); atr = data(:,7);
%%
% nWindowSize = 50; 
% nstd = 2; % Number of standard deviations for upper and lower bands. Default = 2.
[mid, uppr, lowr] = bollinger(c, nWindowSize, 0, nstd);

if strcmp(flgCrossOverOrUnder , 'crossOver')
    pos = CrossOver(c,uppr);
else
    pos = CrossUnder(c,lowr);
end

%%
% figure; plot(c); hold on ; plot(uppr,'r'); plot(lowr,'k'); grid;
% plot(pos1,c(pos1),'r.'); plot(pos2,c(pos2),'g.');








