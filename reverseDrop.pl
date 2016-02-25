% reverseDrop(List, Result).
% program the reverses the elements in a list, and drops every second term

reverseDrop([],[]).

reverseDrop([H],[H]).

reverseDrop([F,S|T],L):-
	reverseDrop(T,L1),
	append(L1,[F],L).
