clear all;
close all;

xc = imread("obraz1.jpg"); %wczytywanie obrazu

xr = xc(:,:,1);  %macierz trojwymiarowa, z ostatnim wymiarem pojedynczym - 1 warstwa
xg = xc(:,:,2);
xb = xc(:,:,3);

cmr = zeros(256,3); %maski dla poszczególnych kolorów
cmg = zeros(256,3);
cmb = zeros(256,3);

cmr(:,1) = [(0:255)/255]; %ustawianie kolumn w masce aby wyswietlic poszczegolne kolory
cmg(:,2) = [(0:255)/255];
cmb(:,3) = [(0:255)/255];


figure(1);
title("Obraz czerwony");
colormap(cmr);
imagesc(xr);

figure(2);
title("Obraz zielony");
colormap(cmg);
imagesc(xg);

figure(3);
title("Obraz niebieski");
colormap(cmb);
imagesc(xb);

figure(4)
title("Obraz oryginalny")
imagesc(xc);


xcneg = 255-xc; %obraz negatywny

figure(5)
title("Negatyw")
imagesc(xcneg)


xrneg = 255-xr; %negatywy masek
xgneg = 255-xg;
xbneg = 255-xb;

xcneg2(:,:,1) = xrneg; %wstawianie stron 
xcneg2(:,:,2) = xgneg;
xcneg2(:,:,3) = xbneg;

figure(6)
title("Negatyw zlozony z r,g,b")
imagesc(xcneg2)


%Obraz szary pierwsza metoda
xgray = 0.3*xr+0.59*xg+0.11*xb;

x3gr(:,:,1) = xgray; %wstawianie w skali szarosci
x3gr(:,:,2) = xgray;
x3gr(:,:,3) = xgray;

for w = 50:100
    for s = 50:100
        x3gr(w,s,:) = xc(w,s,:);
    end
end


figure(7)
imagesc(x3gr)


xgray = 0.3*xr+0.59*xg+0.11*xb;

x3gr(:,:,1) = xgray; %wstawianie w skali szarosci
x3gr(:,:,2) = xgray;
x3gr(:,:,3) = xgray;

for w = 100:150
    for s = 100:150
        x3gr(w,s,2) = xg(w,s);
    end
end


figure(8)
imagesc(x3gr)

%w odcieniu g przedstawic wartosci od do czyli powyzej jakiejs wartosci

xgray = 0.3*xr+0.59*xg+0.11*xb;

x3gr(:,:,1) = xgray; %wstawianie w skali szarosci
x3gr(:,:,2) = xgray;
x3gr(:,:,3) = xgray;


prog_szarosci = 100;


for w = 1:177
    for s = 1:284
        if x3gr(w, s) >= prog_szarosci
            x3gr(w, s, 2) = xg(w, s);
        end
    end
end

figure(9)
imagesc(x3gr)


xgray = 0.3*xr+0.59*xg+0.11*xb;

x3gr(:,:,1) = xgray; %wstawianie w skali szarosci
x3gr(:,:,2) = xgray;
x3gr(:,:,3) = xgray;

for c = 1:177
    for r = 1:284
        if(x3gr(c, r, 1) >= 50 && xg(c, r, 1) <= 100)
            x3gr(c, r, 1) = 0;
            x3gr(c, r, 3) = 0;
        end
    end
end


figure(10)
imagesc(x3gr)








