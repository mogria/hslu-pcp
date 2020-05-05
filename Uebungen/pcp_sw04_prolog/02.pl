% Es soll eiene Lösungsmenge (setDifference(Set1, Set2, SetDifference)) erstellt werden, 
% die in SetDifference alle Elemente hat, welche in Set1 sind jedoch nicht in Set2

set_difference([], _, []).                              % WissensDb: Es müssen Listen sein - Set2 intressiert noch nicht (anonyme Variable) 
set_difference(Set1, [], Set1).                         % WissensDb: Set1 und Differnez sind gleich. Was in Set1 enthalten ist, ist auch in Differenz enthalten
set_difference([Element | Tail], Set2, Differenz) :-    % Bedingung mit Split
    \+ member(Element, Set2),                           % Wenn Element ist in Set2 -->?- member(1,[1,2,1,3]). --> true \+ negation
    !,                                                  % Cut
    [ Element | DifferenzTail ] = Differenz,            % head Element und DiffTail = Differenz
    set_difference(Tail, Set2, DifferenzTail).          % Aufruf
set_difference([_ | Tail], Set2, Differenz) :-          % Tail wird der Methode übergeben - Wird nur ausgeführt wenn memmber negiert daher ein Cut
    set_difference(Tail, Set2, Differenz).              % Head von Set1 ist in Set2 daher intressiert Head Set1 nicht.


% ?- set_difference([a, b, c, d], [b, d, e, f], [a, c]).
% true .
%
% ?- set_difference([1, 2, 3, 4, 5, 6], [2, 4, 6], L).
% L = [1, 3, 5] .
%

