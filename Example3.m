% This script provides exemplary code for the following publication:
%
% Kryven, I "Analytic results on the polymerisation random graph model", 
%            J Math Chem, 2017, DOI 10.1007/s10910-017-0785-1
%
% The list of examples considered in this collection and corresponding to
% them figures as appear in the paper:
%   u_max  =  [ 0 0 1 ];                      Example 1,    Fig.3
%   u_max  =  [ 0 0 0 1 ];                    Example 2,    Fig.4a
%   u_max  =  [ 0 0 0.5 0.5 ];                Example 2,    Fig.4b     
%   u_max  =  [ 0 0 0 1 ];                    Example 3,    Fig.5
%   u_max  =  [ 0 24 / 25 0 0  0 0 1 / 25 ];  Example 4,    Fig.6a 
%
%
% This work is licensed under a Creative Commons Attribution 4.0 International License.

%% Example 3
figure

f  =  [ 0 0 0 1 ];

mm     = 0 : length( f ) - 1;
mu01 = sum( mm    .* f );
mu02 = sum( mm.^2 .* f );
mu03 = sum( mm.^3 .* f );
c_g =  mu01 / ( mu02 - mu01 );  

cc = sort( [ linspace( 0.001, 0.991, 100 ) c_g * ( 1 - logspace( - 10, - 1, 10 ) ) c_g * ( 1 + logspace( - 10, - 1, 10 ) )  ] );
gfs = [ ];
Ews = [ ];
for c = cc
    
    [ u, U, U1 ] = degree_distribution( f, c );
    r0 = fsolve( @( x ) polyval( U1, x ) - x, 0.35, optimoptions( 'fsolve', 'Display', 'off', 'StepTolerance', 1e-15 ) );
    gf = polyval( U1, r0 );
    t = ( c / ( ( 1 - c ) * mu01 ) );
    if c<c_g
        Ew = 1 +   mu01^2 * t / ( 1 + 2 * mu01 * t - mu02 * t ); 
    else
        Ew =  1 + mu01^2 * r0^2  * t / ( 1 + mu01 * t ) / ( 1 - g_f ) / ( 1 - polyval( polyder( U1 ), r0 ) );
    end;
    
    gfs( end + 1 ) = gf;
    Ews( end + 1 ) = Ew;
    
end
% left panel
subplot( 1, 2, 1 );
plot( cc, gfs )

ylim( [ 0, 1 ] )
xlim( [ 0, 1 ] )

set( gca', 'xscale', 'lin' )
set( gca', 'yscale', 'lin' )

xlabel( 'Edge density, c' )
ylabel( '$1 - g_f$' )
 
% right panel
subplot( 1, 2, 2 );
semilogy( cc, Ews )

xlim( [ 0, 1 ] )
ylim( [ 0, 1e5 ] )

set( gca', 'xscale', 'lin' )
set( gca', 'yscale', 'log' )

xlabel( 'Edge density, c' )
ylabel( '$M_w$' )



 