function p1 = ParaSegment(param1,N,alpha)

% 将每个参数分N段,每段交叠比例为 alpha
% N = 10; alpha = 0.2;
M = ceil(length(param1)/N/(1-alpha));
p = floor(M*alpha); % 每段的交叠长度
p1 = buffer(param1,M,p, 'nodelay');

sp1 = size(p1);
tt = abs(sp1(2) - N);
flg = 0;
if sp1(2) ~= N
    for M1 = max(1,M-3):M+3
        if flg==1
            break;
        end
        for pp = [floor(M1*alpha),ceil(M1*alpha)]
            pp1 = buffer(param1,M1,pp, 'nodelay');
            spp1 = size(pp1);
            if abs(spp1(2) - N)<tt
                p1 = pp1;
                tt = abs(spp1(2) - N);
            end
            if spp1(2) == N
                flg = 1;
                p1 = pp1;
                break;
            end
        end
    end
end
    

        



