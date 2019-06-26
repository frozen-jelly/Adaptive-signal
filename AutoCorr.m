function Rx=AutoCorr(x)
%% 
xm=x-mean(x);
X=fft(xm);
Rx=ifft(X.*conj(X));
end