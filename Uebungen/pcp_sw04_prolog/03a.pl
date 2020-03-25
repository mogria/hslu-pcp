:- use_module(library(clpq)).
% 3.) CLP Rätsel lösen

% a.) Mutter / Tochter alter rätsel.
get_number_of_years(Y) :-
    {   D = 15,   % tochter 15,
        M = D * 3, % Mutter ist dann dreimal so alt
        DY = D + Y, % Nach Y vergangen Jahren ist die Tochter so alt
        MY = M + Y, % Nach Y vergangen Jahren ist die Mutter so alt
        MY = DY * 2 % Wann nach Y vergangen Jahren ist die Mutter nur noch doppelt so alt?
    }.

% ?- get_number_of_years(Y).
% Y = 15.
