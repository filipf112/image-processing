clear all;
close all;

%SPLOTY


x=[1,2,3];
y=[-2,1,4];

%Przemiennosc
v1=conv(x,y); %sploty wychodzą takie same
v2=conv(y,x);

%Rozdzielność

x = [1,2,3];
y1 = [2,3,4];
y2 = [-2,1,4];

y = y1+y2;


v3 = conv(x,y);
v4 = conv(x,y1) + conv(x,y2); % v3 i v4 są takie same

%Przesuniecie
a= [1,0,0];
b= [1,0,0];

v5=conv(a,b);

b= [0,0,1];

v6=conv(a,b); %splot przesuniety o 2


%KORELACJA

%Przemiennosc
x=[1,2,3];
y=[3,1,2];

Rxy = xcorr(x,y); %To samo tylko wektor jest przesuniety
Ryx = xcorr(y,x); 

%Autokorelacja 

Rxx = xcorr(x,x); %Maximum w zerze, parzystość

%SPLOT 2D

x = [1 2  ; 3 4 ];
y = [1 2 3 ; 4 5 6 ; 7 8 9];
z = [1 0; 0 0];
%Przemiennosc
v1_2d = conv2(x,y);
v2_2d = conv2(y,x);

%Przesuniecie
z1 = [1 0; 0 0];
z2 = [0 0; 1 0];
v3_2d = conv2(x,z1);
v4_2d= conv2(x,z2); %To samo tylko przesuniete


l = [ 1 4 5 ; 8 6 7; 3 2 9];
k = [1 0 1 ; 1 1 1 ; 1 0 0];

v5_2d = conv2(l,k);

%KORELACJA 2D

x = [1 2 ; -3 4];
y = [-2 1 ; 5 -3];

Rxy = xcorr2(x,y);
Ryx = xcorr2(y,x);
Rxx = xcorr2(x,x);
