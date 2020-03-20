% 4.) Code mit und ohne Cut-Operator, vergleiche p/1 vom Unterricht mit & ohne cut

% rules
p(X):- a(X).
% p(X):- b(X), c(X). % without cut
p(X):- b(X), !, c(X). % with cut
p(X):- d(X).

% facts
a(1).
b(2). b(3).
c(2). c(3).
d(4).

?- trace(a).
?- trace(b).
?- trace(c).
?- trace(d).
?- trace(p).


% Suchbaum ohne cut:
% ?- p(X).
%  T Call: p(_6882)
%  T Call: a(_6882)
%  T Exit: a(1)
%  T Exit: p(1)
% X = 1 ;
%  T Redo: p(1)
%  T Call: b(_6882)
%  T Exit: b(2)
%  T Call: c(2) % no cut here!
%  T Exit: c(2)
%  T Exit: p(2)
% X = 2 ;
%  T Redo: p(2)
%  T Redo: b(2)
%  T Exit: b(3)
%  T Call: c(3)
%  T Exit: c(3)
%  T Exit: p(3)
% X = 3 ;
%  T Redo: p(3)
%  T Call: d(_6882)
%  T Exit: d(4)
%  T Exit: p(4)
% X = 4.


% Suchbaum mit cut
% ?- p(X).
%  T Call: p(_6882)
%  T Call: a(_6882)
%  T Exit: a(1)
%  T Exit: p(1)
% X = 1 ;
%  T Redo: p(1)
%  T Call: b(_6882)
%  T Exit: b(2)
%  T Call: c(2) % was cut here, so only 1 more solution from this branch on
%  T Exit: c(2)
%  T Exit: p(2)
% X = 2.

