% Base case: LCS of anything with an empty list is an empty list
lcs(_, [], []).
lcs([], _, []).

% If the heads of both lists are the same, it's part of the LCS
lcs([X|Xs], [X|Ys], [X|Zs]) :-
    lcs(Xs, Ys, Zs).

% When the heads are different, we find the LCS of the two possibilities and choose the longer
lcs([X|Xs], [Y|Ys], Z) :-
    X \= Y,
    lcs([X|Xs], Ys, Z1),
    lcs(Xs, [Y|Ys], Z2),
    longer(Z1, Z2, Z).

% Helper predicate to determine the longer of two lists
longer(X, Y, X) :- length(X, Lx), length(Y, Ly), Lx >= Ly.
longer(X, Y, Y) :- length(X, Lx), length(Y, Ly), Lx < Ly.
