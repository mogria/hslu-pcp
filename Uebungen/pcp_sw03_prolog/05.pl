% warn(T) :- T < 80, write('Temperatur ok'), !.
% warn(T) :- T < 100, write('Temperatur sehr warm'), !.
% warn(_) :- write('Temperatur zu heiss').


warn(T) :- T < 80, write('Temperatur ok').
warn(T) :- T >=  80,T < 100, write('Temperatur sehr warm').
warn(T) :- T >= 100, write('Temperatur zu heiss').
