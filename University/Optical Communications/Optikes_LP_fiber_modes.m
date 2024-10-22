clear all; clc;

% ========================================================================
%  Given the fiber V-number solve for a specific mode of order (m,n)=(p,r)
% ========================================================================

m = 0;  % Azimuthial order (0=fundamental), denoted as p in Lecture Notes
n = 1;  % Root order (1=fundamental), denoted as r in Lecture Notes
V = 2.2;% V-nmber

[ V, b ] = Optikes_FibreScalar_LPmn_DispersionCurve( m , n , V )

% ========================================================================
%                            Mode Profile F(x,y)
% ========================================================================

figure;
set(gcf,'PaperPositionMode','auto','color','w')
FigSize = [ 400 400 ]; %pixels
cccs = [ 1 1 1 ; Optikes_LVCMv2( [0 0 0; 0 0 .5 ; 0 0 1; 0 1 1; 1 1 0 ; 1 0 0 ] ) ];
set( gcf , 'Position' , [100 100 FigSize ] )

% Fiber specs
a = 20; % um radius

% Define a Space (x,y)->(rho,theta)
x = 3*a*linspace( -1,1,200 );
y = 3*a*linspace( -1,1,200 );
[x y] = meshgrid( x , y );
ra = sqrt( x.^2 + y.^2 );
%th = atan( x./y );
th = atan2(y,x);
is = ra <= a;
os = ra >= a;

options = optimset( 'Display' , 'off' );
bo = b;
Va = V;

% Calc field mode on that:
U = Va*sqrt(1-bo);
W = Va*sqrt(bo);
F = NaN*x;
Ain = 1;
Aot = Ain*besselj( m , U ) / besselk( m , W );
F(is) = Ain*besselj( m , U*ra(is)/a ).*cos( m*th(is) );
F(os) = Aot*besselk( m , W*ra(os)/a ).*cos( m*th(os) );

% Plots
cla; hold on;
pcolor( x/a , y/a , (F) )
plot( cos(2*pi*linspace(0,1,100)) , sin(2*pi*linspace(0,1,100)) , 'k-.' , 'LineWidth' , 2 );
plot( get(gca,'XLim') , [0 0] , 'k:' , [0 0] , get(gca,'YLim')  , 'k:' )
    
% Cosmetics
box on; grid on;
shading interp; colorbar;
colormap( Optikes_LVCMv2( 6 ) )
maxcax = max(besselj(m,linspace(0,20,100)));
caxis([-maxcax maxcax]);
xlabel( 'x/a' ); ylabel( 'y/a' );
title( sprintf( 'LP_{%1d%1d} Fibre Scalar Mode, V = %5.2f' , m , n , Va ) )
axis equal tight
hold off;
