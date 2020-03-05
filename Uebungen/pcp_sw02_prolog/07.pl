% Multiplikation duch rekursive addition

% a.) mult/3 wenn A & B > 0

%  mult(0, _, 0).
%  mult(_, 0, 0).
%  mult(A, B, Res) :-
%      A1 is A - 1,
%      mult(A1, B, Res1),
%      Res is B + Res1.

% b.) nur eine lösung, A & B > 0, für mult(0, 0, X), musste der eine fall noch entfernt werden

mult(0, _, 0).
mult(A, B, Res) :-
    A > 0, B > 0,
    A1 is A - 1,
    mult(A1, B, Res1),
    Res is B + Res1.
