% multi-part program that manipulates cubes/cube roots

% cubeLess(X,B,R).
% calculates the power of 3 and the remainder such that b=(x^3)+r
% sample query:
% ?-cubeLess(2,10,R)
cubeLess(X,B,R):-
	R is B-(X*X*X).


% smallerCube(X,Limit).
% finds all numbers with a cube smaller that the given limit
smallerCube(X,B):-
	number(X),
	cubeLess(X,B,RR),
	RR<0,
	!.

smallerCube(X,B):-
	number(X),
	cubeLess(X,B,RR),
	RR>0,
	write(X),
	write(' rest '),
	writeln(RR),
	XX is X+1,
	smallerCube(XX,B),
	!.

smallerCube(X,B):-
	smallerCube(1,B).


% restSum(Limit, S).
% adds up all the remainders from finding all the cubes up to an upper limit
restSum(B, X, S):-
	cubeLess(X,B,R),
	R<0,
	S is 0,
	!.

restSum(B, X, S):-
	cubeLess(X,B,R),
	R>0,
	XX is X+1,
	restSum(B,XX,SS),
	S is R + SS.

restSum(B,S):-
	restSum(B, 1, S).


% showAllRestSums(Min,Max).
% print all rest sums that are multiples of 3 within a range
showAllRestSums(X,Y):-
	X = 1,
	write(X),
	write(' rest '),
	writeln('0'),
	showAllRestSums(2,Y),
	!.

showAllRestSums(X,Y):-
	X = Y,
	!.

showAllRestSums(X,Y):-
	X < Y,
	restSum(X,S),
	0 is S mod 3,
	write(X),
	write(' rest '),
	writeln(S),
	XX is X + 1,
	showAllRestSums(XX, Y),
	!.

showAllRestSums(X,Y):-
	X < Y,
	XX is X+1,
	showAllRestSums(XX, Y).
