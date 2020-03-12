% 2.) Memoization
% a.) Erweitere die Fakultät mit asserta/1 so, dass bereits berechnete Werte Zwischengespeichert werden.
%     Es soll auch ausgegeben werden, wenn ein Fakt bereits in der Wissensdatenbank gespeichert war.

:- dynamic fak_as/2.
fak_as(0, 1).
fak_as(N, F) :-
    N > 0,
    N1 is N - 1,
    fak_as(N1, F1),
    F is N * F1,
    asserta((fak_as(N, F) :-
        !, % cut here else we get multiple solutions for subsequent calls!!
        write('Hinweis: Fakultät von '),
        write(N),
        write(' war gespeichert.'))).

