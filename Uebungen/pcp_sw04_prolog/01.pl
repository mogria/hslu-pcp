:- use_module(library(clpq)).
% 1.) Fibonacci-Zahlen berechnen mit CLP-R
fib_clp(N, F) :- { N = 0, F = 0 }.
fib_clp(N, F) :- { N = 1, F = 1 }.
fib_clp(N, F) :- { N >= 2, F2 >= 0, F1 >= 1, F >= 1, F >= N - 1, F1 >= F2, F = F1+F2, N1 = N-1, N2 = N-2 },
    fib_clp(N1, F1),
    fib_clp(N2, F2).

% a.) Es wird ohne ende einfach weiter nach einer Lösung gesucht es gibt viel zu viele Möglichkeiten.
% b.) Die reelen Zahlen sind nicht endlich, und es wird nach einer weiteren Lösung gesucht, obwohl es keine gibt oder es einfach so viele möglichkeiten gibt..
%      Es gibt hier auch keine "Abbruchbedingung bei der suche nach möglichen F1 & F2. Auch negative und gleitkommazahlen sind möglich.
% c.) clpq modus, nur ganzzahlen, reduziert die anzahl möglichkeiten massiv.
%     Aber zusätzlich braucht es weitere constraints um die Möglichkeiten einzugrenzen.
%     Fügt man die constraints  F2 >= 0, F1 >= 1, F >= 1, F >= N - 1, F1 >= F2 hinzu findet der algorithmus jeweils schnell eine Lösung.
%     Auch für fib_clp(N, 12). und fib_clp(N,13)
%
%
%
% ?- trace(fib_clp).
