function [F,dFdb] = FibreScalarCharEq( b , V , m )

% Produces the value "F" or the characteristic equation (CE) of the scalar
% step-index optical fiber, for the m'th ("m"=0,1,2,...) azimuthial order.
% This CE holds under the weakly-guiding approximation, n_core ~ n_clad,
% which produces linearly polarized (LP) modes, LP_mX, where X is the order
% of the root of the CE, related to Bessel. The fundamental mode is LP_01
% and the first higher-order mode is LP_11.
%
% This function is used to find the roots of the CE, corresponding to the
% dispersion relation of LP_mX modes. The inputs are:
% 
%       ( neff, {n1,n2,freq,core_radius}, m ) --> ( b , V , m )
%
% Where the first inputs are defined in terms of normalized phase constant 
% (or effective index, neff=beta/k0) and frequency:
%    "b" = (neff^2-n2^2)/(n1^2-n2^2)
%    "V" = radius * k0 * sqrt(n1^2-n2^2) = a*k0*NA
% Typical Procedure: FOR(each V){FIND the b-value that zero's F}. 
%
% The function also produces the dF/db derivative, useful in some 
% root-finding algorithms. Note that dF/db>0 in the entire b=[0,1] region.
% 
% The CE is taken from 1971_Gloge, Eq. (10). Note that the CE given in 
% [EEK OCs, Ch2, Homework#2], which involves the Bessel J and K 
% x-derivatives matches the Gloge CE, using the recurrence relations:
%   ** d/dx( J(m,x) ) = + J(m-1,x) - m/x*J(m,x)
%   ** d/dx( K(m,x) ) = - K(m-1,x) - m/x*K(m,x)
%
% Original : April 2011
% Corrected: March 2021
%
% Alexandros Pitilakis, Thessaloniki/Greece 

% Error checks:
if m<0 || mod(m,1)~=0 || ~isreal(m)
    error(' ## m is zero or positive integer: 0,1,2,...' )
end
if b > 1 | b < 0 | ~isreal(b)
    fprintf( ' b = %f\n ' , b );
    disp( ' ## b (normalized phase constant) is in [0,1]' )
    b = 0;
end
if V < 0 | ~isreal(V)
    error( ' ## b (normalized frequency) is a real positive number' )
end

% Normalized aux variables
U = V * sqrt(1-b); % == radius * k0 * sqrt( n_core^2 - n_eff^2 )
W = V * sqrt(b);   % == radius * k0 * sqrt( n_eff^2 - n_clad^2 )

% Value of CE for given (m,b,V)-->(m,U,W)
F = + U.*besselj(m-1,U)./besselj(m,U) ...
    + W.*besselk(m-1,W)./besselk(m,W);

% b-Derivative of F, useful in Newton-Raphson root-finding algo:
if nargout == 2
    
    % Components of derivative:
    dUdb = V/2 ./ sqrt(1-b) *-1;
    dWdb = V/2 ./ sqrt(b)   *+1;
    dJoJdU = (+0.5*(besselj(m-2,U)-besselj(m  ,U)).*besselj(m  ,U)...
              -0.5*(besselj(m-1,U)-besselj(m+1,U)).*besselj(m-1,U) )...
             ./besselj(m,U).^2;
    dKoKdW = (-0.5*(besselk(m-2,W)+besselk(m  ,W)).*besselk(m  ,W)...
              +0.5*(besselk(m-1,W)+besselk(m+1,W)).*besselk(m-1,W) )...
             ./besselk(m,W).^2;
         
    % Final expression:
    dFdb = +dUdb.*( U.*dJoJdU + besselj(m-1,U)./besselj(m,U) )...
           +dWdb.*( W.*dKoKdW + besselk(m-1,W)./besselk(m,W) );
end


return

% --- 2011 Version ---
% Characteristic equation value for b,V,m
if m == 0 % Simple form for m=0
    F = + sqrt(1-b).*besselj(1,U)./besselj(0,U) ...
        - sqrt(b).*besselk(1,W)./besselk(0,W);
    % ** This is correct
else
    F = +U.*( +besselj(m-1,U)-m./U.*besselj(m,U) )./besselj(m,U) ...
        -W.*( -besselk(m-1,W)-m./U.*besselk(m,W) )./besselk(m,W);
    % **  The mistake: it should be -m/W (not -m/U) in the second term.
end
