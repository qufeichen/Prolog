% leafNodes(Tree,L).
% program that finds all the leaf nodes of a binary tree, and returns them in a list

leafNodes(Tree,L):-
  leafNodes(Tree,[],L).

leafNodes(t(Root,Left,Right),L,LL):-
  Left = nil,
  Right = nil,
  append(L,Root,LL).

leafNodes(t(Root,Left,Right),L,LL):-
  Left \= nil,
  leafNodes(Left,L,LL).

leafNodes(t(Root,Left,Right),L,LL):-
    Right \= nil,
    leafNodes(Right,L,LL).
