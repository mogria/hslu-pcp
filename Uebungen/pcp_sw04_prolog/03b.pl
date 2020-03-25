:- use_module(library(clpfd)).
% 3.) CLP Rätsel lösen

% b.) Zahlenrätsel:
%  DONALD
% +GERALD
% -------
%  ROBERT
number_riddle([D,O,N,A,L,D] + [G,E,R,A,L,D] = [R,O,B,E,R,T]) :-
    Vars = [D,O,N,A,L,G,E,R,B,T],
    Vars ins 0..9,
    all_distinct(Vars),
            D*100000 + O*10000 + N*1000 + A*100 + L*10 + D +
            G*100000 + E*10000 + R*1000 + A*100 + L*10 + D #=
            R*100000 + O*10000 + B*1000 + E*100 + R*10 + T, % addition must be ok
    D #\= 0, G #\= 0,                    % numbers cannot start with zero
    label(Vars).                         % assign values to the variables


% As = [5, 2, 6, 4, 8, 5],
% Bs = [1, 9, 7, 4, 8, 5],
% Rs = [7, 2, 3, 9, 7, 0]
%
%
%  526'485]
%+ 197'485]
%----------
%  723'970]
