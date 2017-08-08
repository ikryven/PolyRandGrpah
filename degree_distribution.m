function [u U U1] = degree_distribution(f,c)

mm     = 0:length( f ) - 1 ;
u = zeros( 1, max( mm ) + 1 );

for d = 1:length( mm )
     for k = 0:mm( d );     
         u(k+1) = u(k+1) + f( d ) * nchoosek( mm( d ), k ) * ( c )^k * ( 1 - c )^( mm( d ) - k ) ;
     end;
end;

u=u/sum(u);

U = u( end:-1:1 );
U1 = polyder( U );
U1 = U1 ./ sum( U1 );

