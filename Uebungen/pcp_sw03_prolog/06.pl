% 6. Red Cut: Anzahl Lösungen einschränken
% 
% In der Vorlesung haben Sie gesehen, wie mit Hilfe des Listen-Zugehörigkeitsprädikats mem/2
% Permutationen erstellt werden können (Prolog 3, Folie 37). Wie dort gezeigt, geht das beispielsweise
% wie folgt für eine Liste der Länge 3 mit den drei Elementen a, b, und c:

% L = [_, _, _], mem(a, L), mem(b, L), mem(c, L).

% Ergänzen Sie obiges Code-Beispiel geeignet mit einem Cut-Operator, so dass nur eine Permutation
% erzeugt wird. Dieser Einsatz von einem Cut-Operator ist ein Beispiel für einen Red Cut. Wieso ist
% das so?

% Implementation von mem/2
mem(X, [X | _]).                        % element is at the beginning of the list, return true
mem(X, [_ | Tail]) :- mem(X, Tail).     % else search the rest of the list

% Folgender Befehl auf der Konsole liefert nur eine Lösung:
?- L = [_, _, _], mem(a, L), mem(b, L), mem(c, L), !.

% => Wieso ist dies hier ein Red cut?
%
% A:
% Gemäss Theorie: 
% Weil es die deklarative Bedeutung von dem Prädikat verändert. - Es werden dadurch gültige Lösungen
% abgeschnitten und nicht verwendet.

