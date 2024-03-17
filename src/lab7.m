close all;
clear all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=mask(0.1*pi,41); %tworzy odpowiedz impulsowa filtru 2d coffreq = granica filtru (0-pi), rank = rząd filtru
figure(1)
mesh(h);
xlabel('Frequency');
zlabel('Magnitude')
ylabel('Frequency');
H=fft2(h); %tworzy walec
figure(2)
mesh(abs(H));
figure(3)
mesh(fftshift(abs(H)));
%%%%%%%%%%%%%%%%%%dalsza%%%część%%%na%%%obrazku%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = imread('Lenna.png');
xg = rgb2gray(x);
figure(4)
image(xg);
colormap(gray());
ylp=filter2(h,xg); %lowpass filter
figure(5)
image(ylp)
colormap(gray());
hhp = dlt(41)-h; %generuje funkcje delty Kroneckera, 
% dzieki temu mozemy na przyklad przerobic na filtr gornoprzepustowy odejmujac od tego wczesniejsza odpowiedz impulsowa
HHP = fft2(hhp);
figure(6)
mesh(abs(HHP)); %odpowiedz impulsowa dla gornoprzepustowego
figure(7)
mesh(fftshift(abs(HHP)));

yhp = filter2(hhp,xg); %highpass filter
figure(8)
colormap(gray());
image(yhp)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


ylp_minus_yhp = ylp - yhp; % band-pass
figure(9)
colormap(gray());
image(ylp_minus_yhp)

yhp_minus_ylp = yhp - ylp; % band-stop

figure(10)
colormap(gray());
image(yhp_minus_ylp)


