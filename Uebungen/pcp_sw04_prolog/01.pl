:- use_module(library(clpr)).                       % Import der Libary CLP (Constraint Logic Programming)
% 1.) Fibonacci-Zahlen berechnen mit CLP-R
fib_clp(N, F) :- { N = 0, F = 0 }.                  % Bedingung
fib_clp(N, F) :- { N = 1, F = 1 }.                  % Bedingung
fib_clp(N, F) :- { 
    N >= 2,   
    F = F1 + F2,
    N1 = N-1, 
    N2 = N-2,
    F1 >= N1-1,
    F2 >= N2-2 
    },                                     % Zusätzliche Constraints
    fib_clp(N1, F1),                                % 
    fib_clp(N2, F2).

% CLP Bibliotheken geben die Werteberiche in Prolog für Variablen vor.
% CLP-R -->Steht für Reele Zahlen
% CLP-Q -->Steht für rationale Zahl

% Mit CLP klappt die Berechnung in beide Richtungen:
%
% Welche Fibo Zahl ist 6?
% ?- fib_clp(6, F).
% F = 8 
%
% Die wie vielte Zahl ist die Fibo Zahl 8?
% ?- fib_clp(N, 8).
% N = 6 

% a.) Es wird ohne Ende einfach weiter nach einer Lösung gesucht. Es gibt viel zu viele Möglichkeiten.

% b.) Die reelen Zahlen sind nicht endlich, und es wird nach einer weiteren Lösung gesucht, obwohl es keine gibt. --> Zuviele Möglichkeiten
%     Weiter gibt es hier auch keine "Abbruchbedingung bei der Suche nach möglichen F1 & F2. Auch negative und Gleitkommazahlen sind möglich.
%
%
% c.) Clpq Modus, nur Ganzzahlen, reduziert die Anzahl Möglichkeiten massiv.
%     Aber zusätzlich braucht es weitere Constraints um die Möglichkeiten einzugrenzen.
%     Fügt man die Constraints  F2 >= 0, F1 >= 1, F >= 1, F >= N - 1, F1 >= F2 hinzu findet der Algorithmus jeweils schnell eine Lösung.
%     Auch für fib_clp(N, 12). und fib_clp(N,13)
%
%
% ?- trace(fib_clp).
