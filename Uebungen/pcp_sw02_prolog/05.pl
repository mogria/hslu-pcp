:- consult('01').

% Eigene Familien-Operatoren definieren

% a.)
:- op(1150, xfx, mother).

% ?- liz mother X.
% X = tom ;
% X = joe.

% b.)
:- op(1150, xfx, offspring).

% ?- ann offspring mike.
% true .


% Der /-Operator hat z.B. yfx als zweites Argument. Dies bedeutet das dieser links-assoziativ ist d.h. (16 / 4 / 2) ergibt 2 und nicht 8!.
