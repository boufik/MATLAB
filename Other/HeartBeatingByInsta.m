clear;clc;
L=2.5;
N=40;
M=[0:(N/2) (-N/2):(-1)]';
clf;
kx=2*pi*M/L;
[Kx,Ky,Kz]=meshgrid(kx,kx,kx);
x=-L/2:L/N:L/2;[X,Y,Z]=meshgrid(x,x,x);
Phi= 2-(2*X.^2 + Y.^2 + Z.^2 -1).^3 + 0.2*X.^2.*Z.^3 + Y.^2.*Z.^3;
Phihat=fftn(Phi);
gam=0.01*(-Kx.^2-Ky.^2-Kz.^2);
t1 = 0:0.05:1;
t1 = [t1 fliplr(t1) t1 fliplr(t1) t1 fliplr(t1) t1 fliplr(t1) t1 fliplr(t1)];
for t=1:length(t1);
Phi=ifftn(Phihat.*exp(gam*t1(t)));
isosurface(Phi,2);
lighting phong;colormap([1 0 0]);
axis([0 N+N/4 0 N+N/4 0 N+N/4]);view(-63,12);
box on; grid on
drawnow;
clf
end
isosurface(Phi,2);
lighting phong;colormap([1 0 0]);
axis([0 N+N/4 0 N+N/4 0 N+N/4]);view(-63,12);
box on; grid on
drawnow;