% secondLast(X, List).
% program that finds the second last element of a list.

secondLast(X,[Y|Z]):-
	listlength(Z,L),
	L>1,
	secondLast(X,Z).

secondLast(X,[Y|Z]):-
	listlength(Z,L),
	L=1,
	X is Y,
	!.

listlength([],0).

listlength([X|L],N):-
	listlength(L,NN),
	N is NN+1.
