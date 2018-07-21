function AcountPos = convertTo1xxx(AcountPos)
% clc; clear; 
% load AcountPos
s = size(AcountPos);
s1 = s(1);
for i = 1:s1
    contract = AcountPos{i,1};
    for k = 1:length(contract)
        p = str2num(contract(k));
        if (~isempty(p))&&(p==1)
            break;
        end
        if (~isempty(p))&&(p~=1)
            AcountPos(i,1) = {[contract(1:k-1),'1',contract(k:end)]};
            break;
        end
    end
end


