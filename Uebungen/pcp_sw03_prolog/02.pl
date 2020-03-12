:- dynamic fak_as/2.

% 2.) Memoization
% a.) Erweitere die Fakultät mit asserta/1 so, dass bereits berechnete Werte Zwischengespeichert werden.
%     Es soll auch ausgegeben werden, wenn ein Fakt bereits in der Wissensdatenbank gespeichert war.


% fak_as(0, 1).
% fak_as(N, F) :-
%     N > 0,
%     !, % cut here so we don't get false as a second solution
%     N1 is N - 1,
%     fak_as(N1, F1),
%     F is N * F1,
%     asserta((fak_as(N, F) :-
%         !, % cut here else we get multiple solutions for subsequent calls!!
%         write('Hinweis: Fakultät von '),
%         write(N),
%         write(' war gespeichert.'))).


% b.) Mit fak_clear/0, kann man alle gespeicherten Fakten von oben wieder löschen mit retractall.

fak_clear :-
    % Dieser retractall call entfernt auch die oben bei a.) definierten Prädikate,
    % das heisst wir müssen sie wieder hinzufügen und dieses Prädikat einmal abfragen.
    retractall(fak_as(_, _)),
    assertz(fak_as(0, 1)),
    assertz((fak_as(N, F) :-
        N > 0,
        !, % cut here so we don't get false as a second solution
        N1 is N - 1,
        fak_as(N1, F1),
        F is N * F1,
        asserta((fak_as(N, F) :-
            !, % cut here else we get multiple solutions for subsequent calls!!
            write('Hinweis: Fakultät von '),
            write(N),
            write(' war gespeichert.')))
        )),
    write('Hinweis: Alle gespeicherten Werte wurden gelöscht.').

?- fak_clear.
