:- use_module(library(clpq)).
% 3.) CLP Rätsel lösen
%     "Die Tochter ist 15 Jahre alt, die Mutter dreimal so alt. In wie vielen Jahren wird die Mutter nur 
%      noch doppelt so alt sein wie ihre Tochter?"
%
% a.) Mutter / Tochter alter rätsel.
get_number_of_years(Y) :-
    { Tochter   =   15,                 % Tochter ist 15,
      Mutter    =   Tochter * 3,        % Mutter ist dann dreimal so alt
      TochterY  =   Tochter + Y,        % Nach Y vergangen Jahren ist die Tochter so alt
      MutterY   =   Mutter + Y,         % Nach Y vergangen Jahren ist die Mutter so alt
      MutterY   =   TochterY * 2        % Wann nach Y vergangen Jahren ist die Mutter nur noch doppelt so alt?
    }.

% ?- get_number_of_years(Y).
% Y = 15.

