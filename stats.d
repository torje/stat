import std.math;
import std.stdio;
import std.algorithm;
import std.range;
import std.array;

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
		}else if ( r == 1 ){
			return 1;
		}
		ulong[][] pascal_rectangle = minimallyInitializedArray!(ulong[][])(n+1, r+1);
		
		foreach( ref ulong it ; pascal_rectangle[0]){
			it = 1;
		}
		foreach( ref ulong it[] ; pascal_retangle ){
			it[0] = 1;
		}
		foreach(
		return 0;
	}


unittest{
	assert( 20 == nCr(6, 3));
}

double binomial(ulong n, ulong k, double p){
	return nCr(n,k)*pow(p,k)*pow(1-p, n-k);
}

double cumulative_binomial(ulong n, ulong k, double p){
	return reduce!( "a + b")(0.0, map!( a => binomial(n, a, p) )( iota( 1, k+1) ));
}

unittest{
	double a = 0;
	for( int i = 0 ; i < 21 ; ++i){
		writeln(i , ": ", a += binomial(20,i,.5));
		writeln(i , ": ", cumulative_binomial(20,i,.5)); 
	}
}
