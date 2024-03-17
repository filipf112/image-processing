clear all; close all;

xc = imread("obraz1.jpg");

tiledlayout(2,4);

nexttile;
image(xc);

xr = xc;
xr(:,:,2) = 0;
xr(:,:,3) = 0;

nexttile;
image(xr);

xg = xc;
xg(:,:,1) = 0;
xg(:,:,3) = 0;

nexttile;
image(xg);

xb = xc;
xb(:,:,1) = 0;
xb(:,:,2) = 0;

nexttile;
image(xb);

nxc = 255 - xc;

nexttile;
image(nxc);

nxr = 255 - xr;

nexttile;
image(nxr);

nxg = 255 - xg; 

nexttile;
image(nxg);

nxb = 255 - xb;

nexttile;
image(nxb);

xgr = 0.3*xr(:,:,1) + 0.59*xg(:,:,2) + 0.11*xb(:,:,3);
xgr(:,:,2) = xgr(:,:,1);
xgr(:,:,3) = xgr(:,:,1);

xgr1 = xgr;
xgr2 = xgr; 
xgr3 = xgr;

for c = 200:400
    for r = 200:400
        xgr1(c,r,:) = xc(c,r,:);
    end
end 

for c = 200:400 
    for r = 200:400
        xgr2(c,r,:) = xg(c,r,:);
    end 
end 

figure(2);
tiledlayout(2,2);

nexttile;
image(xc);

nexttile; 
image(xgr);

nexttile; 
image(xgr1);

nexttile;
image(xgr2);

for c = 1:512 
    for r = 1:512
        if(xgr3(c, r, 1) >= 50 && xgr(c, r, 1) <= 100)
            xgr3(c, r, 1) = 0;
            xgr3(c, r, 3) = 0;
        end
        
    end 
end 

figure(3);
image(xgr3);