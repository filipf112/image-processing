clear all;
close all;

fx1=30;
fx2=4;
fx3=45;
fx4=20;
fx5=5;
fx6=3;

Fsx1=512;
Fsx2=512;
Tsx1=1/Fsx1;
Tsx2=1/Fsx2;

N1=512;
N2=512;
s=zeros(N1,N2);

for n1=1:N1
    for n2=1:N2
        s1(n1,n2)=(sin(2*pi*fx1*n1*Tsx1+2*pi*fx2*n2*Tsx2));
    end
end

for n1=1:N1
    for n2=1:N2
        s2(n1,n2)= sin(2*pi*fx3*n1*Tsx1+2*pi*fx4*n2*Tsx2);       
    end
end

for n1=1:N1
    for n2=1:N2
        s3(n1,n2)= sin(2*pi*fx5*n1*Tsx1+2*pi*fx6*n2*Tsx2);       
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

h=mask(0.5,501);
h1=mask(0.2,501);

ylp=filter2(h,s);
ylp1=filter2(h1,s);

figure(3)
subplot(2,2,1)
imagesc(ylp)
subplot(2,2,2)
imagesc(abs(fft2(ylp)))
subplot(2,2,3)
mesh(h)
subplot(2,2,4)
mesh(abs(fftshift(fft2(h))))

figure(4)
subplot(2,2,1)
imagesc(ylp1)
subplot(2,2,2)
imagesc(abs(fft2(ylp1)))
subplot(2,2,3)
mesh(h1)
subplot(2,2,4)
mesh(abs(fftshift(fft2(h1))))


