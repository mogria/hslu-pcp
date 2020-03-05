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

