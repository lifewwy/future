function RelationFunc(R,titleAndLabel)

% R = [nATRExit,WinRate];

R = sortrows(R,1);
AE = unique(R(:,1));
nAE = length(AE);

% WinRate = zeros(round(length(nATRExit)/nAE),nAE);
% for i = 1:nAE
%     WinRate(:,i) = R(R(:,1)==AE(i),2);
% end

WinRate = reshape(R(:,2),[],nAE); % 每列对应一个止损宽度

figure('Name',titleAndLabel{1},'NumberTitle','off');
hold on;
plot(AE,mean(WinRate));
for i = 1:nAE
    stem(repmat(AE(i),78,1),WinRate(:,i),'.');
    stem(AE(i),mean(WinRate(:,i)),'filled');
end
title(titleAndLabel{1});
xlabel(titleAndLabel{2});
ylabel(titleAndLabel{3});
ylh = get(gca,'ylabel');                                                      % Object Information
ylp = get(ylh, 'Position');
set(ylh, 'Rotation',0, 'Position',ylp,...
    'VerticalAlignment','middle', 'HorizontalAlignment','right')
grid;





































