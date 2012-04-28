import std.math, std.stdio, std.algorithm, std.range, std.array;

version ( none){
	pure ulong nCr(ulong n, ulong r){
		/+ factorial 0 = 1 +/
			c= c > n - c ? c: n - c;
		int result = 1; 
		//return reduce!("a * b")( cast(ulong)1, iota(c, n + 1));
		foreach( ulong i ; c+1..n+1 ){
			result *= i;
			result /= i-c; 
		}
		return result;
	}
}
	ulong nCr( ulong n, ulong r){
		if ( n < r){
			/+screw you!+/
			return 0;
		}
		ulong[][] pascal_rectangle = minimallyInitializedArray!(ulong[][])(n+1-r, r+1);
		
		foreach( ref ulong it ; pascal_rectangle[0]){
			it = 1;
		}
		foreach( ref ulong it[] ; pascal_rectangle ){
			it[0] = 1;
		}
		for( ulong i = 1 ; i <  pascal_rectangle.length ; i++){
			for ( ulong j = 1 ; j < pascal_rectangle[i].length ; j++){
				pascal_rectangle[i][j] = pascal_rectangle[i-1][j] + pascal_rectangle[i][j-1] ;
			}
		}
		return pascal_rectangle[n-r][r];
	}


unittest{
	foreach ( ulong i ; 1..7){
		writeln(nCr(7,i));
	}

	assert( 20 == nCr(6, 3));
}

double binomial(ulong n, ulong k, double p){
	return nCr(n,k)*pow(p,k)*pow(1-p, n-k);
}

double cumulative_binomial(ulong n, ulong k, double p){
	return reduce!( "a + b")(0.0, map!( a => binomial(n, a, p) )( iota( 0, k+1) ));
}

unittest{
	double a = 0;
	for( int i = 0 ; i < 21 ; ++i){
		writeln(i , ": ", a += binomial(20,i,.5));
		writeln(i , ": ", cumulative_binomial(20,i,.5)); 
	}
}
