clear all;
close all;

img = imread("Lenna.png");

h_img = fft2(img);
inv_h = ifft2(h_img);
sh_img = fftshift(h_img);


sh1_img = sh_img;

figure(1);
imagesc(abs(sh1_img)/25555);

figure(2);
imagesc(real(inv_h)/400);

for n1 = 150:350
    for n2 = 150:350
        for n3 = 1:3
            sh1_img(n1, n2, n3) = 0;
        end
    end
end

figure(3)
sh2_img = fftshift(sh1_img);
imagesc(abs(sh1_img)/25555);

figure(4)
inv1_hh = ifft2(sh2_img);
imagesc(real(inv1_hh)/200);
title("Niskie czestotliwosci");


sh3_img = sh_img;

shh = zeros(512, 512, 3);



for n1 = 200 : 300
    for n2 = 200 : 300
        for n3 = 1:3
            shh(n1,n2,n3) = sh3_img(n1, n2, n3);
        end
    end
end



figure(5)
sh4_img = fftshift(shh);
imagesc(abs(shh)/25555);

figure(6)
inv2_hh = ifft2(sh4_img);
imagesc(real(inv2_hh)/500);
title("Wysokie czestotliwosci");

