% maxmin(List, Max, Min).
% program that returns the max and min values from a list
maxmin([H],H,H).

maxmin([H|T],Max,Min):-
	maxmin(T,Max2,Min2),
	Max is max(Max2,H),
	Min is min(Min2,H).
