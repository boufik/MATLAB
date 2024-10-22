function [ V, b ] = FibreScalar_LPmn_DispersionCurve( m , n , V )

% Produces the normalized dispersion-relation (b,V) for the linearly
% polarized LP_mn mode of the scalar step-index fiber, under the weakly
% guiding approximation, for given:
%   m: Azimuthial order (0=Fundamental)
%   n: Root-order (for given m, n: integer 1,2,3,...)
%   V: vector of V-values (sorted in descending rate)
%
% Uses a custom/tailored root-finding algorithm for this problem's
% Characteristic Equation (CE): It's a combination of Newton-Raphson (NR) 
% method, first, and then a Bisection (BS) method.
%
% Original : April 2011 [used FSOLVE]
% Updated  : March 2021
%
% Alexandros Pitilakis, Thessaloniki/Greece

% Default settings for iterative root-finding algo
global MaxIter F_Tol b_Tol VocIter rateNR_init
MaxIter     = 200;  % Applies to both NR and BS
F_Tol       = 1e-6; % Applies to both NR and BS
b_Tol       = 1e-6; % Applies to both NR and BS
rateNR_init = 0.1;  % NR: Rate<1, if roots and Tan-Infs are close
VocIter     = 0;    % Vocalize results (iteration,b,F(b))

% Test inputs
if nargin == 0
    m = 0;
    n = 1;
    V = linspace( 20 , 0 );
    if length(V)==1
        VocIter = 1; 
    end
    
    % Some checks
    close all; clc;
    bs = linspace(0.8,1,500);
    [ff,der] = Optikes_FibreScalarCharEq(bs,max(V),m);
    
    subplot(2,1,1) % Plot CE in V-range for this m
    plot( bs , ff , 'bo' ); hold on;
    plot( bs , 0*bs , 'k-' )
    ylim(100*[-1 +1])
    title( sprintf( 'F-vs-b for V=%4.2f' , max(V)) );
    
    subplot(2,1,2) % Plot b-derivative of CE (analytic & numeric)
    bp = 0.5*( bs(1:end-1)+bs(2:end) );
    drn = diff(ff)./diff(bs);
    plot( bs , sign(der).*log10(abs(der)) , 'ks' ); hold on;
    plot( bp , sign(drn).*log10(abs(drn)) , 'rx' ); hold on;
    plot( bs , 0*bs , 'k-' )
    ylim(10*[-1 +1]) 
    title( sprintf( 'dF/db-vs-b for V=%4.2f' , max(V)) );
    ylabel( 'sign * log_{10}' )
end

% Error check
if n < 1, error( ' ## Root-Order(n) must be >=1 !' ); end

% Prepare...
V = sort( V , 'descend' ); %  start from the largest V
b = NaN * V; % initialize b with NaNs
fprintf( ' * Mode LP%d%d |'  , m , n  );

% Find all roots (at given m) at max-V
bs = linspace( 1e-10 , 1-1e-10 , 1e5 );
ALL_b_roots = interpinv( bs , Optikes_FibreScalarCharEq(bs,max(V),m), 0 );
ALL_b_roots = fliplr( ALL_b_roots ); % Decreasing order

% Pick the n'th one to "track". The starting guess (b0) must be above root
try
    b0 = min( [0.9999, ALL_b_roots(n)*1.01] );
catch
    fprintf( ' ----- Below cutoff in V-range!\n');
    return
end

% Scan V-values for dispersion of this LP(m,n), i.e., "track" this mode.
% moving from large Vs to lower
for kV = 1 : length(V)
    
    % Use custom root-finding algo.
    [b_root,~,EF] = myNR( b0, V(kV), m );
    if EF>0
        b(kV) = b_root;
        b0 = min( [0.9999, b_root*1.01] );
    end
    
    % Break if the mode reaches below cut-off
    if kV>3 && all(isnan(b((kV-3):kV)))
        fprintf( ' Done: V_cutoff = %7.4f \n', V(kV-4) )
        break
    end
    
    % If 
    if kV == length(V) % for LP01 mode
        fprintf( ' Done: Cutoff outside V-range\n' );
    end
    
end

% Test plot:
if nargin == 0
    figure;
    plot( V , b )
    title( sprintf( 'LP%d%d mode (b,V) dispersion' , m , n ) )
    ylim([0 1])
    xlim(V([end 1]))
end

end


% ===> Finds a single b-root close/below b_guess (high-accuracy, specific)
function [b_root,Fval,ExitFlag] = myNR( b_guess, V, m )

% Custom root-finding alrorithm, using Newton-Raphson > Bisecant method
% This method is adapted to currect Char.Eq. "form", which is monotonically
% increasing (across the whole b=0...1 range) and contains tangent-like
% sign-changes (+/-Inf) apart from roots. The supplied b_guess should be
% *ABOVE* the b_root (b_guess>b_root). This starts with a "slow" NR method
% and when it detects a sign-change, it switches to BS method.

% Default accuracy settings (defined in master function)
global MaxIter F_Tol b_Tol VocIter rateNR_init

