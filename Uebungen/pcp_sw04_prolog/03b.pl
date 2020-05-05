:- use_module(library(clpfd)).                                      % Wertebereiche können festgelegt
% 3.) CLP Rätsel lösen

% b.) Zahlenrätsel:
%  DONALD
% +GERALD
% -------
%  ROBERT
number_riddle([D,O,N,A,L,D] + [G,E,R,A,L,D] = [R,O,B,E,R,T]) :-     % Definieren der Bedingung
    Vars = [D,O,N,A,L,G,E,R,B,T],                                   % Definieren der Variablen
    Vars ins 0..9,                                                  % Wertebereich der Variablen definieren
    all_distinct(Vars),                                             % Alle Variablen müssen je nach Position unterschiedlich sein (10er Schritt)
            D*100000 + O*10000 + N*1000 + A*100 + L*10 + D +
            G*100000 + E*10000 + R*1000 + A*100 + L*10 + D #=       % Vergleichsoperator (Präfix #)
            R*100000 + O*10000 + B*1000 + E*100 + R*10 + T,         % Addition muss korrekt sein wie oben im Beispiel
    D #\= 0, G #\= 0,                                               % Vergleichsoperator in CLP-FD Modus (Nummern dürfen nicht 0 sein)
    label(Vars).                                                    % Weist llen Variablen einer Liste Werte zu.
%
%
% ?- number_riddle(As+Bs=Rs).
% As = [5, 2, 6, 4, 8, 5],
% Bs = [1, 9, 7, 4, 8, 5],
% Rs = [7, 2, 3, 9, 7, 0]
%
%
%  526'485]
%+ 197'485]
%----------
%  723'970]
