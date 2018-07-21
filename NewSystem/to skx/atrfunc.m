% TB —È÷§
function atr = atrfunc(h,l,c,N)

atr  = zeros(length(c),1);
tr = zeros(length(c),1);

for i=1:length(c)
    if i == 1
        tr(i) = h(1)-l(1);
    else
        tr(i) = max([abs(c(i-1)-l(i)), ...
            abs(c(i-1)-h(i)), ...
            h(i) - l(i)]);
    end
end

for i = 1:length(c)
    if i<N
        atr(i) = mean(tr(1:i));
    else
        atr(i) = mean(tr(i-N+1:i));
    end
end

end


















