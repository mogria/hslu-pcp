% Karte färben

neighbor(gelb, rot).
neighbor(gelb, gruen).
neighbor(rot, gruen).
neighbor(rot, gelb).
neighbor(gruen, rot).
neighbor(gruen, gelb).

colors(SZ, ZG, LU, NW, OW, UR) :-
    UR = gelb,
    SZ = rot, 
    neighbor(SZ, LU),
    neighbor(SZ, ZG),
    neighbor(SZ, NW),
    neighbor(SZ, UR),
    neighbor(LU, ZG),
    neighbor(LU, NW),
    neighbor(LU, OW),
    neighbor(NW, OW),
    neighbor(NW, UR),
    neighbor(OW, UR).


% ?- colors(SZ, ZG, LU, NW, OW, UR).
% SZ = OW, OW = rot,
% ZG = NW, NW = gruen,
% LU = UR, UR = gelb ;
% false.

% Passt keine gleiche farbe ist nun nebeneinander
