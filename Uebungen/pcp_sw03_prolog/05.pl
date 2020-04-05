%warn(T) :- T < 80, write('Temperatur ok'), !.
%warn(T) :- T < 100, write('Temperatur sehr warm'), !.
%warn(_) :- write('Temperatur zu heiss').

%[trace]  ?- warn(120).
%  Call: (8) warn(120) ? creep                      % Aufruf mit 120C°
%  Call: (9) 120<80 ? creep                         % Prüft ob kleiner 80
%  Fail: (9) 120<80 ? creep                         % Falied
%  Redo: (8) warn(120) ? creep                      % Beginnt neu
%  Call: (9) 120<100 ? creep                        % Prüft ob kleiner 100
%  Fail: (9) 120<100 ? creep                        % Failed
%  Redo: (8) warn(120) ? creep                      % Hat nur noch eine Möglichkeit - Führt aus.
%  Call: (9) write('Temperatur zu heiss') ? creep
%Temperatur zu heiss
%  Exit: (9) write('Temperatur zu heiss') ? creep
%  Exit: (8) warn(120) ? creep
%true.


warn(T) :- T < 80, write('Temperatur ok').
warn(T) :- T >=  80,T < 100, write('Temperatur sehr warm').
warn(T) :- T >= 100, write('Temperatur zu heiss').


%[trace]  ?- warn(120).
%  Call: (8) warn(120) ? creep          % Aufruf mit 120C°
%  Call: (9) 120<80 ? creep             % Prüft ob kleiner 80ig
%  Fail: (9) 120<80 ? creep             % Failed
%  Redo: (8) warn(120) ? creep          % Beginnt von neuem
%  Call: (9) 120>=80 ? creep            % Prüft ob 120 grösser oder gleich 80
%  Exit: (9) 120>=80 ? creep            % Matched
%  Call: (9) 120<100 ? creep            % Prüft ob 120 < 100
%  Fail: (9) 120<100 ? creep            % Failed
%  Redo: (8) warn(120) ? creep          % Beginnt von neuem
%  Call: (9) 120>=100 ? creep           % Prüft ob 120 grösser gleich 100
%  Exit: (9) 120>=100 ? creep           % Matched
%  Call: (9) write('Temperatur zu heiss') ? creep % Aufruf der Warnung
%Temperatur zu heiss
%  Exit: (9) write('Temperatur zu heiss') ? creep
%  Exit: (8) warn(120) ? creep
%rue.