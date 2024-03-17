close all;
clear all;

fx1 = 30;
fx2 = 17;
fx3 = 16;
fx4 = 11;
fx5 = 6;
fx6 = 3;

Fsx1 = 512;
Fsx2 = 512;
Tsx1 = 1/Fsx1;
Tsx2 = 1/Fsx2;

N1 = 512;
N2 = 512;

s = zeros(N1,N2);

for n1 = 1:N1
    for n2 = 1:N2
        s1(n1,n2) = (sin(2*pi*fx1*n1*Tsx1+2*pi*fx2*n2*Tsx2));
    end
end




for n1 = 1:N1
    for n2 = 1:N2
        s2(n1,n2) = (sin(2*pi*fx3*n1*Tsx1+2*pi*fx4*n2*Tsx2));

    end
end

for n1 = 1:N1
    for n2 = 1:N2
        s3(n1,n2) = (sin(2*pi*fx5*n1*Tsx1+2*pi*fx6*n2*Tsx2));

    end
end


s=s1+s2+s3;

figure(1)   
subplot(1,4,1)
imagesc(s1)
title("Sygnal 1")
subplot(1,4,2)
imagesc(s2)
title("Sygnal 2")
subplot(1,4,3)
imagesc(s3)
title("Sygnal 3")
subplot(1,4,4)
imagesc(s)
title("Suma sygnalow")

im_fft=fft2(s);

figure(2)                       %wyswietlanie modulu
imagesc(abs(im_fft))
title("Modul z fft sygnalow")

figure(3)       
imagesc(abs(fftshift(im_fft)))

h=mask(0.30,511);
h1=mask(0.2,511);
w = rw2d(hamming(511));
h_lp_hanning = h.*w;

ylp=filter2(h_lp_hanning,s);
ylp1=filter2(h1,s);

figure(4)
subplot(1,2,1)
imagesc(ylp)
title("Sygnał po filtracji")
subplot(1,2,2)
imagesc(s3)
title("Sygnal 3")

figure(5)
imagesc(abs(fftshift(fft2(ylp))))

figure(6)
mesh(abs(fftshift(fft2(h))))
title("Filtr dolnoprzepustowy stworzony przez funkcję mask")
figure(7)
mesh(h)

figure(8)
subplot(2,2,1)
imagesc(ylp1)
subplot(2,2,2)
imagesc(abs(fft2(ylp1)))
subplot(2,2,3)
mesh(h)
subplot(2,2,4)
mesh(abs(fftshift(fft2(h1))))

hhp = dlt(511)-h;

yhp = filter2(hhp,s);



figure(9)
subplot(1,2,1)
image(yhp*100)
title("Sygnał po filtracji")
subplot(1,2,2)
imagesc(s1)
title("Sygnal 1")

figure(10)
mesh(abs(fftshift(fft2(hhp))))

figure(11)
imagesc(abs(fftshift(fft2(yhp))))
