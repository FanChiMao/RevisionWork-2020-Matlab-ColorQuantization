function [A,SNR,MSE]=PSNR2(u0,u)

[ny,nx]=size(u0);
A=max(max(u0(:)),max(u(:)));
dif=u0(:)-u(:);

MSE=mean(dif.^2);
SNR=10*log(A*A/MSE)/log(10);