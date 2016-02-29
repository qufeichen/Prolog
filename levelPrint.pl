% levelPrint(Tree, Level).
% program that finds all the nodes at a given level of a binary tree and prints them to console
% sample query:
% ?- treeA(T),levelPrint(T,2).

% sample tree
treeA(X):-X =
  t(73,
    t(31,
      t(5, nil, nil),
      nil),
    t(101,
      t(83,
        t(97, nil, nil),
        nil),
      nil)
  ).

% levelPrint
levelPrint(t(Root,Left,Right),X):-
  X = 1,
  write(Root),
  write(' ').

levelPrint(t(Root,Left,Right),X):-
  XX is (X-1),
  levelPrint(Left,XX),
  levelPrint(Right,XX).
