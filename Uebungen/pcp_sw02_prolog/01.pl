female(mary). female(liz). female(mia). female(tina). female(ann). female(sue).% all females
male(mike). male(jack). male(fred). male(tom). male(joe). male(jim). % all males
parent(mary, mia). parent(mary, fred). parent(mary, tina). % all childern of mary
parent(mike, mia). parent(mike, fred). parent(mike, tina). % all children of mike
parent(liz, tom). parent(liz, joe). % allchildern of liz
parent(jack, tom). parent(jack, joe). % all childern of jack
parent(mia, ann). % all childern of mia
parent(tina, sue). parent(tina, jim). % all childern of tina
parent(tom, sue). parent(tom, jim). % all childern of tom


% a.) Prädikate mother/2 und father/2

mother(P, C) :-
    parent(P, C),
    female(P).

father(P, C) :-
    parent(P, C),
    male(P).


%% Beispiele aus der Aufgabe
% ?- mother(X, tina).
% X = mary .
%
% ?- father(X, sue).
% X = tom.
%
%% Mutter und Vater von jim
% ?- father(X, jim).
% X = tom.
% 
% ?- mother(X, jim).
% X = tina .

%% Alle Kinder von mary (man muss tab drücken im CLI von SWIPROLOG)
% ?- mother(mary, X).
% X = mia ;
% X = fred ;
% X = tina.

% b.)

