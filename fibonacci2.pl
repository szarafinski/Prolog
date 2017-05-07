fib(0,0).
fib(1,1).
fib(N,Y) :- 
	N > 1, 
	X2 is N-2, fib(X2,Y2), 
	X1 is N-1, fib(X1,Y1), 
	Y is Y1 + Y2.


