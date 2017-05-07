nwd(X,Y,X) :- Y is 0.
/* nwd (X,0,X). */
nwd(X,Y,Wynik):- 
	not(Y==0),
	X1 is X mod Y,
	nwd(Y, X1, Wynik).