% === Begin algorithm ===
KeepSearching = 1; 
b_curr = b_guess; % starting guess for b-root
itercc = 0; % iteration counter
while KeepSearching == 1
    itercc = itercc + 1;
    
    % Get the F and dF/db value at current (b,V,m) and predict next b
    [F_curr,dFdb] = Optikes_FibreScalarCharEq( b_curr , V , m );   
    b_next = b_curr - rateNR_init*F_curr/dFdb;
    if VocIter == 1
        fprintf( ' * iter(NR) = %3d | F_curr( %6.6f ) = %+1.0e --> b_next = %6.6f \n',...
            itercc, b_curr , F_curr, b_next )
    end
    
    if itercc==1
        F_prev = F_curr;
    end
    
    % If root was "jumped" (sign-change): Bisection method
    if sign(F_prev)*sign(F_curr) == -1        
        
        % Bisection method: F(a) and F(b) have different signs
        a  = b_curr;
        Fa = F_curr;
        b  = b_curr - delta_b;
        while KeepSearching == 1
            itercc = itercc + 1;
            c = (a+b)/2; % b-midpoint
            Fc = Optikes_FibreScalarCharEq( c, V , m ); % F@midpoint
            if VocIter == 1
                fprintf( ' * iter(BS) = %3d | F_curr( %6.6f ) = %+1.0e \n',...
                    itercc, c , Fc )
            end
            
            % Stop criteria (same as for NR)
            if abs(Fc) < F_Tol % Close to root in |F|~0
                KeepSearching = 0;
                ExitFlag = 1.1;
            elseif abs(a-b) < b_Tol % Close to root in ?b~0
                KeepSearching = 0;
                ExitFlag = 1.2;
            elseif itercc > MaxIter
                KeepSearching = 0;
                ExitFlag = -1;
            elseif c > 1 || c < 0
                KeepSearching = 0;
                ExitFlag = -2;
            end
            
            % Bisection: Adapt lower or higher limit
            if sign(Fc) == sign(Fa)
                a = c;
            else
                b = c;
            end
            
        end
        
        
    else % If no sign-change, continue with NR method
        
%         % Adapt rate (speed-up)
%         if abs( b_next - b_curr ) < sqrt(b_Tol)
%             rateNR_init = max( [1 2*rateNR_init] );            
%         end
        
        %Prepare for next iteration
        delta_b = b_next - b_curr;
        b_curr = b_next;
        
    end
    F_curr = F_prev;
    
    % Stop criteria for NR:
    if abs(F_curr) < F_Tol % Close to root in |F|~0
        KeepSearching = 0;
        ExitFlag = 1;
    elseif abs(delta_b) < b_Tol % Close to root in ?b~0
        KeepSearching = 0;
        ExitFlag = 0.5;
    elseif itercc > MaxIter % Maximum iterations reached
        KeepSearching = 0;
        ExitFlag = -1;
    elseif b_next > 1 || b_next < 0 % Invalid b-value reached
        KeepSearching = 0;
        ExitFlag = -2;
    end
    
end

% These are the final values
Fval = F_curr;
b_root = b_curr;

end

% ===> Finds ALL y-roots in given x-range (low-accuracy, generic)
function x0 = interpinv(x, y, y0, dymax)

% Function x0 = interpinv(x,y,y0,dymax) finds ALL the x-roots (x0) of the
% equation y(x)-y0 = 0, which is given in the same-length vectors x and y.
% This simple algorithm first looks for x-pairs with sign changes in
% f(x) = y(x)-y0, and uses MATLAB's interp1 there. There is no restriction
% on x and y (e.g. uniformely spaced), apart from them being real. If no
% root is found, x0 is an empty vector.
%
% The last input (dymax) is the maximum allowable y-difference around a
% sign-change which is considered as a valid zero-crossing. For instance,
% if dymax=5, then it returns a root betwen y-y0= [+4,-0.9] but not
% between [-1.1,+5]. This is useful for y(x) curves that are steep and/or
% undersampled, or for tangent-like discontinuities around (2m+1)*pi/2,
% that go from +Inf to -Inf.
%
% Alexandros Pitilakis, Thessaloniki/Greece, 2009-2019

% Default dymax limit (for the tangent-like discontinuities).
if nargin == 3
    dymax = 10;
end

% Error check
if ~all(isreal(x)) || ~all(isreal(y)) || ~isreal(y0)
    error( ' ## InterpInv: x, y and y0 must be REAL!' )
end

ya = y-y0; %Look for zero-crosses in the aux function ya=y-y0;
sch = sign(ya(1:end-1)) .* sign( ya(2:end) ); %-1 where sign-change

% Look for tangeant-like infinties who can be confused for roots.
% So, set this flag to 1, where the function is assumed continuous...
tanch = abs( ya(1:end-1) - ya(2:end)) < dymax;

% Where sch==-1 AND tanch==1, it means that we have a "valid" sign-change
% between ya(is) and ya(is+1), so use INTERP1 for a root in that monotonic
% segment
is = find( (sch == -1) & (tanch == 1) );
x0 = NaN*zeros( size(is) );
for k = 1 : length(is)
    x0(k) = interp1( y(is(k):is(k)+1) , x(is(k):is(k)+1) , y0 , 'pchip' );
end


end



