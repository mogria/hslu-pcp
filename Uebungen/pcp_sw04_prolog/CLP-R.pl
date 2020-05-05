:- use_module(library(clpr)). 

fib_clpr(N, F) :- { N = 0, F = 0}.
fib_clpr(N, F) :- { N = 1, F = 1}. 
fib_clpr(N, F) :- { N >= 2, F = F1 + F2, N1 = N - 1, N2 = N -2 },
                 fib_clpr(N1, F1),
                 fib_clpr(N2, F2).



% Import
% ?- use_module(library(clpr)).
% library(clpr) compiled into clpr 0.07 sec, 1,304 clauses
% true.
