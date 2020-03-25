set_difference([], _, []).
set_difference(S1, [], S1).
set_difference([E | Tail], S2, D) :-
    \+ member(E, S2),
    !,
    [ X | DTail ] = D,
    E = X,
    set_difference(Tail, S2, DTail).
set_difference([_ | Tail], S2, D) :-
    set_difference(Tail, S2, D).

% ?- trace(set_difference).


% ?- set_difference([a, b, c, d], [b, d, e, f], [a, c]).
% true .
%
% ?- set_difference([1, 2, 3, 4, 5, 6], [2, 4, 6], L).
% L = [1, 3, 5] .
%

