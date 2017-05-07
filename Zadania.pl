% 1. D�ugo�� listy mo�na w Prologu zdefiniowa� nast�puj�co:
mylength(0, []).
mylength(N, [_|L]) :- mylength(M, L), N is M+1.
% Prosz� zdefiniowa� predykaty fib/2 oraz nwd/3.
fib(0,W) :- W is 0.
fib(1,W) :- W is 1.
fib(X,W) :- X1 is X-1, X2 is X-2, fib(X1,W1), fib(X2,W2), W is W1+W2.

nwd(L1,0,L1).
nwd(L1,L2,W) :- NL2 is L2 mod L1, nwd(L2, NL2,W).

% 2. Niech b�dzie dana baza danych zawieraj�ca predykaty parent/2,
% female/1 i male/1. Prosz� zdefiniowa� predykaty child/2, mother/2,
% sister/2, has_a_child/1, grandparent/2 oraz predecessor/2.

parent(stefan,michal).
parent(michal,zosia).
parent(zosia,krysia).
parent(zosia,maja).
parent(stefan,krystian).

male(stefan).
male(michal).
male(krystian).
famale(zosia).
famale(krysia).
famale(maja).

child(X,Y):-parent(Y,X).
mother(X,Y):-parent(X,Y), famale(X).
sister(X,Y):-parent(Z1,X),parent(Z2,Y),famale(X),famale(Y),Z1=Z2.

% 3. Niech b�d� dane nast�puj�ce predykaty:
q1(X,Y) :- p(X,Y).
q1(X,Y) :- p(X,Z), q1(Z,Y).

q2(X,Y) :- p(X,Y).
q2(X,Y) :- p(X,Z), q2(Z,Y).

q3(X,Y) :- q3(X,Z), p(Z,Y).
q3(X,Y) :- p(X,Y).

q4(X,Y) :- q4(X,Z), p(Z,Y).
q4(X,Y) :- p(X,Y).
%oraz baza danych dla predykat p:
 p(pam,bob).
 p(tom,bob).
 p(tom,liz).
 p(bob,ann).
 p(bob,pat).
 p(pat,jim).
% Prosz� zilustrowa�, jak Prolog odpowiada na pytania ?-qi(tom,pat). oraz
% ?-qi(liz,jim).

% 4. Niech b�dzie dany nast�puj�cy program:
 f(1,one).
 f(s(1),two).
 f(s(s(1)),three).
 f(s(s(s(X))),N) :- f(X,N).
%Jak odpowiada Prolog na pytanie
%f(s(1),A)?
%f(s(s(1)),two)?
%f(s(s(s(s(s(s(1)))))),C)?
%f(D,three)?

% 5. Prosz� zdefiniowa� predykat number(Z), kt�ry znajduje wszystkie trzy-cyfrowe liczby, kt�re mo�na podzieli� prez 5 i 6 oraz maj� reszt� 3, je�eli zostaj� podzielone przez 9.
numbers(Z):- Z < 1000, Z>99,  Z1 is Z mod 5, Z1 == 0.


% 6. Prosz� zdefiniowa� predykat rzym/2, kt�ry transformuje rzymskie
% liczby do liczb dziesi�tnich. Liczby rzymskie mo�na po prostu
% reprezentowa� jako listy, n.p. [x,l,v,i,i],
%
%rzym([],D):- D is 0.
%rzym([R1|R2],D):- rzym(R2,D2), D3 is  ,D is D2 + D3.

% 7. Prosz� zdefiniowa� nast�puj�ce predykaty dla list.
% a) last(X,L), kt�ry jest spe�niony, je�eli X jest ostatnim elementem listy L.

last(X,[L|O]) :- O == [], X == L.
last(X,[_|O]) :- last(X,O).

% b) delete(X,L1,L2), kt�ry jest spe�niony, je�eli L2 r�wna si� L1 bez elementu
delete(X,[X|L],L).
delete(X,[H|L1],[H|L2]):-delete(X,L1,L2).

%  c) delete(L1,L2), kt�ry jest spe�niony, je�eli L2 r�wna si� L1 bez
%  ostatnich trzech elemnet�w.

dlugosc([],0).
dlugosc([_|L],X):- dlugosc(L,X1), X is X1 +1.

delete([],[]).
delete([_|L1],[_|L2]) :- delete(L1,L2), dlugosc(L1,X), X <4.
delete([H|L1],[H|L2]) :- delete(L1,L2), dlugosc(L1,X), X >3.

% d) p(X,L,Y,Z), kt�ry jest spe�niony, je�eli Y jest poprzednikiem
% elementu X w li�cie L a Z nast�pc� elementu X w li�cie L. Przyk�ad: ?-
% p(3, [1,2,3,4,5], Y, Z). Y = 2, Z = 4
p(X,[H|L],Y,Z) :- p(X,H,L,Y,Z).
p(X,H,[H1|L],Y,Z) :- H == Y,H1 == X, p(X,H1,L,Y,Z)) .
