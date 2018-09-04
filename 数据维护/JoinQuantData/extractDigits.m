function Digits = extractDigits(contracts,N)

Digits = zeros(1,length(contracts));
for i = 1:length(contracts)
    str=contracts{i};
    A = isstrprop(str,'digit');
    B = str(A);
    Digits(i) = str2double(B);
end

Digits = repmat(Digits,N,1);



