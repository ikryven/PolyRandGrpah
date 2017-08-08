% This script provides exemplary code for the following publication :
%
% Kryven, I "Analytic results on the polymerisation random graph model", 
%            J Math Chem, 2017, DOI 10.1007 / s10910 - 017 - 0785 - 1
%
% The list of examples considered in this collection and corresponding to
% them figures as appear in the paper :
%   u_max  =  [ 0 0 1 ];                      Example 1,    Fig.3
%   u_max  =  [ 0 0 0 1 ];                    Example 2,    Fig.4a
%   u_max  =  [ 0 0 0.5 0.5 ];                Example 2,    Fig.4b     
%   u_max  =  [ 0 0 0 1 ];                    Example 3,    Fig.5
%   u_max  =  [ 0 24 / 25 0 0  0 0 1 / 25 ];  Example 4,    Fig.6a 
%
%
% This work is licensed under a Creative Commons Attribution 4.0 International License.


%%

figure

% Example 2a
   
   f  =  [ 0 0 0 1 ];
   cc = [ 0.01, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.8, 0.9, 0.99, 0.999 ];
   subplot( 1, 2, 1 )
   for c = cc
       u = degree_distribution( f, c );
       w = components_lagrange( u, 2e3 );  
       loglog( w )
       hold on
   end
   
   ylim( [ 1e-6 1 ] )
   xlim( [ 1 2e3 ] )
   ylabel( 'Probability, w' )
   xlabel( 'Component size, n' )
   legend( num2str( cc' ))
   
% Example 2b   
f  =  [ 0 0 49 / 50 1 / 50 ];
nn  = 0 : length( f ) - 1;

c_g = sum( nn .* f ) / sum( ( nn.^2 - nn ) .* f );
cc = sort( [ 0.01, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.8, 0.9, 0.99, 0.998 c_g ] );

   subplot( 1, 2, 2 )
   for c = cc
       u = degree_distribution( f, c );
       w = components_lagrange( u, 2e3 );  
       loglog( w )
       hold on
   end
   
   ylim( [ 1e-6 1 ] )
   xlim( [ 1 2e3 ] )
   ylabel( 'Probability, w' )
   xlabel( 'Component size, n' )
   legend( num2str( cc' ))
   
   
   
 