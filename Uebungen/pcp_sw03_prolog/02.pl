:- dynamic fak_as/2.

% 2.) Memoization
% a.) Erweitere die Fakultät mit asserta/1 so, dass bereits berechnete Werte Zwischengespeichert werden.
%     Es soll auch ausgegeben werden, wenn ein Fakt bereits in der Wissensdatenbank gespeichert war.


 fak_as(0, 1).                             % base case 1  (Argument)
 fak_as(N, F) :-                           % general rule
     N > 0,                                % allow no negative numbers
     !,                                    % cut here so we don't get false as a second solution
     N1 is N - 1,                          % subtract N-1 and saves in N1
     fak_as(N1, F1),                       % call fak_as with new N1
     F is N * F1,                          % multplies F1 with N and saves in F
     asserta((fak_as(N, F) :-              % assert new fact into knowledge base on first place - saves already calculated values
         !,                                % cut here else we get multiple solutions for subsequent calls!!
         write('Hinweis: Fakultät von '),  % Konsolenausgabe
         write(N),                         % Konsoleneingabe
         write(' war gespeichert.'))).     % Konsolenausgabe


% b.) Mit fak_clear/0, kann man alle gespeicherten Fakten von oben wieder löschen mit retractall.

fak_clear :-                                    % Definition of the Predikat
                                                % Dieser retractall call entfernt auch die oben bei a.) definierten Prädikate,
                                                % das heisst wir müssen sie wieder hinzufügen und dieses Prädikat einmal abfragen.
    retractall(fak_as(_, _)),                   % Definition of retractall - hand over fak_as with anonymous variables (placeholders)
    assertz(fak_as(0, 1)),                      % Set new fact on last place in knowledge base
    assertz((fak_as(N, F) :-                    % Set new fact on last place in knowledge base
        N > 0,                                  % allows no negativ numbers
        !,                                      % cut here so we don't get false as a second solution
        N1 is N - 1,                            % subtract N-1 and saves in N1
        fak_as(N1, F1),                         % call fak_as with new N1
        F is N * F1,                            % multplies F1 with N and saves in F
        asserta((fak_as(N, F) :-                % Adds new rule/fact on first place in knowledge base
            !,                                  % cut here else we get multiple solutions for subsequent calls!!
            write('Hinweis: Fakultät von '),    % write in konsole
            write(N),                           % write in konsole
            write(' war gespeichert.')))        % write in konsole
        )),
    write('Hinweis: Alle gespeicherten Werte wurden gelöscht.'). % write in konsole

?- fak_clear.


% Shows every saved fact and rule of fak_as(3, X).
%?-listing(fak_as).
%:- (dynamic fak_as/2).
%
%fak_as(3, 6) :-
%   !,
%   write('Hinweis: Fakultät von '),
%   write(3),
%   write(' war gespeichert.').fak_as(2, 2) :-
%   !,
%   write('Hinweis: Fakultät von '),
%   write(2),
%   write(' war gespeichert.').fak_as(1, 1) :-
%   !,
%   write('Hinweis: Fakultät von '),
%   write(1),
%   write(' war gespeichert.').fak_as(0, 1).fak_as(A, C) :-
%   A>0,
%   !,
%   B is A+ -1,
%   fak_as(B, D),
%   C is A*D,
%   asserta((fak_as(A, C):-!, write('Hinweis: Fakultät von '), write(A), write(' war gespeichert.'))).true.


% Shows every fact and rule after fak_clear. Everything is deleted, it just stays the initial fact.
%?- fak_clear.
%Hinweis: Alle gespeicherten Werte wurden gelöscht.
%true.
%
%?- listing(fak_as).
%:- dynamic fak_as/2.
%
%fak_as(0, 1).
%fak_as(A, C) :-
%    A>0,
%    !,
%    B is A+ -1,
%    fak_as(B, D),
%    C is A*D,
%    asserta((fak_as(A, C):-!, write('Hinweis: Fakultät von '), write(A), write(' war gespeichert.'))).
%
%true.