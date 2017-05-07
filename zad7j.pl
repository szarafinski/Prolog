/* przyklad a) 
last(X,L), który jest spełniony, jeżeli X jest ostatnim elementem listy L. 
*/

last([Element],Element).
last([_|Ogon],Element) :- last2(Ogon, Element).

/* litera b) 
delete(X,L1,L2), który jest spełniony, jeżeli L2 równa się L1 bez elementu X. 
dziala tylko w jedną stronę
*/
usun(_,[],[]).
usun(X, [X|Ogon], Y) :- 
	usun(X, Ogon, Y).
usun(X, [T|Ogon], [T|Y]) :-
	dif(X,T),
	usun(X,Ogon,Y).
/* litera c)
delete(L1,L2), który jest spełniony, jeżeli L2 równa się L1 bez ostatnich trzech elemnetów. 
*/

usun2([_,_,_],[]).
usun2([X|Ogon1], [X|Ogon2) :- usun2(Ogon1, Ogon2).

/* litera j) */
polacz(L1,L2,L) :- 
	L1 = [Element1|Ogon1],
	L2 = [Element2|Ogon2],
	L = [[Element1,Element2]|M],
	polacz(Ogon1,Ogon2,M).
polacz([],[],M) :- M = [].
/* moze byc jako polacz([],[],[]). */

polacz2([],[],[]).
polacz2([X1|L1],[X2|L2],[[X1,X2]|M]) :- polacz2(L1,L2,M).
