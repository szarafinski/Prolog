length([],0).
length([H|L],N) :- length(T,N1), N is N1+1
