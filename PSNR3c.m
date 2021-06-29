function [SNRc,MSEc]=PSNR3c(R0,G0,B0,R,G,B)

[A(1,1),SNRr,MSEr]=PSNR2(R0,R);
[A(2,1),SNRg,MSEg]=PSNR2(G0,G);
[A(3,1),SNRb,MSEb]=PSNR2(B0,B);

MSEc=(MSEr+MSEg+MSEb)/3;
SNRc=10*log(max(A)*max(A)/MSEc)/log(10);