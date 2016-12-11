T = 40;
D = 11;
dutyCicle = 27.5;
w0 = 2 * pi / T;
N = 50;
pas = T / 100;  
t = -2 * T : pas : 2 * T;

coeficienti = zeros(1,N);

sDreptunghiular = square( w0 * t, dutyCicle);

Fourier = @(t,k) square( w0 * t, dutyCicle).*exp( -1j * k * w0 * t);%functia pe care o integram
reconstruire = 0;

C0 = (1 / T) * integral(@(t) Fourier(t,0),0,T);

for k = 1:1:50
    coeficienti(k) = (1 / T) * integral(@(t) Fourier(t,k - 25 ),0,T);
    reconstruire = reconstruire + coeficienti(k) * exp( 1j * (k - 25) * w0 * t);
end
plot(t, reconstruire, t, sDreptunghiular);