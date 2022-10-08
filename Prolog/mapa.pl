color(1,verde).
color(2,azul).
color(3,amarillo).
color(4,rojo).
color(5,azul).

adyacente(1,2).
adyacente(1,3).
adyacente(1,4).
adyacente(1,5).
adyacente(2,3).
adyacente(2,4).
adyacente(3,4).
adyacente(4,5).

adyacente(X,Y):-
    adyacente(Y,X),!.

inconsistente(X, Y):-
    adyacente(X, Y),
    color(X, C1),
    color(Y, C1).

consistente:-
not(inconsistente(X, Y)).