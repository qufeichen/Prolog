% sum_int(N,X).
% program that finds the sum of the first N integers

sum_int(1,1).
sum_int(N,X):- N>1, N1 is N-1, sum_int(N1,X1), X is X1+N.
