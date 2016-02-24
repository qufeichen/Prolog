% lookup.
% interactive program that takes in a periodic element symbol and returns the name of the element

% sample db
element(chlorine,'Cl').
element(helium,'He').
element(hydrogen,'H').
element(nitrogen,'N').
element(oxygen,'O').

% lookup
lookup:-
	repeat,
	write('Symbol to look-up: '),
	read(X),
	eval(Y,X).

eval(Y,X):-
	element(Y,X),
	write(X),
	write(' is the symbol for: '),
	writeln(Y),
	!.

eval(Y,X):-
	write('Dont know the symbol for: '),
	writeln(X),
	writeln('Exiting.'),
	!.
