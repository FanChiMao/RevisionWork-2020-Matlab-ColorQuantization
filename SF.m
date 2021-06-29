function SL = SF(n)

delta = 0.5;
tau1 = (5^0.5-1)/2;
tau2 = 2^0.5;
a = real((n^delta)*exp(1i*2*pi*n*tau1));
b = imag((n^delta)*exp(1i*2*pi*n*tau1))*cos(2*pi*n*tau2);
L = imag((n^delta)*exp(1i*2*pi*n*tau1))*(sin(2*pi*n*tau2));
SL = [a b L];
end
