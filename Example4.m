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


%% Example 4
    figure

    cc = [ 0.2 0.5 0.9 0.99 ];
   f  = [ 0 24 / 25 0 0  0 0 1 / 25 ];
   
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
