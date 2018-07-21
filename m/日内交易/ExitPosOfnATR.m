function [ etp, c1,s1,s2 ] = ...
    ExitPosOfnATR( c, ep, nMultiplyATR )
% ���� n �� ATR ����ֹ��ĳ���λ�á�

% ---------------  �������  ---------------------
% c�����̼�
% ep����1��Ϊ�볡λ�ã���2���Ƕ�ձ�־��
%     1 ��ʾ��ͷ��-1 ��ʾ��ͷ��
% nMultiplyATR��n*ATR

% ---------------  �������  ---------------------
% etp��������������λ�á�
% c1,s1,s2 ��ѡ�������

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

%% �������
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
    
    
    
    
    
    
    
    
    
    
    
    






















































