% a) Wie wird in SWI-Prolog der Term X is 16 / 4 / 2 ausgewertet? Erklären sie, weshalb das so ist.
% ?- A is (16 / 4 / 2).
% A = 2
%
% / ist ein infix operator. Wird dieser so zweimal hinterinander verwendet,
% wird erst 16 / 4 gerechnet, da / und / die gleiche präzedenz haben.

% b) Was ist die Antwort auf die Anfrage Y = 3, X = Y - 1 ?
% ?- Y = 3, X = Y - 1.
% Y = 3,
% X = 3-1.


% c) Was ist die Antwort auf die Anfrage Y = 3, X is Y - 1 ? Wie lässt sich das unterschiedliche Resultat gegenüber der Teilaufgabe b) erklären?

% ?- Y = 3, X is Y - 1.
% Y = 3,
% X = 2.
% Wird der infix operator `is/2` verwendet wird forciert das der rechte operand ausgewertet wird.
