function [lsFlg1, avgLine1] = LsFlgOfSingleMA( c, L ,threshold)

% c��c ����������ɵľ���ÿ����һ��Ʒ�ֵ����ݡ�
% L�������˲����ȡ�

sizec = size(c);
N = sizec(2);

%% 1���� 2 ��Ч
% lsFlg = zeros(sizec);
% avgLine = zeros(sizec);
% for k = 1:N
%     
%     % [avgLine(:,k),~] = movavg(c(:,k),L,L,0);
%     avgLine(:,k) = filter( ones(1,L), 1 , c(:,k))/L;
%     
%     avgLine(1:L,k) = avgLine(1:L,k)*L./(1:L)';
% 
%     lsFlg((c(:,k)>=avgLine(:,k)),k) = 1;
%     lsFlg((c(:,k)<avgLine(:,k)),k) = -1;
%     
% end
%% 2
lsFlg1 = zeros(sizec);

avgLine1 = filter( ones(1,L), 1 , c)/L;
avgLine1(1:L,:) = avgLine1(1:L,:)*L./repmat((1:L)',1,N);

% threshold = 0.3;

lsFlg1(c-avgLine1>threshold) = 1;
lsFlg1(avgLine1-c>threshold) = -1;

lsFlg1 = reshape(lsFlg1,sizec);



end

