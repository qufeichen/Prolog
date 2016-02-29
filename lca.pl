% lca(K1,K2,T).
% program that finds the lowest common ancestor of nodes K1 and K2 in Tree T
% program prints the subtree T such that the root of T is the lca of K1 and K2
%
% sample query:
% ?- treeA(X), lca(83,2016,X).

% sample tree
treeA(X):-X =
t(73,
  t(31,
    t(5,nil,nil),
    nil),
  t(101,
    t(83, nil,
      t(97,nil,nil)
      ),
    t(2016,nil,nil)
    )
  ).

% lca
lca(K1,K2,t(Root,Left,Right)):-
  K1 < Root,
  K2 < Root,
  lca(K1,K2,Left).

lca(K1,K2,t(Root,Left,Right)):-
  K1 > Root,
  K2 > Root,
  lca(K1,K2,Right).

lca(K1,K2,T):-
  write(T).
