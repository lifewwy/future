function [ etp, c1,s1,s2 ] = ...
    ExitPosOfnATR( c, ep, nMultiplyATR )
% 返回 n 倍 ATR 跟踪止损的出场位置。

% ---------------  输入参数  ---------------------
% c：收盘价
% ep：第1列为入场位置；第2列是多空标志，
%     1 表示多头，-1 表示空头。
% nMultiplyATR：n*ATR

% ---------------  输出参数  ---------------------
% etp：列向量，出场位置。
% c1,s1,s2 可选输出参数

%%

if ~iscolumn(c)
    c = transpose( c );
end

cLen = length(c);
epLen = size(ep,1);

c1 = zeros(cLen,epLen);
s1 = zeros(cLen,epLen);

for i=1:epLen
    
    c1(1:cLen-ep(i,1)+1,i) = ep(i,2)*c(ep(i,1):end);
    
    s1(1:cLen-ep(i,1)+1,i) = ep(i,2)*c(ep(i,1):end) ...
        - nMultiplyATR(ep(i,1):end);
    
end

s2 = s1;
for i = 2:cLen
    s2(i,:) = max( [ s2(i-1,:); s2(i,:) ] );
end

dc1s2 = c1-s2;
etp = zeros(epLen,1);
for i = 1:epLen
    etpTmp = find( dc1s2(:,i)<0, 1 );
    if isempty( etpTmp )
        etp(i) = cLen;
    else
        etp(i) = etpTmp;
    end
end

%% 输出参数
etp = ep(:,1)+etp-1;
etp(etp>cLen) = cLen;

if nargout == 4
    flg = repmat(ep(:,2)', cLen, 1);
    c1 = c1.*flg;
    s1 = s1.*flg;
    s2 = s2.*flg;
    
    m = 1;
    figure; subplot(121);
    plot(s1(:,m)); hold on; plot(s2(:,m),'r');
    subplot(122);
    plot(c1(:,m)); hold on; plot(s2(:,m),'r');
end
    
end
    
    
    
    
    
    
    
    
    
    
    
    






















































