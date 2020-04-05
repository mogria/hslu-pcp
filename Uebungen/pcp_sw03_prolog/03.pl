% 3.) Listen
add(X, L, [ X | L ]). % Ein Element X am Anfang einer Liste hinzufügren (Explizites Prädikat)

% 3.) a.) add_tail/3, dass ein Element am  Ende der liste anfügt
add_tail(X, [], [X]).                           % Argument in the Knowledge base - what shoul happen if the list is empty
add_tail(X, [ E | Tail ], [ E | NewTail ]) :-   % Regeldefinition
    add_tail(X, Tail, NewTail).                 % Rekursiver Aufruf der Liste damit sie aufgesplitet wird in ihre Einzelteile -

% ?- add_tail(x, [a, b, c], L).
% L = [a, b, c, x].

%[trace]  ?- add_tail(x, [a, b], L1).
%  Call: (8) add_tail(x, [a, b], _8998) ? creep
%  Call: (9) add_tail(x, [b], _9220) ? creep
%  Call: (10) add_tail(x, [], _9226) ? creep
%  Exit: (10) add_tail(x, [], [x]) ? creep
%  Exit: (9) add_tail(x, [b], [b, x]) ? creep
%  Exit: (8) add_tail(x, [a, b], [a, b, x]) ? creep
%L1 = [a, b, x]



% 3.) b.) del/3 welches ein element aus einer liste entfernt, sollte sich gleich verhalten wie eingebauten delete/3
%
del([], _, []).                         % leere Listen, oder wenn X nicht enthalten
del([X | Tail], X, L1) :-               % element matched, dann löschen
    !, del(Tail, X, L1).                % cut here, because if the elements matches, the next rule which keeps the element should
                                        % not be executed
del([E | Tail], X, [E | NewTail]) :-    % element matched nicht, beibehalten
    del(Tail, X, NewTail).



% del([ X | Tail ], X, Tail) :-         % element in der liste wurde gefunden, also entfernen
% !, del(Tail, X, Tail).
% del([ _ | Tail ], X, L1) :-           % element wurde nicht in der liste gefunden, also beibehalten
% del(Tail, X, L1). 

% ?- del([a, b, c], c, L).
% L = [a, b]
% ?- del([], a, L).
% L = [].
%
% ?- del([a, b, c, a], a, L).
% L = [b, c].

% 3.) c.) Implementiere mem_d/2 mit hilfe von del/3 von oben(in einer Zeile möglich), zum testen ob ein element in der liste ist.

mem_d(E, L) :- del(L, E, L1), L = L1, !, fail.
mem_d(_, _) :- true.

% Alternativ mit not
% mem_d(E, L) :- not(del(L, E, L)).

% ?- mem_d(a, [a, b, c]).
% true .
% ?- mem_d(x, [a, b, c]).
% false.


% 3.) d.) Implementieren Sie ein Prädikat rev_acc(L, A, R) zum umdrehen einer liste mit einem akkumulator
rev_acc([], [], []).
rev_acc([Head | Tail], [], R) :- % if the accumulator is empty let's start accumulating, we only have one solution from here on.
    !, rev_acc(Tail, [Head], R).
rev_acc([Head | Tail], A, R) :-
    rev_acc(Tail, [Head | A], R).
rev_acc([], Acc, Rev) :- Rev = Acc. % if we have no more to reverse then the accumulator is the reverse of the list


% ?- rev_acc([a, b, c, d], [], L).
% L = [d, c, b, a].


% 3.) e.) rev/2 implementieren mithilfe von rev_acc/3

rev(L, R) :- rev_acc(L, [], R).

% ?- trace(rev_acc).

% ?- rev([1, 2, 3, 4, 5], R).
%   T Call: rev_acc([1, 2, 3, 4, 5], [], _7430)
%   T Call: rev_acc([2, 3, 4, 5], [1], _7430)
%   T Call: rev_acc([3, 4, 5], [2, 1], _7430)
%   T Call: rev_acc([4, 5], [3, 2, 1], _7430)
%   T Call: rev_acc([5], [4, 3, 2, 1], _7430)
%   T Call: rev_acc([], [5, 4, 3, 2, 1], _7430)
%   T Exit: rev_acc([], [5, 4, 3, 2, 1], [5, 4, 3, 2, 1])
%   T Exit: rev_acc([5], [4, 3, 2, 1], [5, 4, 3, 2, 1])
%   T Exit: rev_acc([4, 5], [3, 2, 1], [5, 4, 3, 2, 1])
%   T Exit: rev_acc([3, 4, 5], [2, 1], [5, 4, 3, 2, 1])
%   T Exit: rev_acc([2, 3, 4, 5], [1], [5, 4, 3, 2, 1])
%   T Exit: rev_acc([1, 2, 3, 4, 5], [], [5, 4, 3, 2, 1])
% R = [5, 4, 3, 2, 1].

