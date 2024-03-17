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

h_img = fft2(s); %fft z org
inv_h = ifft2(h_img); %inwertowane fft
sh_img = fftshift(h_img); %oborcenie fft

sh1_img = sh_img; %zmienna do obroconego fft

% for n1 = 240:280
%     for n2 = 245:280
%     sh_img(n1, n2) = 0; 
%     end
% end
% 
% figure(3)
% sh2_img = abs(sh_img); 
% image(sh2_img);
% sh2_img = ifft(sh2_img);
% 
% % figure(4)
% % image(sh2_img)


sh3_img = sh_img; %obrocone fft

shh = zeros(512, 512); %macierz 0

for n1 = 250 : 265
    for n2 = 250 : 265
            shh(n1,n2) = sh1_img(n1, n2); %wysokie f=0
    end
end



image(abs(shh)*100000)

