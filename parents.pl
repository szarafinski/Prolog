parents(pam,bob).
parents(tom,bob).
parents(tom,lis).
parents(bob,ann).
parents(bob,pat).
parents(pat,jim).

male(bob).
male(tom).
male(jim).

female(pam).
female(lis).
female(pat).
female(ann).

child(Dziecko, Rodzic) :- parents(Rodzic,Dziecko).

sisters(Siostra1,Siostra2) :- 
	female(Siostra1), 
	female(Siostra2), 
	not(Siostra1==Siostra2),
	parents(Rodzic,Siostra1), 
	parents(Rodzic,Siostra2).

has_sister(Dziecko,Siostra) :- 
	female(Siostra),
	not(Dziecko==Siostra), 
	parents(Rodzic,Dziecko), 
	parents(Rodzic,Siostra).
	
has_child(Rodzic) :- 
	child(Dziecko,Rodzic).
