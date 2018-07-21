function x = waveletAnalysis(x,N,WaveletName)
 

[c,l] = wavedec(x,N,WaveletName);

x = zeros(N+1,length(x));

x(1,:) = wrcoef('a',c,l,WaveletName,N);

for i = 1:N
    x(i+1,:) = wrcoef('d',c,l,WaveletName,N-i+1);
end
