:- use_module(library(clpr)). convert_clp(Celsius, Fahrenheit) :-
{ Celsius = (Fahrenheit - 32)*5/9 }.

%?- convert_clp(35, F).
%F = 95.0 

%?- convert_clp(C, 35).
%C = 1.6666666666666665 
