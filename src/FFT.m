clear all;
close all;

fx1 = 30;
fx2 = 4;
fx3 = 3;
fx4 = 4;

Fsx1 = 512;
Fsx2 = 512;
Tsx1 = 1/Fsx1; 
Tsx2 = 1/Fsx2;

N1 = 512;
N2 = 512;
s = zeros(N1, N2);

for n1 = 1:N1
    for n2 = 1:N2
        s1(n1, n2) = (sin((2 * pi * fx1 * n1 * Tsx1) + (2 * pi * fx2 * n2 * Tsx2)));
    end
end


for n1 = 1:N1
    for n2 = 1:N2
        s2(n1, n2) = sin((2 * pi * fx3 * n1 * Tsx1) + (2 * pi * fx4 * n2 * Tsx2));
        %s2(n1, n2) = (sin(2 * pi * fx3 * sqrt(n1 * n1 + n2 * n2)* Tsx1);
    end
end
s = s1 + s2;

figure(1);
subplot(1, 3, 1);
imagesc(s1);
subplot(1, 3, 2);
imagesc(s2);
subplot(1, 3, 3);
imagesc(s);

H1 = fftshift(fft2(s1));
H2 = fftshift(fft2(s2));
H = fftshift(fft2(s));

figure(2);
imagesc(abs(H1));
title('s1')
figure(3);
imagesc(abs(H2));
title('s2')
figure(4);
imagesc(abs(H));
title('s')



