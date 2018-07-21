function TR = trfunc(h,l,c)

TR = zeros(size(c));
TR(1) = 0;
hl = h-l;
ch = abs(c(1:end-1)-h(2:end));
cl = abs(c(1:end-1)-l(2:end));
TR(2:end) = max([hl(2:end) ch cl],[],2);











