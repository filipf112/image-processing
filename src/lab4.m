clear all;
close all;



image = imread('obraz1.jpg');
image2 = imread('obraz1.jpg');
xgray = rgb2gray(image);
K = 20;
h = ones(K);
splot = conv2(h,xgray);

figure(1)
subplot(1,2,1)
imagesc(xgray);
subplot(1,2,2)
imagesc(splot);
colormap(gray(256));

K1 = 20;
h1 = ones(K1);
splot1 = conv2(h1,xgray);
figure(2)
subplot(1,2,1)
imagesc(xgray);
subplot(1,2,2)
imagesc(splot1);
colormap(gray(256));


splot2 = conv2(h,h1);


%Splot dla kolorowego obrazu
xr = image(:,:,1); 
xg = image(:,:,2);
xb = image(:,:,3);


y1(:,:,1) = conv2(h,xr)/100000;
y1(:,:,2) = conv2(h,xg)/100000;
y1(:,:,3) = conv2(h,xb)/100000;

figure(3)
subplot(1,2,1)
imagesc(y1);
subplot(1,2,2)
imagesc(image)


% %Korelacja dla kolorwego obrazu
img = imread('Lenna.png');

img_part = img(250:280,250:300,:);

k = 20;
m = ones(k)/k*k;
m1 = m;
y = conv2(m,m1);

img_cor(:,:,1) = xcorr2(img(:,:,1),img_part(:,:,1))/25555555;
img_cor(:,:,2) = xcorr2(img(:,:,2),img_part(:,:,2))/25555555;
img_cor(:,:,3) = xcorr2(img(:,:,3),img_part(:,:,3))/25555555;

img_cor1(:,:,1) = xcorr2(img_part(:,:,1),img(:,:,1));
img_cor1(:,:,2) = xcorr2(img_part(:,:,2),img(:,:,2));
img_cor1(:,:,3) = xcorr2(img_part(:,:,3),img(:,:,3));

figure(4);
imagesc(img_cor);

figure(5);
imagesc(img_cor1)

figure(6);
surf(y);
