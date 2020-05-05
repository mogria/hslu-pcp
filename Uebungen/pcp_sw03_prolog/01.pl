% 1.) Endrekursive Fibonacci Berechnung mit Ein- und Ausgabe
% Hier ein Beispiel-Aufruf von io_fib/0 in der Prolog-Konsole:
% ?- io_fib.
% Gib eine Zahl ein: 7.
% Die 7. Fibonacci-Zahl ist 13
%
%
%
%
%
fib_tr(N, F) :-
    fib_tr(N, 0, 1, F).                                 % call accumulator
fib_tr(0, A, _, A).                                     % simple case
fib_tr(N, A, B, F) :-                                   % general case
    N1 is N-1,                                          % new argument N1
    N1>=0,                                              % avoid underflow
    Sum is A+B,                                         % accumulator Sum
    fib_tr(N1, B, Sum, F).                              % tail-recursisve call


% Verwenden der Funktion durch Ein- und Ausgabe.
io_fib :-
    write('Gib eine Zahl ein: '),
    read(N),
    fib_tr(N, Result),
    write('Die '), write(N), write(te), write('. '),
    write('Fibonacci-Zahl ist '),
    write(Result), write(.).
