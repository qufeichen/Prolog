% Golfer Puzzle
% Prolog Assignment 2, Winter 2016
%
% Five golfers, named Jules, Gilles, Jean, Joe and Ghislain often play a round of golf together.
% Their occupations are, not necessarily in this order, mason, plasterer, carpenter, tinsmith and roofer.
% They have played a round of golf but at the end their score cards don’t match.
% Their results were even numbers between 64 and 84.
% • Ghislain played par with 72, beating the roofer by 2 strokes.
% • Gilles had a bad day, and has ended with 10 strokes above par, or 12 strokes more than the mason.
% • The tinsmith has beaten Joe by 4 strokes and has won the round.
% • Jules has beaten the carpenter by 8 strokes, but did not win overall.
% Find the occupation and the score of each player.

% sample query:
% ?- scores(player(jules,M1,P1), player(jean,M2,P2), player(gilles,M3,P3), player(joe,M4,P4), player(ghislain,M5,P5)).

% database of facts
golfer(jules).
golfer(gilles).
golfer(jean).
golfer(joe).
golfer(ghislain).

occupation(mason).
occupation(plasterer).
occupation(carpenter).
occupation(tinsmith).
occupation(roofer).


% computes possible scores
score(S):-
  between(64,84,S),
  0 is mod(S,2).

% all possible combinations of players and occupations (no constraints applied)
player(N,O,S):-
  golfer(N),
  occupation(O),
  score(S).

% constraints
constraintRoofer(L):-
  member(player(ghislain,_,72),L),
  member(player(_,roofer,74),L).

constraintMason(L):-
  member(player(gilles,_,82),L),
  member(player(_,mason,70),L).

constraintTinsmith(L):-
  member(player(joe,_,J),L),
  member(player(_,tinsmith,T),L),
  4 is (J - T).

constraintCarpenter(L):-
  member(player(jules,_,J),L),
  member(player(_,carpenter,C),L),
  8 is (C - J).

constraintWin(L):-
  member(player(_,tinsmith,T),L),
  member(player(_,mason,M),L),
  member(player(_,carpenter,C),L),
  member(player(_,roofer,R),L),
  member(player(_,plasterer,P),L),
  T < M,
  T < C,
  T < R,
  T < P.


% compute score
scores(player(N1,O1,S1),player(N2,O2,S2),player(N3,O3,S3),player(N4,O4,S4),player(N5,O5,S5)):-
  % create players
  score(S1),
  score(S2),
  score(S3),
  score(S4),
  score(S5),
  occupation(O1),
  occupation(O2),
  O2 \= O1,
  occupation(O3),
  O3 \= O1,
  O3 \= O2,
  occupation(O4),
  O4 \= O1,
  O4 \= O2,
  O4 \= O3,
  occupation(O5),
  O5 \= O1,
  O5 \= O2,
  O5 \= O3,
  O5 \= O4,
  % put in list
  append([],[player(N1,O1,S1),player(N2,O2,S2),player(N3,O3,S3),player(N4,O4,S4),player(N5,O5,S5)],List),
  % check constraints
  constraintRoofer(List),
  constraintMason(List),
  constraintTinsmith(List),
  constraintCarpenter(List),
  constraintWin(List).
