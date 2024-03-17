close all;
clear all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h = mask(0.1 * pi, 41); % tworzy odpowiedź impulsową filtru 2D coffreq = granica filtru (0-pi), rank = rząd filtru

x = imread('Lenna.png');
xg = rgb2gray(x);
figure(1)
image(xg);
colormap(gray());
title('Obraz wejściowy');

ylp = filter2(h, xg); % lowpass filter
figure(2)
image(ylp)
colormap(gray());
title('Obraz po filtracji pasmowoprzepustowej (lowpass)');

hhp = dlt(41) - h; % generuje funkcję delty Kroneckera,
% dzięki temu możemy na przykład przekształcić go na filtr górnoprzepustowy, odejmując wcześniejszą odpowiedź impulsową



yhp = filter2(hhp, xg); 
figure(8)
colormap(gray());
image(yhp)
title('Obraz po filtracji pasmowoprzepustowej (highpass)');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ylp_minus_yhp = ylp - yhp; % Odejmowanie wyniku filtru górnoprzepustowego od filtru dolnoprzepustowego

figure(3)
colormap(gray());
image(ylp_minus_yhp)
title('Obraz po odjęciu filtru górnoprzepustowego od filtru dolnoprzepustowego (bandpass)');

