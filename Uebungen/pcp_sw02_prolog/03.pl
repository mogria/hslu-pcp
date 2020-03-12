% Kreuzworträstsel

% Discribe words
word(n, e, u).
word(t, o, p).
word(t, o, t).
word(b, r, o, t).
word(g, r, a, u).
word(h, a, l, t).
word(a, l, l, e).
word(j, e, t, z, t).
word(s, a, g, e, n).
word(u, n, t, e, n).
word(z, e, c, k, e).


% Discribe fields - Which fields have a solution - word definition are the restriction
solution(F12, F21, F22, F23, F24, F32, F34, F42, F43, F44, F45, F46) :-
    word(F12, F22, F32, F42),
    word(F21, F22, F23, F24),
    word(F24, F34, F44),
    word(F42, F43, F44, F45, F46).


% ?- solution(F12, F21, F22, F23, F24, F32, F34, F42, F43, F44, F45, F46).
% F12 = g,
% F21 = b,
% F22 = r,
% F23 = F34, F34 = o,
% F24 = F44, F44 = t,
% F32 = a,
% F42 = u,
% F43 = F46, F46 = n,
% F45 = e ;
%
%  |g| | | |
% b|r|o|t| |
%  |a| |o| |
%  |u|n|t|e|n
