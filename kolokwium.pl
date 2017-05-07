/* zadanie 4 srednik znaczy lub*/
searchd(drzewo(X,_,_),X).
searchd(drzewo(_,L,R), X) :- searachd(L,X); searchd(R,X).
/* alternatywnie searchd(drzewo(K,L,R), X) :- searchd(R,X). */

prod(nil,1).
/*lub prod(drzewo(K,nil,nil),K). */
prod(drzewo(K,L,R),P) :- prod(L,P1), prod(R,P2), P is P1 * P2 * K.

postorder(nil,[]).
postorder(drzewo(K,L,R), Lista) :- postorder(L,L1), postorder(R,L2), append(L1,L2,L3), append(L3,[K],Lista).

/* przy ostatnim append wystarczy zmienic kolejnosc by bylo inne niz postorder, np. inorder 

zadanie 3*/
splita(X,[],[],[]).
splita(X,[H|L],[H|L1],L2) :- X=<H, splita(X,L,L1,L2).
splita(X,[H|L],L1,[H|L2]) :- X>H, splita(X,L,L1,L2).

mniejsze(X) :- X =< 0.
odd(X) :- 1 is X mod 2.

splitb(P,[],[],[]).
splitb(P,[H|L],[H|L1],L2) :- T=..[P,H], call(T), splitb(P,L,L1,L2).
splitb(P,[H|L],L1,[H|L2]) :- splitb(P,L,L1,L2).

/* zadanie 2 */

sufiksa(X,X).
sufiksa(L,[_|L1]) :- sufiksa(L,L1).

palindromb(L) :- reverse(L,L).



/* zadanie 1 */
membera(X,[X | L]).
membera(X,[ _ | L]) :- membera(X, L).

/*ponizsze powoduje ze znajdziemy tylko jedno rozwiaanie, i ni bedziemy szukac dalej. po sredniku nic nie wystapi)
memberc(X,[X | L]) :- !.
memberc(X,[ _ | L]) :- membera(X, L).

memberb(X,[X | L]). 
memberb(X,[ A | L]) :- memberb(X, L) ; memberb(X,A). /* średnik dziala jako LUB w wykonywaniu procedury */

/*zadanie 26*/
class(Number, positive) :- Number > 0, !.
 class(0,zero), !.
 class(Number, negative) :- Number < 0. 

/* po optymalizacji nalezy przeniesc druga regule na pierwsze miejsce bo nie ma ona warunkow*/
 class(0,zero):- !.
class(Number, positive) :- Number > 0, !.

 class(Number, negative) :- Number < 0. 

/*uzywajac czerwongo wykrzyknika*/
 class(0,zero) :-!.
class(Number, positive) :- Number > 0, !.

 class(Number, negative).

		
	
