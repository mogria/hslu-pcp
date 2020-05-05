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

% b.) sibling/2

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y).

% is correct but returns multiple trues. maybe better solution could be made with machting.


% ?- sibling(mia, fred)
% |    .
% true .
% 
% ?- sibling(tom, jack).
% false.


% c.) grandmother/2

grandmother(X, Y) :-
    mother(X, Z),
    parent(Z, Y).

grandfather(X, Y) :-
    father(X, Z),
    parent(Z, Y).

% ?- grandmother(X, ann)
% |    .
% X = mary ;
% false.
% 
% ?- grandmother(liz, X).
% X = sue ;
% X = jim ;
% false.

% ?- grandmother(X, jim).
% X = mary ;
% X = liz ;
% false.

% d.) offspring/2 (ancestor, origin)

offspring(C, P) :- parent(P, C).
offspring(C, P) :-
    parent(X, C),
    offspring(X, P).


% ?- offspring(ann, mary).
% true .

% ?- offspring(sue, X).
% X = tina ;
% X = tom ;
% X = mary ;
% X = mike ;
% X = liz ;
% X = jack ;
% false.
