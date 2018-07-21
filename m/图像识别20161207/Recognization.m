function [RecogRes, emin] = Recognization (d2, ColIndex, templet)

nCount = length(ColIndex);
RecogRes = cell (1, nCount);
emin = zeros(1, nCount) ;
for i = 1:nCount
    e = zeros (1, 10) ;
    
    if ColIndex( i,2) - ColIndex (i, 1) <=6
        RecogRes(i) = {'.'};
    else
        
        for k = 1:10
            tsize = size (cell2mat (templet (k) ) ) ;
            ddd = imresize (d2 (:, ColIndex (i, 1): ColIndex( i,2)), tsize) ;
            e(k) = sum(sum(abs(cell2mat (templet(k))-ddd)));
            
            %tmp = corrcoef(double(cell2mat(templet(k))),double(ddd));
            %e(k) = tmp(1,2);
            
        end
        [emin(i), indx] = min(e) ;
        
        RecogRes(i) = {num2str(mod(indx,10))};
        
    end

end


RecogRes = str2double((char(RecogRes))');






